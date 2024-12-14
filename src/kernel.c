#include "uart.h"
#include "device.h"

void kernel_start(void) {
    VirtualDevice uart_device = { vprintc_uart };
    vprintf(&uart_device, "Hello, World!\n");
}
