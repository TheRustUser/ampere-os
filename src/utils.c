#include "utils.h"

void write_volatile(void *addr, uint32_t v) {
    *(volatile uint32_t*) addr = v;
}