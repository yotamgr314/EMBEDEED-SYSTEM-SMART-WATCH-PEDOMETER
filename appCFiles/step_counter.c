#include "../appheaderFiles/step_counter.h"
#include "../oledDriver/oledC.h"
#include "../System/delay.h"
#include "../appheaderFiles/oled_display.h"
#include "../appheaderFiles/app.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "../Accel_i2c.h"
#include <xc.h>
#include "../oledDriver/oledC_colors.h"
#include "../appheaderFiles/accelerometer.h"
#include "../oledDriver/oledC_shapes.h"

#ifndef STEP_THRESHOLD
#define STEP_THRESHOLD 500
#endif

int walkingArray[WALKING_ARRY_SIZE] = {0};
int walkingIndex = 0;
uint32_t lastGraphUpdateSecond = 0;

static bool    isFirstStep         = true;
static uint32_t lastStepTime       = 0;
static int16_t lastX               = 0;
static int16_t lastY               = 0;
static int16_t lastZ               = 0;
static bool    rightLeftMovment    = false;
static char    previousDisplayText[20] = "";
static uint32_t lastStepSecond = 0;

void updateWalkingGraph(void) {
    uint32_t currentSecond = currentTime.hours * 3600 +
                              currentTime.minutes * 60 +
                              currentTime.seconds;

    if (currentSecond == lastGraphUpdateSecond) return;
    lastGraphUpdateSecond = currentSecond;

    if (currentSecond - lastStepSecond > 1) {
        walkingArray[walkingIndex] = 0;
        walkingIndex = (walkingIndex + 1) % WALKING_ARRY_SIZE;
    }
}

void countSteps(void) {
    if (currentMode != clockMode) return;

    int16_t x = readAxis(0x32);
    int16_t y = readAxis(0x34);
    int16_t z = readAxis(0x36);

    uint32_t currentSecond = currentTime.hours * 3600 +
                              currentTime.minutes * 60 +
                              currentTime.seconds;

    static uint32_t lastPaceDisplayTime = 0;

    if ((abs(x - lastX) > STEP_THRESHOLD) ||
        (abs(y - lastY) > STEP_THRESHOLD) ||
        (abs(z - lastZ) > STEP_THRESHOLD)) {

        uint32_t deltaT = 0;
        if (isFirstStep) {
            isFirstStep = false;
        } else {
            deltaT = currentSecond - lastStepSecond;
        }

        if (deltaT > 0) {
            int pace = 60 / deltaT;
            walkingArray[walkingIndex] = pace;
            walkingIndex = (walkingIndex + 1) % WALKING_ARRY_SIZE;

            char displayText[20];
            snprintf(displayText, sizeof(displayText), "%d", pace);

            if (strcmp(displayText, previousDisplayText) != 0) {
                IEC0bits.T1IE = 0;

                oledC_DrawString(25, 0, 1, 1, (uint8_t *)previousDisplayText, OLEDC_COLOR_BLACK);
                oledC_DrawString(25, 0, 1, 1, (uint8_t *)displayText, OLEDC_COLOR_WHITE);
                strcpy(previousDisplayText, displayText);

                if (rightLeftMovment) {
                    DrawStepIcon(0, 0, footLeftBitmap, 16, 16, OLEDC_COLOR_BLACK);
                    DrawStepIcon(0, 0, footRightBitmap, 16, 16, OLEDC_COLOR_WHITE);
                } else {
                    DrawStepIcon(0, 0, footRightBitmap, 16, 16, OLEDC_COLOR_BLACK);
                    DrawStepIcon(0, 0, footLeftBitmap, 16, 16, OLEDC_COLOR_WHITE);
                }

                rightLeftMovment = !rightLeftMovment;
                lastPaceDisplayTime = currentSecond;

                IEC0bits.T1IE = 1;
            }
        }

        lastStepSecond = currentSecond;
    } else {
        if (previousDisplayText[0] != '\0' && (currentSecond - lastPaceDisplayTime > 1)) {
            IEC0bits.T1IE = 0;

            oledC_DrawString(25, 0, 1, 1, (uint8_t *)previousDisplayText, OLEDC_COLOR_BLACK);
            previousDisplayText[0] = '\0';

            DrawStepIcon(0, 0, footLeftBitmap, 16, 16, OLEDC_COLOR_BLACK);
            DrawStepIcon(0, 0, footRightBitmap, 16, 16, OLEDC_COLOR_BLACK);

            IEC0bits.T1IE = 1;
        }
    }

    lastX = x;
    lastY = y;
    lastZ = z;
}
