#include "socket_comm.h"
#include "lwip/sockets.h"
#include "lwip/inet.h"
#include <string.h>
#include <errno.h>
#include "fsl_debug_console.h"

int socket_comm_connect(const char *ip, uint16_t port)
{
    int sock;
    struct sockaddr_in addr;

    sock = lwip_socket(AF_INET, SOCK_STREAM, 0);
    if (sock < 0)
    {
        PRINTF("[!] Failed to create socket\r\n");
        return -1;
    }
    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_port = lwip_htons(port);
    if (inet_aton(ip, &addr.sin_addr) == 0)
    {
        PRINTF("[!] Invalid IP address: %s\r\n", ip);
        lwip_close(sock);
        return -1;
    }
    if (lwip_connect(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0)
    {
        PRINTF("[!] Connection to %s:%d failed\r\n", ip, port);
        lwip_close(sock);
        return -1;
    }
    return sock;
}

int socket_comm_send(int sock, const char *msg)
{
    int len = lwip_send(sock, msg, strlen(msg), 0);
    if (len < 0)
    {
        PRINTF("[!] Send failed: %d\r\n", errno);
        return -1;
    }
    return len;
}

int socket_comm_receive(int sock, char *buffer, uint32_t buf_size)
{
    int len = lwip_recv(sock, buffer, buf_size - 1, MSG_DONTWAIT);
    if (len > 0)
    {
        buffer[len] = '\0';
    }
    return len;
}

void socket_comm_close(int sock)
{
    lwip_close(sock);
}
