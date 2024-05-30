#include "os_task3.hpp"
#include "main.h"

OS_TASK3::OS_TASK3()
{
    m_TaskHandle = osThreadNew(this->run, NULL, &m_attributes);
}

auto OS_TASK3::run(void* argument) -> void
{
    while (true)
    {
        HAL_GPIO_TogglePin(GPIOD, LD5_Pin);
        osDelay(200);
    }
}