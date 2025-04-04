#ifndef BUTTON_HANDLER_H
#define BUTTON_HANDLER_H

#include <stdint.h>

void IntervalButtonManager(uint8_t newS1, uint8_t newS2);
void setDateButtonManager(uint8_t newS1, uint8_t newS2);
void setTimeButtonManager(uint8_t newS1, uint8_t newS2);
void clockButtonManager(uint8_t newS1);
void readButtons(void); // ?????? ????? ????? ??????

// ?????? ?????? - GLOW
void glowS1Arrow(void);
void glowS2Arrow(void);
void glowS1S2Arrow(void);


#endif // BUTTON_HANDLER_H
