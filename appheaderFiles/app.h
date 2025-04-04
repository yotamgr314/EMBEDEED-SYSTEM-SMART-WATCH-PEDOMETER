#ifndef APP_H
#define APP_H

#include <stdint.h>     // ???? ???? uint8_t
#include <stdbool.h>    // ???? ???? bool

#ifdef __cplusplus
extern "C" {
#endif

// =======================
// Constants
// =======================
#define STEP_THRESHOLD 300
#define SCREEN_UPDATE_INTERVAL 1000
#define STEP_ARRAY_SIZE 60
#define WALKING_ARRY_SIZE 90

// =======================
// Structs and Enums
// =======================
typedef struct TimeData {
    uint8_t month;
    uint8_t day;
    uint8_t hours;
    uint8_t minutes;
    uint8_t seconds;
} TimeData;

typedef enum {
    MENU_PEDOMETER_GRAPH,
    MENU_TIME_FORMAT,
    MENU_SET_TIME,
    MENU_SET_DATE,
    MENU_EXIT,
    MENU_TOTAL_ITEMS
} MenuItem;

typedef enum {
    clockMode = 0,
    menuMode,
    setTime,
    setDate,
    Interval_12H24H,
    pedometerGraph
} DisplyMode;

typedef unsigned char SETTIMES;
#define SET_HOUR    0
#define SET_MINUTES 1

typedef unsigned char SETDATES;
#define SET_DAY     0
#define SET_MONTH   1

// =======================
// Extern Globals
// =======================
extern TimeData currentTime;
extern TimeData oldTime;
extern MenuItem currentMenuSelection;
extern MenuItem lastMenuSelection;
extern DisplyMode currentMode;
extern bool is12HFormat;
extern SETTIMES selectedTimePart;
extern SETDATES selectedDatesPart;

// =======================
// Public API
// =======================
void App_Init(void);
void App_Run(void);
void updateDisplayClock(void); // ??? ?-button_handler ???? ????? ??
void returnToMenu(void);
#ifdef __cplusplus
}
#endif

#endif // APP_H
