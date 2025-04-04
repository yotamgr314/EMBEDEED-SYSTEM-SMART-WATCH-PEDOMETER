#ifndef ACCELEROMETER_H
#define ACCELEROMETER_H

#include <stdint.h>

int16_t readAxis(uint8_t regAddress);
void checkAccelerometer(void);
void initializeAccelerometer(void);

#endif // ACCELEROMETER_H
