
/***********************************************************************
 *  wifi_setup.c
 *
 *  @brief Wi‑Fi Setup Demo – Echo-Enabled
 *
 *  This application initializes the Wi‑Fi stack and then delegates user
 *  interactions (starting an AP, joining a network, scanning, etc.) to
 *  the Wi‑Fi prompt module.
 *
 *  SPDX-License-Identifier: BSD-3-Clause
 ***********************************************************************/
#include "board.h"
#include "fsl_debug_console.h"
#include "osa.h"
#include "wpl.h"
#include "wifi-promt.h"

extern void BOARD_InitHardware(void);

#define MAIN_TASK_STACK_DEPTH   800U
#define MAIN_TASK_PRIORITY      0U

static TaskHandle_t mainTaskHandle;

static void main_task(void *param)
{
    (void)param;

    PRINTF("\r\nStarting Wi-Fi Setup Demo (Echo-Enabled)\r\n");

    if (WPL_Init() != WPLRET_SUCCESS || WPL_Start(LinkStatusChangeCallback) != WPLRET_SUCCESS)
    {
        PRINTF("[!] Failed to initialize Wi‑Fi stack\r\n");
        __BKPT(0);
    }
    PRINTF("[i] Wi-Fi stack initialized successfully\r\n");

    /* Run the prompt module; this call does not return */
    wifi_promt_run();
}

int main(void)
{
    BOARD_InitHardware();

    if (xTaskCreate(main_task, "main_task", MAIN_TASK_STACK_DEPTH, NULL, MAIN_TASK_PRIORITY, &mainTaskHandle) != pdPASS)
    {
        PRINTF("[!] Failed to create main task\r\n");
        while (true) { }
    }

    vTaskStartScheduler();

    while (true) { }
}
