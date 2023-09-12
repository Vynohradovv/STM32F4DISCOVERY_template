#include <stdbool.h>
#include "cmsis_os.h"

#include "main.h"

void OsTask1(void *argument)
{

    while(true)
    {
        HAL_GPIO_TogglePin(GPIOD, LD4_Pin);
        osDelay(100);
    }
}
