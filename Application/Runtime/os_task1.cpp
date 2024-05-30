#include "os_task1.hpp"
#include "main.h"

OS_TASK1::OS_TASK1()
{
    m_TaskHandle = osThreadNew(this->run, NULL, &m_attributes);
}

auto OS_TASK1::run(void* argument) -> void
{   
    while (true)
    {    
        HAL_GPIO_TogglePin(GPIOD, LD4_Pin);
        osDelay(100);
    }
}