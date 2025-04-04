// ============================
// File: oled_display.c
// ============================
#include "../appheaderFiles/oled_display.h"
#include "../oledDriver/oledC.h"
#include "../oledDriver/oledC_colors.h"
#include "../oledDriver/oledC_shapeHandler.h"
#include "../oledDriver/oledC_shapes.h"
#include "../System/delay.h"
#include <stdio.h>
#include <stdint.h>
#include <xc.h>
#include "../appheaderFiles/app.h"
#include "../appheaderFiles/step_counter.h"
#include "../appheaderFiles/menu_manager.h"
static uint16_t background_color;

void OLED_ClearScreen(void) {
    uint8_t x, y;
    oledC_setColumnAddressBounds(0, 96);
    oledC_setRowAddressBounds(0, 96);
    for (x = 0; x < 96; x++) {
        for (y = 0; y < 96; y++) {
            oledC_sendColorInt(background_color);
        }
    }
}

void OLED_SetBackground(uint16_t color) {
    background_color = color;
    OLED_ClearScreen();
}

void FullSquare(int x, int y, int size, uint16_t color) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            oledC_DrawPoint(x + i, y + j, color);
        }
    }
}

void UpdateOLEDFormattedText(uint8_t x, uint8_t y, uint8_t scaleX, uint8_t scaleY,
                             uint8_t *oldValue, uint8_t newValue, const char *formatString) {
    char strBuffer[10];
    if (*oldValue != newValue) {
        snprintf(strBuffer, sizeof(strBuffer), formatString, *oldValue);
        oledC_DrawString(x, y, scaleX, scaleY, (uint8_t *)strBuffer, OLEDC_COLOR_BLACK);
        snprintf(strBuffer, sizeof(strBuffer), formatString, newValue);
        oledC_DrawString(x, y, scaleX, scaleY, (uint8_t *)strBuffer, OLEDC_COLOR_WHITE);
        *oldValue = newValue;
    }
}

void DrawEmptySquare(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, uint16_t color) {
    oledC_DrawLine(x1, y1, x2, y1, 1, color);
    oledC_DrawLine(x1, y2, x2, y2, 1, color);
    for (uint8_t y = y1; y <= y2; y++) {
        oledC_DrawPoint(x1, y, color);
        oledC_DrawPoint(x2, y, color);
    }
}

void DrawStepIcon(uint8_t x, uint8_t y, const uint16_t *bitsMap, uint8_t width, uint8_t height, uint16_t color) {
    for (uint8_t row = 0; row < height; row++) {
        uint16_t rowInfo = bitsMap[row];
        for (uint8_t col = 0; col < width; col++) {
            if (rowInfo & (1 << (width - 1 - col))) {
                oledC_DrawPoint(x + col, y + row, color);
            }
        }
    }
}

extern int walkingArray[];
extern int walkingIndex;

void DrawPointsToGraf(void) {
    int xStart = 0;
    int yStart = 95;
    int graphHeight = 95;
    int maxSteps = 100;

    int numPoints = WALKING_ARRY_SIZE;
    int startIndex = (walkingIndex + 1) % WALKING_ARRY_SIZE;

    int prevX = -1;
    int prevY = -1;

    for (int i = 0; i < numPoints; i++) {
        int index = (startIndex + i) % WALKING_ARRY_SIZE;
        int walkingValue = walkingArray[index];

        int barHeight = (walkingValue * graphHeight) / maxSteps;
        int x = xStart + (WALKING_ARRY_SIZE - 1 - i);  // ? ????? ??????
        int y = yStart - barHeight;

        if (prevX >= 0 && prevY >= 0 && x < 96 && y < 96) {
            int dx = abs(x - prevX);
            int dy = abs(y - prevY);
            int sx = (prevX < x) ? 1 : -1;
            int sy = (prevY < y) ? 1 : -1;
            int err = dx - dy;

            int currentX = prevX;
            int currentY = prevY;

            while (true) {
                oledC_DrawPoint(currentX, currentY, OLEDC_COLOR_WHITE);
                if (currentX == x && currentY == y) break;
                int e2 = 2 * err;
                if (e2 > -dy) {
                    err -= dy;
                    currentX += sx;
                }
                if (e2 < dx) {
                    err += dx;
                    currentY += sy;
                }
            }
        }

        prevX = x;
        prevY = y;
    }
}



void DrawGraphGrid(void) {
    currentMode = pedometerGraph;
    IEC0bits.T1IE = 0;
    OLED_ClearScreen();
    IEC0bits.T1IE = 1;
    int yValues[] = {100, 60, 30};
    char syGrid[4];
    int y = 0;
    for (int i = 0; i < 3; i++) {
        snprintf(syGrid, sizeof(syGrid), "%02d", yValues[i]);
        oledC_DrawString(0, y, 1, 1, (uint8_t *)syGrid, OLEDC_COLOR_WHITE);
        for (int x = 5; x <= 95; x++) {
            oledC_DrawPoint(x, y + 10, OLEDC_COLOR_WHITE);
        }
        y += 30;
    }
    oledC_DrawLine(5, 95, 95, 95, 1, OLEDC_COLOR_WHITE);
    for (int x = 5; x <= 95; x += 10) {
        FullSquare(x, 93, 2, OLEDC_COLOR_WHITE);
    }
    DrawPointsToGraf();
}


 const uint16_t footRightBitmap[16] = {
    0x7800, 0xF800, 0xFC00, 0xFC00, 0xFC00, 0x7C1E, 0x783E, 0x047F,
    0x3F9F, 0x1F3E, 0x0C3E, 0x003E, 0x0004, 0x00F0, 0x01F0, 0x00E0
};

 const uint16_t footLeftBitmap[16] = {
    0x001E, 0x003F, 0x003F, 0x007F, 0x003F, 0x383E, 0x7C1E, 0x7E10,
    0x7E7C, 0x7E78, 0x7C30, 0x3C00, 0x2000, 0x1E00, 0x1F00, 0x0E00
};
