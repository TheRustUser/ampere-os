#ifndef UART_H
#define UART_H

#include <stdint.h>
#include <stdarg.h>

#include "utils.h"

#define UART_ADDR 0x90000000

void *write_uart = write_volatile;

#endif