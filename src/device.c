#include "device.h"

void vprintf(VirtualDevice *dev, const char* data) {
    while (*data) {
        dev->write_char(*data);
        data++;
    }
}