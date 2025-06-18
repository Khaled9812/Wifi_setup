/***********************************************************************
 *  wifi-promt.c
 *
 *  @brief Wi‑Fi Prompt Module – Echo-Enabled User Input for Wi‑Fi Setup
 *
 *  This file contains the implementation of the Wi‑Fi prompt module which
 *  handles user input (with character echoing), network scanning, and Wi‑Fi
 *  connection management. It provides functions that prompt the user to
 *  start an access point, join a network in station mode, disconnect,
 *  ping a host, or scan for available networks.
 *
 *  The module uses blocking UART read calls (GETCHAR) and immediate echoing
 *  (via PUTCHAR) to provide feedback to the user as characters are typed.
 *
 *  Functions in this file:
 *      - read_line: Reads a line from UART with echo and basic editing.
 *      - waitForInitialUserInput: Blocks until the user presses <Enter>.
 *      - printOwnIPAddress: Retrieves and prints the device's IP in STA mode.
 *      - wifi_create_ap: Prompts for AP parameters and creates an Access Point.
 *      - wifi_connect_ssid: Connects to a Wi‑Fi network using provided parameters.
 *      - wifi_list_ssids: Scans for available networks.
 *      - prompt_for_ping_address: Prompts for an IP/host and starts a ping test.
 *      - displayMenu: Displays the main menu to the user.
 *      - processMenuOption: Processes the user's menu selection.
 *      - wifi_promt_run: Runs the main prompt loop.
 *      - LinkStatusChangeCallback: Callback to report link status changes.
 *
 *  SPDX-License-Identifier: BSD-3-Clause
 ***********************************************************************/

#include "wifi-promt.h"
#include "board.h"
#include "fsl_debug_console.h"
#include "lwip/tcpip.h"
#include "ping.h"
#include "app.h"
#include "osa.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* ------------------ Local Definitions ------------------ */
#define WPL_AP_CHANNEL  1U

/**
 * @brief Enum representing the current Wi‑Fi mode.
 */
typedef enum
{
    MODE_NONE = 0,  /**< No active connection */
    MODE_AP,        /**< Access Point mode */
    MODE_STA        /**< Station mode */
} wifi_mode_t;

/* ------------------ Local Variables -------------------- */
static char global_ssid[WPL_WIFI_SSID_LENGTH];         /**< Buffer to store SSID */
static char global_password[WPL_WIFI_PASSWORD_LENGTH]; /**< Buffer to store password */
static ip4_addr_t pingIp;                       /**< IP address for ping test */
static wifi_mode_t currentMode = MODE_NONE;     /**< Current Wi‑Fi mode */

/* ------------------ Helper Functions --------------------- */

/**
 * @brief Reads a line of input from the UART.
 *
 * This function blocks until a line ending ('\r' or '\n') is received.
 * It echoes each character immediately, handles backspace (DEL) for editing,
 * and terminates the input string with a null character.
 *
 * @param buf Buffer to store the input characters.
 * @param len Length of the buffer.
 *
 * @return void.
 */
static void read_line(char *buf, size_t len)
{
    size_t idx = 0;
    if (!buf || !len)
        return;

    while (1)
    {
        int ch = GETCHAR();  /* Blocking call from UART */

        if ((ch == '\r') || (ch == '\n'))
        {   /* Terminate line when Enter is pressed */
            PUTCHAR('\r');
            PUTCHAR('\n');
            buf[idx] = '\0';
            return;
        }

        if ((ch == 0x08) || (ch == 0x7F))  /* Handle Backspace/DEL */
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

/**
 * @brief Waits for the user to press <Enter> before continuing.
 *
 * This function is used to ensure that the user is ready to start
 * the Wi‑Fi Setup Demo.
 *
 * @return void.
 */
static void waitForInitialUserInput(void)
{
    char dummy[8];
    PRINTF("\r\nPress <Enter> to start the Wi‑Fi Setup Demo…\r\n");
    read_line(dummy, sizeof(dummy));
}

/**
 * @brief Retrieves and prints the device's IP address.
 *
 * This function calls WPL_GetIP to obtain the device's IP address
 * (for station mode) and prints it out. If unsuccessful, it prints an error.
 *
 * @return void.
 */
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

/* --------------------- Public Wi‑Fi Functions --------------------- */

/**
 * @brief Creates an Access Point using provided SSID and password.
 *
 * This function starts an Access Point with the given parameters.
 *
 * @param ssid The SSID to use for the Access Point.
 * @param password The password for the Access Point (or an empty string for open mode).
 *
 * @return 0 on success, non-zero on failure.
 */
int wifi_create_ap(const char *ssid, const char *password)
{
    if (!ssid || !password)
    {
        PRINTF("[!] Invalid AP parameters\r\n");
        return -1;
    }

    /* Copy parameters to global buffers for potential later use */
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
    else
    {
        PRINTF("[!] Failed to start AP\r\n");
        return -1;
    }
}

/**
 * @brief Connects to a Wi‑Fi network using provided SSID and password.
 *
 * This function adds the network profile and attempts to join the network,
 * then prints the device's IP address on success.
 *
 * @param ssid The SSID of the network to join.
 * @param password The password for the network (or an empty string if open).
 *
 * @return 0 on success, non-zero on failure.
 */
int wifi_connect_ssid(const char *ssid, const char *password)
{
    if (!ssid || !password)
    {
        PRINTF("[!] Invalid network parameters\r\n");
        return -1;
    }

    /* Copy parameters to global buffers for potential later use */
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
    else
    {
        PRINTF("[!] Join failed\r\n");
        WPL_RemoveNetwork(global_ssid);
        return -1;
    }
}

/**
 * @brief Scans for available Wi‑Fi networks.
 *
 * This function initiates a scan for networks using WPL_Scan().
 * Currently, the scan results are freed without being printed.
 *
 * @return void.
 */
void wifi_list_ssids(void)
{
    PRINTF("\r\nScanning…\r\n");
    char *networks = WPL_Scan();
    if (networks)
    {
        /* Optionally, add code here to print networks info */
        vPortFree(networks);
    }
    else
    {
        PRINTF("[!] No networks found or scan error\r\n");
    }
}

/**
 * @brief Prompts the user for an IP/host and initiates a ping test.
 *
 * Reads an IP address or hostname from the UART and starts a ping test
 * using ping_init() if the address is valid.
 *
 * @return void.
 */
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

/* --------------------- Menu System --------------------- */

/**
 * @brief Displays the main Wi‑Fi Setup menu options.
 *
 * This function prints the available choices (start AP, join network, etc.)
 * to the UART.
 *
 * @return void.
 */
static void displayMenu(void)
{
    PRINTF("\r\n========== Wi‑Fi Setup Menu ==========\r\n");
    PRINTF("1. Start Access-Point\r\n");
    PRINTF("2. Join Network (Station)\r\n");
    PRINTF("3. Disconnect / Stop\r\n");
    PRINTF("4. Ping Host\r\n");
    PRINTF("5. Scan Networks\r\n");
    PRINTF("6. Exit Demo\r\n");
    PRINTF("Select option: ");
}

/**
 * @brief Reads and processes the user's menu selection.
 *
 * Based on the user's selection from the menu, this function calls the
 * appropriate Wi‑Fi function. It also handles disconnecting the current
 * connection and exiting the demo.
 *
 * @return void.
 */
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
            PRINTF("\r\nEnter SSID for Access Point: ");
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
        default:
            PRINTF("Invalid option\r\n");
            break;
    }
}

/* --------------------- Public API Implementation --------------------- */

/**
 * @brief Runs the Wi‑Fi prompt menu.
 *
 * This function blocks and continuously listens for user input,
 * displaying the menu and processing the selected options.
 *
 * @return void.
 */
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

/* --------------------- Link Status Callback --------------------- */

/**
 * @brief Callback function for reporting Wi‑Fi link status.
 *
 * Prints a message indicating whether the link was reestablished or lost.
 *
 * @param linkState Boolean value where true means link reestablished and
 *                  false means link lost.
 *
 * @return void.
 */
void LinkStatusChangeCallback(bool linkState)
{
    PRINTF("%s\r\n", (linkState) ? "-------- LINK REESTABLISHED --------"
                                 : "-------- LINK LOST --------");
}
