#pragma once

#include "cmsis_os.h"

class OS_TASK4
{
public:
    static auto run(void* argument) -> void;

    static OS_TASK4& getInstance()
    {
        static OS_TASK4 instance;
        return instance;
    }

private:
    OS_TASK4();
    ~OS_TASK4() = default;

    osThreadId_t m_TaskHandle;

    osThreadAttr_t const m_attributes = {
            .name = "osTask_4",
            .stack_size = 128 * 4,
            .priority = (osPriority_t)osPriorityNormal,
    };
};

static OS_TASK4& os_task4 = OS_TASK4::getInstance();