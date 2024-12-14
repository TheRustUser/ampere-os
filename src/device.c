#include "device.h"

void vprintf(device_t *dev, const char* data) {
    while (*data) {
        dev->write_char(dev->address, *data);
        data++;
    }
}