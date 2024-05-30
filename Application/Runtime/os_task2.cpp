#include "os_task2.hpp"
#include "main.h"

OS_TASK2::OS_TASK2()
{
    m_TaskHandle = osThreadNew(this->run, NULL, &m_attributes);
}

auto OS_TASK2::run(void* argument) -> void
{
    while (true)
    {
        HAL_GPIO_TogglePin(GPIOD, LD3_Pin);
        osDelay(500);
    }
}