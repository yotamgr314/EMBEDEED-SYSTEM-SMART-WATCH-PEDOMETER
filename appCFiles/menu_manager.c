#include "../appheaderFiles/menu_manager.h"
#include "../oledDriver/oledC.h"
#include "../appheaderFiles/oled_display.h"
#include "../appheaderFiles/app.h"
#include <xc.h>
#include "../oledDriver/oledC_colors.h"     // OLEDC_COLOR_WHITE / BLACK
#include "../oledDriver/oledC_shapeHandler.h" // oledC_DrawRectangle
#include "../appheaderFiles/timeSetUp.h"
#include "../appheaderFiles/display_clock.h"

extern MenuItem currentMenuSelection;
extern MenuItem lastMenuSelection;

const char* getMenuItemText(int menuIndex) {
    switch (menuIndex) {
        case MENU_PEDOMETER_GRAPH: return "Pedometer Graph";
        case MENU_TIME_FORMAT:     return "12H/24H Interval";
        case MENU_SET_TIME:        return "Set Time";
        case MENU_SET_DATE:        return "Set Date";
        case MENU_EXIT:            return "Exit";
        default:                   return "";
    }
}

void displayMenu(void) {
    if (lastMenuSelection == MENU_TOTAL_ITEMS) {
        for (int i = 0; i < MENU_TOTAL_ITEMS; i++) {
            IEC0bits.T1IE = 0;
            if (i == currentMenuSelection) {
                oledC_DrawRectangle(1, 12 + (i * 15), 96, 26 + (i * 15), OLEDC_COLOR_WHITE);
                oledC_DrawString(5, 15 + (i * 15), 1, 1, (uint8_t *)getMenuItemText(i), OLEDC_COLOR_BLACK);
            } else {
                oledC_DrawString(5, 15 + (i * 15), 1, 1, (uint8_t *)getMenuItemText(i), OLEDC_COLOR_WHITE);
            }
            IEC0bits.T1IE = 1;
        }
    } else {
        if (lastMenuSelection != currentMenuSelection) {
            IEC0bits.T1IE = 0;
            oledC_DrawRectangle(1, 12 + (lastMenuSelection * 15), 96, 26 + (lastMenuSelection * 15), OLEDC_COLOR_BLACK);
            oledC_DrawString(5, 15 + (lastMenuSelection * 15), 1, 1, (uint8_t *)getMenuItemText(lastMenuSelection), OLEDC_COLOR_WHITE);
            IEC0bits.T1IE = 1;
        }

        IEC0bits.T1IE = 0;
        oledC_DrawRectangle(1, 12 + (currentMenuSelection * 15), 96, 26 + (currentMenuSelection * 15), OLEDC_COLOR_WHITE);
        oledC_DrawString(5, 15 + (currentMenuSelection * 15), 1, 1, (uint8_t *)getMenuItemText(currentMenuSelection), OLEDC_COLOR_BLACK);
        IEC0bits.T1IE = 1;
    }

    lastMenuSelection = currentMenuSelection;
}

void exitMenu(void) {
    IEC0bits.T1IE = 0;
    OLED_ClearScreen();
    currentMode = clockMode;
    currentMenuSelection = MENU_PEDOMETER_GRAPH;
    lastMenuSelection = MENU_TOTAL_ITEMS;
    oldTime = (TimeData){255, 255, 255, 255, 255}; 
    IEC0bits.T1IE = 1;
}

void executeMenuAction(void) {
    switch (currentMenuSelection) {
        case MENU_PEDOMETER_GRAPH:
            DrawGraphGrid();
            break;
        case MENU_TIME_FORMAT:
            // implemented in app.c
            toggleClockFormat();
            break;
        case MENU_SET_TIME:
            setTimeMode();
            break;
        case MENU_SET_DATE:
            setDateMode();
            break;
        case MENU_EXIT:
            exitMenu();
            break;
        default:
            break;
    }
}

void menuManager(void) {
    IEC0bits.T1IE = 0;
    OLED_ClearScreen();
    IEC0bits.T1IE = 1;
    oldTime = (TimeData){255, 255, 255, 255, 255};
    updateMenuClock();
    displayMenu();
}

void menuButtonManager(uint8_t newS1, uint8_t newS2) {
    if (!newS1 && newS2) {
        LATAbits.LATA8 = 1;
        LATAbits.LATA9 = 0;
        if (currentMenuSelection > 0) {
            currentMenuSelection--;
            displayMenu();
        }
    } else {
        LATAbits.LATA8 = 0;
    }

    if (!newS2 && newS1) {
        LATAbits.LATA9 = 1;
        LATAbits.LATA8 = 0;
        if (currentMenuSelection < MENU_TOTAL_ITEMS - 1) {
            currentMenuSelection++;
            displayMenu();
        }
    } else {
        LATAbits.LATA9 = 0;
    }

    if (!newS1 && !newS2) {
        LATAbits.LATA9 = 1;
        LATAbits.LATA8 = 1;
        executeMenuAction();
    }
}
