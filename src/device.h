#ifndef DEVICE_H
#define DEVICE_H

typedef struct {
    void (*write_char)(char c);
} VirtualDevice;

void vprintf(VirtualDevice *dev, const char* data);

#endif