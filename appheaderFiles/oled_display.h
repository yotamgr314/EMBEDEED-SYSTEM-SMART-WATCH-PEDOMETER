#ifndef OLED_DISPLAY_H
#define OLED_DISPLAY_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

void OLED_ClearScreen(void);
void OLED_SetBackground(uint16_t color);
void FullSquare(int x, int y, int size, uint16_t color);
void UpdateOLEDFormattedText(uint8_t x, uint8_t y, uint8_t scaleX, uint8_t scaleY,
                             uint8_t *oldValue, uint8_t newValue, const char *formatString);
void DrawEmptySquare(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, uint16_t color);
void DrawStepIcon(uint8_t x, uint8_t y, const uint16_t *bitsMap, uint8_t width, uint8_t height, uint16_t color);
void DrawPointsToGraf(void);
void DrawGraphGrid(void);
extern const uint16_t footRightBitmap[16];
extern const uint16_t footLeftBitmap[16];

#ifdef __cplusplus
}
#endif

#endif // OLED_DISPLAY_H
