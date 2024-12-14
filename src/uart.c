#include "uart.h"

volatile uint8_t *UART = (uint8_t *) 0x09000000;

void vprintc_uart(char c) {
    *UART = c;
}

void vprintf_uart(const char* data) {
    while (*data) {
        vprintc_uart(*data);
        data++;
    }
}