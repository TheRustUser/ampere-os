#ifndef UART_H
#define UART_H

#include <stdint.h>
#include <stdarg.h>

void vprintc_uart(char c);

void vprintf_uart(const char *s);

#endif