#ifndef _OS_RUNTIME_H_
#define _OS_RUNTIME_H_

#include "cmsis_os.h"

volatile osThreadId_t osTask_1_Handle;
const osThreadAttr_t osTask_1_attributes = {
  .name = "osTask_1",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};

volatile osThreadId_t osTask_2_Handle;
const osThreadAttr_t osTask_2_attributes = {
  .name = "osTask_2",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};

volatile osThreadId_t osTask_3_Handle;
const osThreadAttr_t osTask_3_attributes = {
  .name = "osTask_3",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};

volatile osThreadId_t osTask_4_Handle;
const osThreadAttr_t osTask_4_attributes = {
  .name = "osTask_4",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};

void OsTask1(void *argument);
void OsTask2(void *argument);
void OsTask3(void *argument);
void OsTask4(void *argument);

void osCreateTasks(void)
{
	osTask_1_Handle = osThreadNew(OsTask1, NULL, &osTask_1_attributes);
	osTask_2_Handle = osThreadNew(OsTask2, NULL, &osTask_2_attributes);
	osTask_3_Handle = osThreadNew(OsTask3, NULL, &osTask_3_attributes);
	osTask_4_Handle = osThreadNew(OsTask4, NULL, &osTask_4_attributes);
}

#endif /* _OS_RUNTIME_H_ */
