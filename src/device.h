#ifndef DEVICE_H
#define DEVICE_H

#include <stdint.h>

typedef struct {
    void *address;
    void (*write_char)(void *addr, uint32_t v);
} device_t;

void vprintf(device_t *dev, const char* data);

#endif