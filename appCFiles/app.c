#include <math.h> 
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include <xc.h>
#include "../oledDriver/oledC.h"
#include "../oledDriver/oledC_colors.h"
#include "../oledDriver/oledC_shapeHandler.h"
#include "../oledDriver/oledC_shapes.h"
#include "../System/system.h"
#include "../System/delay.h"
#include "../Accel_i2c.h"
#include "../appheaderFiles/oled_display.h"
#include "../appheaderFiles/app.h"
#include "../appheaderFiles/menu_manager.h"
#include "../appheaderFiles/step_counter.h"
#include "../appheaderFiles/button_handler.h"
#include "../appheaderFiles/accelerometer.h"
#include "../appheaderFiles/display_clock.h"
#include "../appheaderFiles/timeSetUp.h"

// Global Variables
int stepArray[STEP_ARRAY_SIZE] = {0}; 
int stepIndex = 0;  
int totalSteps = 0;

#define SET_HOUR 0
#define SET_DAY 0

SETTIMES selectedTimePart = SET_HOUR;
SETDATES selectedDatesPart = SET_DAY;
MenuItem currentMenuSelection = MENU_PEDOMETER_GRAPH;
DisplyMode currentMode = clockMode;
TimeData currentTime = {12, 3, 0, 0, 0};
TimeData oldTime = {255, 255, 255, 255, 255};
int s1Counter = 0;
MenuItem lastMenuSelection = MENU_TOTAL_ITEMS;
bool is12HFormat = false;

// ? ??? ????? ????
uint32_t mockTime = 0;

static void initializeClock(void) {
    IEC0bits.T1IE = 0;
    oldTime = (TimeData){255, 255, 255, 255, 255};
    updateDisplayClock();
    IEC0bits.T1IE = 1;
}

void __attribute__((interrupt, auto_psv)) _T1Interrupt(void) {
    IFS0bits.T1IF = 0;

    currentTime.seconds++;
    if (currentTime.seconds >= 60) {
        currentTime.seconds = 0;
        currentTime.minutes++;
        if (currentTime.minutes >= 60) {
            currentTime.minutes = 0;
            currentTime.hours++;
            if (currentTime.hours >= 24) {
                currentTime.hours = 0;
                currentTime.day++;
                uint8_t daysInMonth[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
                if (currentTime.day > daysInMonth[currentTime.month - 1]) {
                    currentTime.day = 1;
                    currentTime.month++;
                    if (currentTime.month > 12) {
                        currentTime.month = 1;
                    }
                }
            }
        }
    }

    if (currentMode == setDate || currentMode == Interval_12H24H || currentMode == pedometerGraph) return;

    if (currentMode == menuMode) {
        updateMenuClock();
    } else {
        updateDisplayClock();
    }
}

void returnToMenu(void) {
    currentMode = menuMode;
    lastMenuSelection = MENU_TOTAL_ITEMS;
    IEC0bits.T1IE = 1;
    menuManager();
}

static void timer1_init(void) {
    T1CON = 0;
    T1CONbits.TCKPS = 3;
    PR1 = 15625 - 1;
    TMR1 = 0;
    IFS0bits.T1IF = 0;
    IEC0bits.T1IE = 1;
    T1CONbits.TON = 1;
}

static void initializeLedAndButtons(void) {
    TRISAbits.TRISA8 = 0;
    LATAbits.LATA8 = 0;
    TRISAbits.TRISA9 = 0;
    LATAbits.LATA9 = 0;
    TRISAbits.TRISA11 = 1;
    TRISAbits.TRISA12 = 1;
}

void App_Init(void) {
    timer1_init();
    OLED_SetBackground(OLEDC_COLOR_BLACK);
    initializeClock();
    initializeAccelerometer();
    initializeLedAndButtons();
}


void App_Run(void) {
    while (1) {
        readButtons();          
        checkAccelerometer();   
        countSteps();
        updateWalkingGraph();
    }
}
