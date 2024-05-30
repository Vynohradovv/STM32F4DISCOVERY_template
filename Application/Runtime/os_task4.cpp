#include "os_task4.hpp"
#include "main.h"

OS_TASK4::OS_TASK4()
{
    m_TaskHandle = osThreadNew(this->run, NULL, &m_attributes);
}

auto OS_TASK4::run(void* argument) -> void
{
    while (true)
    {
        HAL_GPIO_TogglePin(GPIOD, LD6_Pin);
        osDelay(600);
    }
}