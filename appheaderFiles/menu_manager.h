#ifndef MENU_MANAGER_H
#define MENU_MANAGER_H

#include <stdint.h>

void displayMenu(void);
void executeMenuAction(void);
void menuManager(void);
void exitMenu(void);
void menuButtonManager(uint8_t newS1, uint8_t newS2);
const char* getMenuItemText(int menuIndex);

#endif // MENU_MANAGER_H
