#include "./System//system.h"
#include "./appheaderFiles/app.h"
#include "./appheaderFiles/button_handler.h"

int main(void) {
    SYSTEM_Initialize();
    App_Init();
    App_Run();
    return 1;
}
