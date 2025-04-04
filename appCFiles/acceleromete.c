#include "../appheaderFiles/accelerometer.h"
#include "../appheaderFiles/app.h"
#include "../System/delay.h"
#include "../Accel_i2c.h"
#include <stdlib.h>
#include <xc.h>
#include "../oledDriver/oledC_shapes.h"
#include "../appheaderFiles/step_counter.h"

// ? ???? ??? ????? ???app
extern uint32_t mockTime;

int16_t readAxis(uint8_t regAddress) {
    uint8_t lowByte, highByte;
    int maxRetries = 10;

    for (int i = 0; i < maxRetries; i++) {
        if (i2cReadSlaveRegister(0x3A, regAddress, &lowByte) == OK) break;
        DELAY_milliseconds(10);
    }

    for (int i = 0; i < maxRetries; i++) {
        if (i2cReadSlaveRegister(0x3A, regAddress + 1, &highByte) == OK) break;
        if (i == maxRetries - 1) {
            i2cWriteSlave(0x3A, 0x2D, 0x08);
            DELAY_milliseconds(10);
            return 0;
        }
        DELAY_milliseconds(10);
    }

    return ((int16_t)highByte << 8) | lowByte;
}
void checkAccelerometer(void) {
    const int16_t SHAKE_THRESHOLD = 500;
    static int16_t lastX = 0, lastY = 0, lastZ = 0;
    static bool haveBeenSheck = false;

    static uint32_t upsideDownStartTime = 0;
    static bool isWaitingForUpsideDown = false;

    // ? ????? ??? ????? (100ms ??? ?????)
    mockTime += 100;
    uint32_t currentMillis = mockTime;

    if (currentMode == setTime || currentMode == setDate) {
        int16_t x = readAxis(0x32);
        int16_t y = readAxis(0x34);
        int16_t z = readAxis(0x36);

        // ? ????? ?????
        if ((abs(x - lastX) > SHAKE_THRESHOLD ||
             abs(y - lastY) > SHAKE_THRESHOLD ||
             abs(z - lastZ) > SHAKE_THRESHOLD)) {
            if (!haveBeenSheck) {
                returnToMenu();
                haveBeenSheck = true;
            }
        } else {
            haveBeenSheck = false;
        }

        // ? ????? ????? ???? ???? 2 ?????
        if (z < 0) {
            if (!isWaitingForUpsideDown) {
                isWaitingForUpsideDown = true;
                upsideDownStartTime = currentMillis;
            } else if ((currentMillis - upsideDownStartTime) >= 2000) {
                returnToMenu();
                isWaitingForUpsideDown = false;
            }
        } else {
            // ?? ????? ????? ???? ? ??? ?? ????
            isWaitingForUpsideDown = false;
            upsideDownStartTime = 0;
        }

        lastX = x;
        lastY = y;
        lastZ = z;
    }
}


void initializeAccelerometer(void) {
    uint8_t deviceId = 0;
    i2c1_open();

    for (int i = 0; i < 5; i++) {
        if (i2cReadSlaveRegister(0x3A, 0x00, &deviceId) == OK && deviceId == 0xE5) break;
        DELAY_milliseconds(10);
    }

    for (int i = 0; i < 3; i++) {
        if (i2cWriteSlave(0x3A, 0x2D, 0x08) == OK) break;
        DELAY_milliseconds(10);
    }

    for (int i = 0; i < 3; i++) {
        if (i2cWriteSlave(0x3A, 0x31, 0x0B) == OK) break;
        DELAY_milliseconds(10);
    }
}
