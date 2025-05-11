#ifndef __I2C1_DRIVER_H
#define __I2C1_DRIVER_H

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
 
typedef void (*interruptHandler)(void);

/* I2C interfaces */
void i2c1_driver_close(void);
bool  i2c1_driver_open(void);


char i2c1_driver_getRXData(void);
void i2c1_driver_TXData(uint8_t);
// void i2c1_driver_resetBus(void);
void i2c1_driver_start(void);
void i2c1_driver_restart(void);
void i2c1_driver_stop(void);
bool i2c1_driver_isNACK(void);
void i2c1_driver_startRX(void);
void i2c1_driver_waitRX(void);
void i2c1_driver_sendACK(void);
void i2c1_driver_sendNACK(void);
void i2c1_driver_clearBusCollision(void);

#endif // __I2C1_DRIVER_H
