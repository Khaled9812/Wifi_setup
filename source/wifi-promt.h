#ifndef WIFI_PROMT_H
#define WIFI_PROMT_H

#include "wpl.h"
#include "lwip/ip4_addr.h"
#include <stdbool.h>
#include <stddef.h>

/* Public API for the Wi‑Fi prompt module.
 * This module handles user input (with echo), scanning, connecting, and other
 * Wi‑Fi related UI operations.
 *
 * Public functions:
 *   - wifi_promt_run: Runs the main prompt loop.
 *   - LinkStatusChangeCallback: Reports Wi‑Fi link status changes.
 *   - wifi_create_ap: Starts an Access Point with the given SSID and password.
 *   - wifi_connect_ssid: Connects to a Wi‑Fi network using the provided SSID and password.
 *   - wifi_list_ssids: Scans for available networks.
 *   - prompt_for_ping_address: Prompts the user for an IP/host to perform a ping test.
 */

/* Initializes and runs the Wi‑Fi prompt menu. This function does not return. */
void wifi_promt_run(void);

/* Callback for reporting Wi‑Fi link status changes.
 * Intended to be passed to WPL_Start().
 */
void LinkStatusChangeCallback(bool linkState);

/* Creates an Access Point based on the provided SSID and password.
 * Returns 0 on success and a non-zero value on failure.
 */
int wifi_create_ap(const char *ssid, const char *password);

/* Connects to a Wi‑Fi network using the provided SSID and password.
 * Returns 0 on success and a non-zero value on failure.
 */
int wifi_connect_ssid(const char *ssid, const char *password);

/* Scans for available networks and optionally prints the results.
 */
void wifi_list_ssids(void);

/* Prompts the user for an IP/host (via UART) and initiates a ping test.
 */
void prompt_for_ping_address(void);

#endif /* WIFI_PROMT_H */
