#pragma once

#include "cmsis_os.h"

class OS_TASK2
{
public:
    static auto run(void* argument) -> void;

    static OS_TASK2& getInstance()
    {
        static OS_TASK2 instance;
        return instance;
    }

private:
    OS_TASK2();
    ~OS_TASK2() = default;

    osThreadId_t m_TaskHandle;

    osThreadAttr_t const m_attributes = {
            .name = "osTask_2",
            .stack_size = 128 * 4,
            .priority = (osPriority_t)osPriorityNormal,
    };
};

static OS_TASK2& os_task2 = OS_TASK2::getInstance();