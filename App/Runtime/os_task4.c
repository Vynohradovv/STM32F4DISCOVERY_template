#include <stdbool.h>
#include "cmsis_os.h"

#include "main.h"

void OsTask4(void *argument)
{

    while(true)
    {
        HAL_GPIO_TogglePin(GPIOD, LD6_Pin);
        osDelay(600);
    }
}