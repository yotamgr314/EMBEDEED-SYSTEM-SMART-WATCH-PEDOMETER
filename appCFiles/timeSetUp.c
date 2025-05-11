#include "../appheaderFiles/timeSetUp.h"
#include "../appheaderFiles/app.h"
#include "../appheaderFiles/oled_display.h"
#include "../oledDriver/oledC.h"
#include "../System/delay.h"
#include <xc.h>
#include <string.h>
#include "../oledDriver/oledC_colors.h"
#include "../oledDriver/oledC_shapes.h"

void setTimeMode(void) {
    IEC0bits.T1IE = 0;
    OLED_ClearScreen();
    currentMode = setTime;

    char* headline = "Set Time";
    oledC_DrawString(5, 7, 2, 2, (uint8_t *)headline, OLEDC_COLOR_WHITE);

    DrawEmptySquare(20, 40, 50, 70, OLEDC_COLOR_WHITE);

    oldTime.hours = 60;
    oldTime.minutes = 60;

    UpdateOLEDFormattedText(25, 45, 2, 2, &oldTime.hours, currentTime.hours, "%02d");
    UpdateOLEDFormattedText(60, 45, 2, 2, &oldTime.minutes, currentTime.minutes, "%02d");
    drawSetTimeArrows();
}

void setDateMode(void) {
    currentMode = setDate;
    OLED_ClearScreen();

    char* headline = "Set Date";
    oledC_DrawString(5, 7, 2, 2, (uint8_t *)headline, OLEDC_COLOR_WHITE);

    DrawEmptySquare(20, 40, 50, 70, OLEDC_COLOR_WHITE);

    oldTime.day = 60;
    oldTime.month = 60;

    UpdateOLEDFormattedText(25, 45, 2, 2, &oldTime.day, currentTime.day, "%02d");
    UpdateOLEDFormattedText(60, 45, 2, 2, &oldTime.month, currentTime.month, "%02d");

    drawSetTimeArrows();  // Set Date
}

void toggleClockFormat(void) {
    currentMode = Interval_12H24H;
    OLED_ClearScreen();

    oledC_DrawString(5, 7, 1, 1, (uint8_t *)"12H/24H Interval", OLEDC_COLOR_WHITE);

    oldTime.hours = 255;

    UpdateOLEDFormattedText(25, 45, 2, 2, &oldTime.hours, 12, "%d");
    UpdateOLEDFormattedText(60, 45, 2, 2, &oldTime.hours, 24, "%d");

    if (is12HFormat) {
        DrawEmptySquare(20, 40, 50, 70, OLEDC_COLOR_WHITE);
    } else {
        DrawEmptySquare(55, 40, 85, 70, OLEDC_COLOR_WHITE);
    }
}

void conformInterval(void) {
    IEC0bits.T1IE = 0;
    OLED_ClearScreen();

    currentMode = clockMode;
    lastMenuSelection = MENU_TOTAL_ITEMS;
    oldTime = (TimeData){255, 255, 255, 255, 255};

    IEC0bits.T1IE = 1;
    updateDisplayClock();
}

// Draw triangle using 3 points
void oledC_DrawTriangle(uint8_t x1, uint8_t y1,
                        uint8_t x2, uint8_t y2,
                        uint8_t x3, uint8_t y3,
                        uint16_t color) {
    oledC_DrawLine(x1, y1, x2, y2, 1, color);
    oledC_DrawLine(x2, y2, x3, y3, 1, color);
    oledC_DrawLine(x3, y3, x1, y1, 1, color);
}
void drawSetTimeArrows(void) {
    
    oledC_DrawRectangle(4, 32, 14, 34, OLEDC_COLOR_WHITE);   // arrowhead
    oledC_DrawRectangle(2, 34, 16, 48, OLEDC_COLOR_WHITE);   // shaft
    oledC_DrawString(5, 37, 1, 1, (uint8_t *)"S1", OLEDC_COLOR_BLACK);

    // === S2 Down Arrow ===
    oledC_DrawRectangle(2, 64, 16, 76, OLEDC_COLOR_WHITE);   // shaft
    oledC_DrawRectangle(4, 76, 14, 78, OLEDC_COLOR_WHITE);   // arrowhead
    oledC_DrawString(5, 66, 1, 1, (uint8_t *)"S2", OLEDC_COLOR_BLACK);


    // === S1+S2 Bi-directional Arrow ===
    oledC_DrawRectangle(20, 83, 75, 91, OLEDC_COLOR_WHITE);

    oledC_DrawRectangle(15, 85, 19, 89, OLEDC_COLOR_WHITE);  

    oledC_DrawRectangle(76, 85, 80, 89, OLEDC_COLOR_WHITE);  

    oledC_DrawString(36, 84, 1, 1, (uint8_t *)"S1+S2", OLEDC_COLOR_BLACK);
}
