/***********************************************************************
 *  wifi-promt.c
 *
 *  @brief Wi‑Fi Prompt Module – Echo‑Enabled User Input for Wi‑Fi Setup
 *
 *  This file implements the Wi‑Fi prompt module that handles user input,
 *  network scanning, Wi‑Fi connection management, and a messaging mode.
 *

 *
 *  SPDX‑License‑Identifier: BSD‑3‑Clause
 ***********************************************************************/

#include "wifi-promt.h"
#include "board.h"
#include "fsl_debug_console.h"
#include "lwip/tcpip.h"
#include "ping.h"
#include "app.h"
#include "osa.h"
#include "fsl_os_abstraction.h"
#include "socket_comm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "errno.h"  /* For EWOULDBLOCK/EAGAIN */

#define WPL_AP_CHANNEL  1U

typedef enum
{
    MODE_NONE = 0,
    MODE_AP,
    MODE_STA
} wifi_mode_t;

static char global_ssid[WPL_WIFI_SSID_LENGTH];
static char global_password[WPL_WIFI_PASSWORD_LENGTH];
static ip4_addr_t pingIp;
static wifi_mode_t currentMode = MODE_NONE;

/* Flag indicating if messaging is running */
static volatile int messagingRunning = 0;

/* Forward declaration for helper function */
static void read_line(char *buf, size_t len);

static void waitForInitialUserInput(void)
{
    char dummy[8];
    PRINTF("\r\nPress <Enter> to start the Wi‑Fi Setup Demo…\r\n");
    read_line(dummy, sizeof(dummy));
}

static void printOwnIPAddress(void)
{
    char ipStr[16] = {0};
    if (WPL_GetIP(ipStr, 1) == WPLRET_SUCCESS)
    {
        PRINTF("[i] Device IP Address: %s\r\n", ipStr);
    }
    else
    {
        PRINTF("[!] Failed to obtain IP address\r\n");
    }
}

static void read_line(char *buf, size_t len)
{
    size_t idx = 0;
    if (!buf || !len)
        return;
    while (1)
    {
        int ch = GETCHAR();
        if ((ch == '\r') || (ch == '\n'))
        {
            PUTCHAR('\r');
            PUTCHAR('\n');
            buf[idx] = '\0';
            return;
        }
        if ((ch == 0x08) || (ch == 0x7F))
        {
            if (idx > 0)
            {
                idx--;
                PUTCHAR('\b');
                PUTCHAR(' ');
                PUTCHAR('\b');
            }
            continue;
        }
        if (idx < (len - 1))
        {
            buf[idx++] = (char)ch;
            PUTCHAR(ch);
        }
    }
}

int wifi_create_ap(const char *ssid, const char *password)
{
    if (!ssid || !password)
    {
        PRINTF("[!] Invalid AP parameters\r\n");
        return -1;
    }
    strncpy(global_ssid, ssid, sizeof(global_ssid) - 1);
    strncpy(global_password, password, sizeof(global_password) - 1);
    global_ssid[sizeof(global_ssid) - 1] = '\0';
    global_password[sizeof(global_password) - 1] = '\0';
    PRINTF("\r\n[i] Starting AP…\r\n");
    if (WPL_Start_AP(global_ssid, global_password, WPL_AP_CHANNEL) == WPLRET_SUCCESS)
    {
        PRINTF("[i] AP '%s' on channel %d started\r\n", global_ssid, WPL_AP_CHANNEL);
        currentMode = MODE_AP;
        return 0;
    }
    PRINTF("[!] Failed to start AP\r\n");
    return -1;
}

int wifi_connect_ssid(const char *ssid, const char *password)
{
    if (!ssid || !password)
    {
        PRINTF("[!] Invalid network parameters\r\n");
        return -1;
    }
    strncpy(global_ssid, ssid, sizeof(global_ssid) - 1);
    strncpy(global_password, password, sizeof(global_password) - 1);
    global_ssid[sizeof(global_ssid) - 1] = '\0';
    global_password[sizeof(global_password) - 1] = '\0';
    if (WPL_AddNetwork(global_ssid, global_password, global_ssid) != WPLRET_SUCCESS)
    {
        PRINTF("[!] Could not add network profile\r\n");
        return -1;
    }
    PRINTF("\r\n[i] Joining '%s'…\r\n", global_ssid);
    if (WPL_Join(global_ssid) == WPLRET_SUCCESS)
    {
        PRINTF("[i] Joined '%s'\r\n", global_ssid);
        currentMode = MODE_STA;
        printOwnIPAddress();
        return 0;
    }
    PRINTF("[!] Join failed\r\n");
    WPL_RemoveNetwork(global_ssid);
    return -1;
}

void wifi_list_ssids(void)
{
    PRINTF("\r\nScanning…\r\n");
    char *networks = WPL_Scan();
    if (networks)
    {
        vPortFree(networks);
    }
    else
    {
        PRINTF("[!] No networks found or scan error\r\n");
    }
}

void prompt_for_ping_address(void)
{
    char ipString[IP4ADDR_STRLEN_MAX];
    PRINTF("\r\nEnter host/IP to ping: ");
    read_line(ipString, sizeof(ipString));
    if (ipaddr_aton(ipString, &pingIp))
    {
        PRINTF("\r\n[i] Pinging %s…\r\n", ipString);
        ping_init(&pingIp);
    }
    else
    {
        PRINTF("[!] Invalid IPv4 address\r\n");
    }
}

/* --------------------- Messaging Mode --------------------- */

/* The messaging receive task runs in a separate thread */
static void messaging_recv_task(void *arg)
{
    int sock = *(int *)arg;
    char recv_buf[128];
    int len;
    while (messagingRunning)
    {
        memset(recv_buf, 0, sizeof(recv_buf));
        len = socket_comm_receive(sock, recv_buf, sizeof(recv_buf));
        if (len > 0)
        {
            PRINTF("\r\n[Received]: %s\r\n", recv_buf);
        }
        else if (len == 0)
        {
            PRINTF("\r\n[Received]: Connection closed by peer.\r\n");
            break;
        }
        else if (len < 0)
        {
            if (errno != EWOULDBLOCK && errno != EAGAIN)
            {
                PRINTF("\r\n[Received]: Socket error %d\r\n", errno);
                break;
            }
        }
        OSA_TimeDelay(100);
    }
    /* Task exits */
}

void messaging_mode(void)
{
    char target_ip[16];
    char port_str[8];
    int port, sock;
    char send_buf[128];
    osa_task_handle_t recvTaskHandle = 0;

    PRINTF("\r\n--- Messaging Mode ---\r\n");
    PRINTF("Enter target IP address: ");
    read_line(target_ip, sizeof(target_ip));
    PRINTF("Enter target port: ");
    read_line(port_str, sizeof(port_str));
    port = atoi(port_str);
    if (port <= 0)
    {
        PRINTF("[!] Invalid port number\r\n");
        return;
    }
    sock = socket_comm_connect(target_ip, (uint16_t)port);
    if (sock < 0)
    {
        return;
    }
    PRINTF("[i] Connected. Type messages to send.\r\n");
    PRINTF("To exit messaging mode, type -exit or \"exit\".\r\n");

    messagingRunning = 1;

    osa_task_def_t messaging_task_def = {
        .tname     = "MSG_RX",
        .stacksize = 1024,
        .tpriority = OSA_PRIORITY_NORMAL,
        .pthread   = messaging_recv_task
    };

    if (OSA_TaskCreate(&recvTaskHandle, &messaging_task_def, (void *)&sock) != kStatus_Success)
    {
        PRINTF("[!] Failed to create receiving task\r\n");
        messagingRunning = 0;
        socket_comm_close(sock);
        return;
    }

    while (1)
    {
        PRINTF("\r\nMessage: ");
        read_line(send_buf, sizeof(send_buf));
        if ((strcmp(send_buf, "-exit") == 0) || (strcmp(send_buf, "\"exit\"") == 0))
        {
            PRINTF("[i] Exiting messaging mode...\r\n");
            messagingRunning = 0;
            break;
        }
        if (socket_comm_send(sock, send_buf) < 0)
        {
            PRINTF("[!] Send failed\r\n");
            messagingRunning = 0;
            break;
        }
    }
    socket_comm_close(sock);
    OSA_TimeDelay(200); /* Give the receive task time to exit */
}

/* --------------------- Menu System --------------------- */

static void displayMenu(void)
{
    PRINTF("\r\n========== Wi‑Fi Setup Menu ==========\r\n");
    PRINTF("1. Start Access‑Point\r\n");
    PRINTF("2. Join Network (Station)\r\n");
    PRINTF("3. Disconnect / Stop\r\n");
    PRINTF("4. Ping Host\r\n");
    PRINTF("5. Scan Networks\r\n");
    PRINTF("6. Exit Demo\r\n");
    PRINTF("7. Messaging\r\n");
    PRINTF("Select option: ");
}

static void processMenuOption(void)
{
    char opt[4];
    read_line(opt, sizeof(opt));
    PRINTF("\r\n");
    switch (opt[0])
    {
        case '1':
        {
            char ap_ssid[WPL_WIFI_SSID_LENGTH];
            char ap_pass[WPL_WIFI_PASSWORD_LENGTH];
            PRINTF("\r\nEnter SSID for Access‑Point: ");
            read_line(ap_ssid, sizeof(ap_ssid));
            PRINTF("\r\nEnter Password (≥%d chars, or blank for open): ", WPL_WIFI_PASSWORD_MIN_LEN);
            read_line(ap_pass, sizeof(ap_pass));
            (void)wifi_create_ap(ap_ssid, ap_pass);
            break;
        }
        case '2':
        {
            char sta_ssid[WPL_WIFI_SSID_LENGTH];
            char sta_pass[WPL_WIFI_PASSWORD_LENGTH];
            PRINTF("\r\nEnter SSID to join: ");
            read_line(sta_ssid, sizeof(sta_ssid));
            PRINTF("\r\nEnter Password (or blank if open): ");
            read_line(sta_pass, sizeof(sta_pass));
            (void)wifi_connect_ssid(sta_ssid, sta_pass);
            break;
        }
        case '3':
            if (currentMode == MODE_AP && WPL_Stop_AP() == WPLRET_SUCCESS)
            {
                PRINTF("[i] AP stopped\r\n");
                currentMode = MODE_NONE;
            }
            else if (currentMode == MODE_STA && WPL_Leave() == WPLRET_SUCCESS)
            {
                PRINTF("[i] Disconnected\r\n");
                WPL_RemoveNetwork(global_ssid);
                currentMode = MODE_NONE;
            }
            else
            {
                PRINTF("[i] Nothing to disconnect\r\n");
            }
            break;
        case '4':
            prompt_for_ping_address();
            break;
        case '5':
            wifi_list_ssids();
            break;
        case '6':
            PRINTF("Exiting demo. Stopping any active connection…\r\n");
            if (currentMode == MODE_AP)
                WPL_Stop_AP();
            else if (currentMode == MODE_STA)
            {
                WPL_Leave();
                WPL_RemoveNetwork(global_ssid);
            }
            vTaskEndScheduler();
            break;
        case '7':
            messaging_mode();
            break;
        default:
            PRINTF("Invalid option\r\n");
            break;
    }
}

void wifi_promt_run(void)
{
    waitForInitialUserInput();
    while (true)
    {
        displayMenu();
        processMenuOption();
        OSA_TimeDelay(500);
    }
}

void LinkStatusChangeCallback(bool linkState)
{
    PRINTF("%s\r\n", (linkState) ? "-------- LINK REESTABLISHED --------"
                                 : "-------- LINK LOST --------");
}
