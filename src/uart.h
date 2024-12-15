#ifndef UART_H
#define UART_H

#include <stdint.h>
#include <stdarg.h>

#include "utils.h"

#define UART_ADDR (void*)0x09000000

extern void *write_uart;

#endif