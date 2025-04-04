#include "../appheaderFiles/app.h"
#include "../oledDriver/oledC.h"
#include "../appheaderFiles/oled_display.h"
#include <string.h>
#include "../appheaderFiles/display_clock.h"
#include "../oledDriver/oledC_colors.h"
#include <xc.h>
#include "../oledDriver/oledC_shapes.h"

void updateDisplayClock(void) {
    uint8_t displayHours = currentTime.hours;
    char amPm[3] = "";
    if (is12HFormat) {
        if (displayHours == 0) {
            displayHours = 12;
            oledC_DrawString(10, 85, 1, 1, (uint8_t *)amPm, OLEDC_COLOR_BLACK);
            strcpy(amPm, "AM");
        } else if (displayHours < 12) {
            oledC_DrawString(10, 85, 1, 1, (uint8_t *)amPm, OLEDC_COLOR_BLACK);
            strcpy(amPm, "AM");
        } else if (displayHours == 12) {
            oledC_DrawString(10, 85, 1, 1, (uint8_t *)amPm, OLEDC_COLOR_BLACK);
            strcpy(amPm, "PM");
        } else {
            displayHours -= 12;
            oledC_DrawString(10, 85, 1, 1, (uint8_t *)amPm, OLEDC_COLOR_BLACK);
            strcpy(amPm, "PM");
        }
    }

    IEC0bits.T1IE = 0;
    UpdateOLEDFormattedText(10, 40, 2, 2, &oldTime.hours, displayHours, "%02d");
    UpdateOLEDFormattedText(30, 40, 2, 2, &oldTime.minutes, currentTime.minutes, ":%02d");
    UpdateOLEDFormattedText(60, 40, 2, 2, &oldTime.seconds, currentTime.seconds, ":%02d");
    IEC0bits.T1IE = 1;

    IEC0bits.T1IE = 0;
    if (is12HFormat) {
        oledC_DrawString(10, 85, 1, 1, (uint8_t *)amPm, OLEDC_COLOR_WHITE);
    } else {
        oledC_DrawString(10, 85, 1, 1, (uint8_t *)"  ", OLEDC_COLOR_BLACK);
    }
    IEC0bits.T1IE = 1;

    IEC0bits.T1IE = 0;
    UpdateOLEDFormattedText(65, 85, 1, 1, &oldTime.day, currentTime.day, "%02d");
    UpdateOLEDFormattedText(77, 85, 1, 1, &oldTime.month, currentTime.month, "/%02d");
    IEC0bits.T1IE = 1;
}

void updateMenuClock(void) {
    uint8_t displayHours = currentTime.hours;
    char amPm[3] = "";
    if (is12HFormat) {
        if (displayHours == 0) {
            displayHours = 12;
            strcpy(amPm, "AM");
        } else if (displayHours < 12) {
            strcpy(amPm, "AM");
        } else if (displayHours == 12) {
            strcpy(amPm, "PM");
        } else {
            displayHours -= 12;
            strcpy(amPm, "PM");
        }
    }

    IEC0bits.T1IE = 0;
    UpdateOLEDFormattedText(25, 2, 1, 1, &oldTime.hours, displayHours, "%02d");
    UpdateOLEDFormattedText(35, 2, 1, 1, &oldTime.minutes, currentTime.minutes, ":%02d");
    UpdateOLEDFormattedText(55, 2, 1, 1, &oldTime.seconds, currentTime.seconds, ":%02d");
    IEC0bits.T1IE = 1;

    IEC0bits.T1IE = 0;
    if (is12HFormat) {
        oledC_DrawString(80, 2, 1, 1, (uint8_t *)amPm, OLEDC_COLOR_WHITE);
    } else {
        oledC_DrawString(80, 2, 1, 1, (uint8_t *)amPm, OLEDC_COLOR_BLACK);
    }
    IEC0bits.T1IE = 1;
}

void changeSetMode(void) {
    uint8_t prev_x1, prev_x2, new_x1, new_x2;

    if (currentMode == setTime) {
        if (selectedTimePart == SET_HOUR) {
            prev_x1 = 55; prev_x2 = 85;
            new_x1 = 20; new_x2 = 50;
        } else {
            prev_x1 = 20; prev_x2 = 50;
            new_x1 = 55; new_x2 = 85;
        }
    } else if (currentMode == setDate) {
        if (selectedDatesPart == SET_DAY) {
            prev_x1 = 55; prev_x2 = 85;
            new_x1 = 20; new_x2 = 50;
        } else {
            prev_x1 = 20; prev_x2 = 50;
            new_x1 = 55; new_x2 = 85;
        }
    } else if (currentMode == Interval_12H24H) {
        if (is12HFormat) {
            prev_x1 = 55; prev_x2 = 85;
            new_x1 = 20; new_x2 = 50;
        } else {
            prev_x1 = 20; prev_x2 = 50;
            new_x1 = 55; new_x2 = 85;
        }
    }

    DrawEmptySquare(prev_x1, 40, prev_x2, 70, OLEDC_COLOR_BLACK);
    DrawEmptySquare(new_x1, 40, new_x2, 70, OLEDC_COLOR_WHITE);
}
