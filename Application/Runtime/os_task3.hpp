#pragma once

#include "cmsis_os.h"

class OS_TASK3
{
public:
    static auto run(void* argument) -> void;

    static OS_TASK3& getInstance()
    {
        static OS_TASK3 instance;
        return instance;
    }

private:
    OS_TASK3();
    ~OS_TASK3() = default;

    osThreadId_t m_TaskHandle;

    osThreadAttr_t const m_attributes = {
            .name = "osTask_3",
            .stack_size = 128 * 4,
            .priority = (osPriority_t)osPriorityNormal,
    };
};

static OS_TASK3& os_task3 = OS_TASK3::getInstance();