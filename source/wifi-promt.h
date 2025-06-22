#ifndef WIFI_PROMT_H
#define WIFI_PROMT_H

#include "wpl.h"
#include "lwip/ip4_addr.h"
#include <stdbool.h>
#include <stddef.h>

/* Public API for the Wi‑Fi prompt module.
 * This module handles user input (with echo), scanning, connecting,
 * messaging, and other Wi‑Fi related UI operations.
 *
 * Public functions:
 *   - wifi_promt_run: Runs the main prompt loop.
 *   - LinkStatusChangeCallback: Reports Wi‑Fi link status changes.
 *   - wifi_create_ap: Creates an Access Point using a given SSID and password.
 *   - wifi_connect_ssid: Connects to a Wi‑Fi network using a given SSID and password.
 *   - wifi_list_ssids: Scans for available networks.
 *   - prompt_for_ping_address: Prompts for an IP/host and starts a ping test.
 *   - messaging_mode: Starts a messaging session with a specified target IP and port.
 */

/* Initiates and runs the Wi‑Fi prompt menu. This function does not return. */
void wifi_promt_run(void);

/* Callback to report Wi‑Fi link status changes.
 * This function is intended to be passed to WPL_Start().
 */
void LinkStatusChangeCallback(bool linkState);

/* Creates an Access Point using the provided SSID and password.
 * Returns 0 on success, non-zero on failure.
 */
int wifi_create_ap(const char *ssid, const char *password);

/* Connects to a Wi‑Fi network using the provided SSID and password.
 * Returns 0 on success, non-zero on failure.
 */
int wifi_connect_ssid(const char *ssid, const char *password);

/* Scans for available networks (results are freed internally). */
void wifi_list_ssids(void);

/* Prompts the user for an IP/host and initiates a ping test. */
void prompt_for_ping_address(void);

/* Starts a messaging session.
 * The session prompts for target IP and port, then connects and enters a chat loop.
 * Communication is via a TCP client socket.
 */
void messaging_mode(void);

#endif /* WIFI_PROMT_H */
