include_directories(${CMAKE_SOURCE_DIR}/Platform/Core/Inc)
include_directories(${CMAKE_SOURCE_DIR}/Platform/USB_HOST/App)
include_directories(${CMAKE_SOURCE_DIR}/Platform/USB_HOST/Target)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Inc)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/include)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Middlewares/ST/STM32_USB_Host_Library/Core/Inc)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Drivers/CMSIS/Device/ST/STM32F4xx/Include)
include_directories(${CMAKE_SOURCE_DIR}/Platform/Drivers/CMSIS/Include)

list(APPEND PROJECT_CUBEMX_SOURCES

    ${CMAKE_SOURCE_DIR}/Platform/Core/Src/main.c 
    ${CMAKE_SOURCE_DIR}/Platform/Core/Src/freertos.c 
    ${CMAKE_SOURCE_DIR}/Platform/Core/Src/stm32f4xx_it.c 
    ${CMAKE_SOURCE_DIR}/Platform/Core/Src/stm32f4xx_hal_msp.c 
    ${CMAKE_SOURCE_DIR}/Platform/Core/Src/stm32f4xx_hal_timebase_tim.c 
    ${CMAKE_SOURCE_DIR}/Platform/USB_HOST/App/usb_host.c 
    ${CMAKE_SOURCE_DIR}/Platform/USB_HOST/Target/usbh_conf.c 
    ${CMAKE_SOURCE_DIR}/Platform/USB_HOST/Target/usbh_platform.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s_ex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c 
    ${CMAKE_SOURCE_DIR}/Platform/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c 
    ${CMAKE_SOURCE_DIR}/Platform/Core/Src/system_stm32f4xx.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/croutine.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/list.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/queue.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/tasks.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/timers.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/cmsis_os2.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c 
    ${CMAKE_SOURCE_DIR}/Platform/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Src/usbh_cdc.c

    ${CMAKE_SOURCE_DIR}/Platform/startup_stm32f407xx.s
)

set_source_files_properties(PROJECT_CUBEMX_SOURCES LANGUAGE C)


set_source_files_properties(PROJECT_PLATFORM_PORTS LANGUAGE CXX)

set(PROJECT_PLATFORM_SOURCES
    ${PROJECT_CUBEMX_SOURCES}   
)