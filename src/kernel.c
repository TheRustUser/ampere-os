#include "uart.h"
#include "device.h"

void kernel_start(void) {
    device_t uart_device = { UART_ADDR, write_uart };
    vprintf(&uart_device, "Hello, World!\n");
}
