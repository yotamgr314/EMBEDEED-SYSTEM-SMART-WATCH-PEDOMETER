#include "../appheaderFiles/app.h"
#include "../appheaderFiles/menu_manager.h"
#include "../oledDriver/oledC.h"
#include "../System/delay.h"
#include "../appheaderFiles/oled_display.h"
#include <xc.h>
#include "../oledDriver/oledC_shapes.h"
#include "../oledDriver/oledC_colors.h"
#include "../appheaderFiles/timeSetUp.h"
#include "../appheaderFiles/button_handler.h"
#include "../appheaderFiles/display_clock.h"

void glowS1Arrow(void) {
    for (int i = 0; i < 2; i++) {
        oledC_DrawRectangle(1 - i, 32 - i, 17 + i, 48 + i, OLEDC_COLOR_WHITE);
        DELAY_milliseconds(40);
    }
    for (int i = 1; i >= 0; i--) {
        oledC_DrawRectangle(1 - i, 32 - i, 17 + i, 48 + i, OLEDC_COLOR_BLACK);
        DELAY_milliseconds(40);
    }
    oledC_DrawRectangle(4, 32, 14, 34, OLEDC_COLOR_WHITE);  // arrowhead
    oledC_DrawRectangle(2, 34, 16, 48, OLEDC_COLOR_WHITE);  // shaft
    oledC_DrawString(5, 37, 1, 1, (uint8_t *)"S1", OLEDC_COLOR_BLACK);
}
void glowS2Arrow(void) {
    for (int i = 0; i < 2; i++) {
        oledC_DrawRectangle(1 - i, 64 - i, 17 + i, 78 + i, OLEDC_COLOR_WHITE);
        DELAY_milliseconds(40);
    }
    for (int i = 1; i >= 0; i--) {
        oledC_DrawRectangle(1 - i, 64 - i, 17 + i, 78 + i, OLEDC_COLOR_BLACK);
        DELAY_milliseconds(40);
    }
    oledC_DrawRectangle(2, 64, 16, 76, OLEDC_COLOR_WHITE);  // shaft
    oledC_DrawRectangle(4, 76, 14, 78, OLEDC_COLOR_WHITE);  // arrowhead
    oledC_DrawString(5, 66, 1, 1, (uint8_t *)"S2", OLEDC_COLOR_BLACK);
}


void glowS1S2Arrow(void) {
    // ??? 1: ????? ???????
    for (int i = 0; i < 2; i++) {
        oledC_DrawRectangle(14 - i, 82 - i, 81 + i, 91 + i, OLEDC_COLOR_WHITE);
        DELAY_milliseconds(40);
    }

    // ??? 2: ????? ?????? (?????)
    for (int i = 1; i >= 0; i--) {
        oledC_DrawRectangle(14 - i, 82 - i, 81 + i, 91 + i, OLEDC_COLOR_BLACK);
        DELAY_milliseconds(40);
    }

    oledC_DrawRectangle(20, 83, 75, 91, OLEDC_COLOR_WHITE);   

    oledC_DrawRectangle(15, 85, 19, 89, OLEDC_COLOR_WHITE);    
    oledC_DrawRectangle(76, 85, 80, 89, OLEDC_COLOR_WHITE);    

    oledC_DrawString(36, 84, 1, 1, (uint8_t *)"S1+S2", OLEDC_COLOR_BLACK);
}


void setDateButtonManager(uint8_t newS1, uint8_t newS2) {
    if (selectedDatesPart == SET_DAY) {
        if (!newS1 && newS2) {
            LATAbits.LATA8 = 1;
            LATAbits.LATA9 = 0;
            glowS1Arrow();  // S1
            int newValue = currentTime.day + 1;
            if (newValue > 31) newValue = 1;
            UpdateOLEDFormattedText(25, 45, 2, 2, &currentTime.day, newValue, "%02d");
            currentTime.day = newValue;
        }
        if (newS1 && !newS2) {
            LATAbits.LATA8 = 0;
            LATAbits.LATA9 = 1;
            glowS2Arrow();  // S2
            int newValue = currentTime.day - 1;
            if (newValue <= 0) newValue = 31;
            UpdateOLEDFormattedText(25, 45, 2, 2, &currentTime.day, newValue, "%02d");
            currentTime.day = newValue;
        }
    }

    if (selectedDatesPart == SET_MONTH) {
        if (!newS1 && newS2) {
            LATAbits.LATA8 = 1;
            LATAbits.LATA9 = 0;
            glowS1Arrow();  
            int newValue = currentTime.month + 1;
            if (newValue > 12) newValue = 1;
            UpdateOLEDFormattedText(60, 45, 2, 2, &currentTime.month, newValue, "%02d");
            currentTime.month = newValue;
        }
        if (newS1 && !newS2) {
            LATAbits.LATA8 = 0;
            LATAbits.LATA9 = 1;
            glowS2Arrow();  // ?? ?? ????
            int newValue = currentTime.month - 1;
            if (newValue <= 0) newValue = 12;
            UpdateOLEDFormattedText(60, 45, 2, 2, &currentTime.month, newValue, "%02d");
            currentTime.month = newValue;
        }
    }

    if (!newS1 && !newS2) {
        LATAbits.LATA9 = 1;
        LATAbits.LATA8 = 1;
        selectedDatesPart = !selectedDatesPart;
        changeSetMode();
        glowS1S2Arrow();  
    }
}


void IntervalButtonManager(uint8_t newS1, uint8_t newS2) {
    if (!newS1 && newS2) {
        LATAbits.LATA8 = 1;
        LATAbits.LATA9 = 0;
        conformInterval();
    }

    if (newS1 && !newS2) {
        LATAbits.LATA8 = 0;
        LATAbits.LATA9 = 1;
        is12HFormat = !is12HFormat;
        changeSetMode();
    }

    if (!newS1 && !newS2) {
        LATAbits.LATA8 = 1;
        LATAbits.LATA9 = 1;
        conformInterval();
    }
}

void setTimeButtonManager(uint8_t newS1, uint8_t newS2) {
    if (selectedTimePart == SET_HOUR) {
        if (!newS1 && newS2) {
            LATAbits.LATA8 = 1;
            LATAbits.LATA9 = 0;
            int newValue = currentTime.hours + 1;
            if (newValue >= 24) newValue = 0;
            UpdateOLEDFormattedText(25, 45, 2, 2, &currentTime.hours, newValue, "%02d");
            currentTime.hours = newValue;
            currentTime.seconds = 0;
            glowS1Arrow();
        }
        if (newS1 && !newS2) {
            LATAbits.LATA8 = 0;
            LATAbits.LATA9 = 1;
            int newValue = currentTime.hours - 1;
            if (newValue < 0) newValue = 23;
            UpdateOLEDFormattedText(25, 45, 2, 2, &currentTime.hours, newValue, "%02d");
            currentTime.hours = newValue;
            currentTime.seconds = 0;
                glowS2Arrow();

        }
    }

    if (selectedTimePart == SET_MINUTES) {
        if (!newS1 && newS2) {
            LATAbits.LATA8 = 1;
            LATAbits.LATA9 = 0;
            int newValue = currentTime.minutes + 1;
            if (newValue >= 60) newValue = 0;
            UpdateOLEDFormattedText(60, 45, 2, 2, &currentTime.minutes, newValue, "%02d");
            currentTime.minutes = newValue;
            currentTime.seconds = 0;
            glowS1Arrow();
        }
        if (newS1 && !newS2) {
            LATAbits.LATA8 = 0;
            LATAbits.LATA9 = 1;
            int newValue = currentTime.minutes - 1;
            if (newValue < 0) newValue = 59;
            UpdateOLEDFormattedText(60, 45, 2, 2, &currentTime.minutes, newValue, "%02d");
            currentTime.minutes = newValue;
            currentTime.seconds = 0;
            glowS2Arrow();
        }
    }

    if (!newS1 && !newS2) {
        selectedTimePart = !selectedTimePart;
        changeSetMode();
        LATAbits.LATA9 = 1;
        LATAbits.LATA8 = 1;
        glowS1S2Arrow();  

    }
}

void clockButtonManager(uint8_t newS1) {
    static uint16_t s1PressDuration = 0;

    if (!newS1) {
        LATAbits.LATA8 = 1;
        LATAbits.LATA9 = 0;
        s1PressDuration++;

        if (s1PressDuration >= 40) {
            if (currentMode == pedometerGraph) {
                currentMode = clockMode;
                LATAbits.LATA8 = 0;
                s1PressDuration = 0;
                IEC0bits.T1IE = 0;
                OLED_ClearScreen();
                IEC0bits.T1IE = 1;
                lastMenuSelection = MENU_TOTAL_ITEMS;
                oldTime = (TimeData){255, 255, 255, 255, 255};
                updateDisplayClock();
            } else {
                currentMode = menuMode;
                LATAbits.LATA8 = 0;
                menuManager();
                s1PressDuration = 0;
            }
        }
    } else {
        s1PressDuration = 0;
    }
}

void readButtons(void) {
    uint8_t currentS1 = PORTAbits.RA11;
    uint8_t currentS2 = PORTAbits.RA12;

    if (currentS1 && currentS2) {
        LATAbits.LATA9 = 0;
        LATAbits.LATA8 = 0;
        return;
    }

    DELAY_milliseconds(50);

    uint8_t newS1 = PORTAbits.RA11;
    uint8_t newS2 = PORTAbits.RA12;

    if ((newS1 != currentS1) || (newS2 != currentS2)) {
        LATAbits.LATA9 = 0;
        LATAbits.LATA8 = 0;
        return;
    }

    switch (currentMode) {
        case setTime:           setTimeButtonManager(currentS1, currentS2); break;
        case menuMode:          menuButtonManager(currentS1, currentS2); break;
        case clockMode:         clockButtonManager(currentS1); break;
        case setDate:           setDateButtonManager(currentS1, currentS2); break;
        case Interval_12H24H:   IntervalButtonManager(currentS1, currentS2); break;
        case pedometerGraph:    clockButtonManager(currentS1); break;
    }
}
