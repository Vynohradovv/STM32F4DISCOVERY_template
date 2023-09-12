#include <stdbool.h>
#include "cmsis_os.h"

#include "main.h"

void OsTask3(void *argument)
{

    while(true)
    {
        HAL_GPIO_TogglePin(GPIOD, LD5_Pin);
        osDelay(200);
    }
}