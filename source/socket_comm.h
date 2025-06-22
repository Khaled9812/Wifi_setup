#ifndef SOCKET_COMM_H
#define SOCKET_COMM_H

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Connect to a remote host.
 *
 * @param ip The IP address as a string.
 * @param port The remote port.
 * @return The connected socket descriptor on success, or -1 on error.
 */
int socket_comm_connect(const char *ip, uint16_t port);

/**
 * @brief Send a message on a connected socket.
 *
 * @param sock The connected socket descriptor.
 * @param msg The message to send.
 * @return The number of bytes sent, or -1 on error.
 */
int socket_comm_send(int sock, const char *msg);

/**
 * @brief Receive a message from the socket.
 *
 * This function attempts a non-blocking read on the socket.
 *
 * @param sock The connected socket descriptor.
 * @param buffer Out buffer to store the received message.
 * @param buf_size The size of the buffer.
 * @return The number of bytes received, 0 if the connection is closed, or -1 on error.
 */
int socket_comm_receive(int sock, char *buffer, uint32_t buf_size);

/**
 * @brief Close the socket.
 *
 * @param sock The socket descriptor.
 */
void socket_comm_close(int sock);

#ifdef __cplusplus
}
#endif

#endif /* SOCKET_COMM_H */
