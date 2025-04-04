#ifndef TIME_SETUP_H
#define TIME_SETUP_H

#include <stdint.h>

void setTimeMode(void);
void setDateMode(void);
void toggleClockFormat(void);
void conformInterval(void);
void oledC_DrawTriangle(uint8_t x1, uint8_t y1,
                        uint8_t x2, uint8_t y2,
                        uint8_t x3, uint8_t y3,
                        uint16_t color);
void drawSetTimeArrows(void);

#endif // TIME_SETUP_H
