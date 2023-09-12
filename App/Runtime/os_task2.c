#include <stdbool.h>
#include "cmsis_os.h"

#include "main.h"

void OsTask2(void *argument)
{

    while(true)
    {
        HAL_GPIO_TogglePin(GPIOD, LD3_Pin);
        osDelay(500);
    }
}