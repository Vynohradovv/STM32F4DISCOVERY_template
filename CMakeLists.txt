#############################################################################################################################
# file:  CMakeLists.txt
# brief: Template "CMakeLists.txt" for building of executables and static libraries.
#
# usage: Edit "VARIABLES"-section to suit project requirements.
#        For debug build:
#          cmake -DCMAKE_TOOLCHAIN_FILE=cubeide-gcc.cmake  -S ./ -B Debug -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug
#          make -C Debug VERBOSE=1
#        For release build:
#          cmake -DCMAKE_TOOLCHAIN_FILE=cubeide-gcc.cmake  -S ./ -B Release -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
#          make -C Release VERBOSE=1
#############################################################################################################################
cmake_minimum_required(VERSION 3.20)

###################### CONSTANTS ######################################
set (PROJECT_TYPE_EXECUTABLE          "exe")
set (PROJECT_TYPE_STATIC_LIBRARY      "static-lib")
set (MCPU_CORTEX_M0				      "-mcpu=cortex-m0")
set (MCPU_CORTEX_M0PLUS				  "-mcpu=cortex-m0plus")
set (MCPU_CORTEX_M3				      "-mcpu=cortex-m3")
set (MCPU_CORTEX_M4				      "-mcpu=cortex-m4")
set (MCPU_CORTEX_M7				      "-mcpu=cortex-m7")
set (MCPU_CORTEX_M33				  "-mcpu=cortex-m33")
set (MFPU_FPV4_SP_D16                 "-mfpu=fpv4-sp-d16")
set (MFPU_FPV5_D16                    "-mfpu=fpv5-d16")
set (RUNTIME_LIBRARY_REDUCED_C        "--specs=nano.specs")
set (RUNTIME_LIBRARY_STD_C            "")
set (RUNTIME_LIBRARY_SYSCALLS_MINIMAL "--specs=nosys.specs")
set (RUNTIME_LIBRARY_SYSCALLS_NONE    "")
set (MFLOAT_ABI_SOFTWARE              "-mfloat-abi=soft")
set (MFLOAT_ABI_HARDWARE              "-mfloat-abi=hard")
set (MFLOAT_ABI_MIX                   "-mfloat-abi=softfp")
#######################################################################

###################### VARIABLES ######################################
set (PROJECT_NAME             "STM32F407Discovery")
set (PROJECT_TYPE             "exe")
set (MCPU                     "-mcpu=Cortex-M4")
set (MFPU                     "-mfpu=fpv4-sp-d16")
set (MFLOAT_ABI               "-mfloat-abi=hard")
set (RUNTIME_LIBRARY          "--specs=nano.specs")
set (RUNTIME_LIBRARY_SYSCALLS "--specs=nosys.specs")

set (PROJECT_SOURCES
	# LIST SOURCE FILES HERE  
  ${CMAKE_SOURCE_DIR}/App/main.c 
)

set (PROJECT_INCLUDES
	# LIST INCLUDE DIRECTORIES HERE
)

set (PROJECT_CUBEMX_SOURCES
	# LIST CUBEMX SOURCE FILES HERE  
    ${CMAKE_SOURCE_DIR}/CubeMX/Core/Src/stm32f4xx_it.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Core/Src/stm32f4xx_hal_msp.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/USB_HOST/App/usb_host.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/USB_HOST/Target/usbh_conf.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/USB_HOST/Target/usbh_platform.c
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_ll_usb.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s_ex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Core/Src/system_stm32f4xx.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_core.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Src/usbh_pipes.c 
    ${CMAKE_SOURCE_DIR}/CubeMX/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Src/usbh_cdc.c 

    ${CMAKE_SOURCE_DIR}/CubeMX/startup_stm32f407xx.s
	)

set (PROJECT_DEFINES
	# LIST COMPILER DEFINITIONS HERE
    "DEBUG"
    "STM32F407xx"
    "USE_HAL_DRIVER"

    )

set (PROJECT_CUBEMX_INCLUDES
	# LIST CUBEMX INCLUDE DIRECTORIES HERE
    ${CMAKE_SOURCE_DIR}/CubeMX/USB_HOST/App 
    ${CMAKE_SOURCE_DIR}/CubeMX/USB_HOST/Target 
    ${CMAKE_SOURCE_DIR}/CubeMX/Core/Inc 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy 
    ${CMAKE_SOURCE_DIR}/CubeMX/Middlewares/ST/STM32_USB_Host_Library/Core/Inc 
    ${CMAKE_SOURCE_DIR}/CubeMX/Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/CMSIS/Device/ST/STM32F4xx/Include 
    ${CMAKE_SOURCE_DIR}/CubeMX/Drivers/CMSIS/Include
  )

set (LINKER_SCRIPT
    ${CMAKE_SOURCE_DIR}/CubeMX/STM32F407VGTx_FLASH.ld
  )

############ MODIFY ACCORDING TO REQUIREMENTS) ########################

#######################################################################

################## PROJECT SETUP ######################################
project(${PROJECT_NAME})
enable_language(ASM)

if (${PROJECT_TYPE} MATCHES ${PROJECT_TYPE_EXECUTABLE})
  add_executable(${PROJECT_NAME} ${PROJECT_CUBEMX_SOURCES} ${PROJECT_SOURCES})
  # Execute post-build to print size
  add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD 
  COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${CMAKE_PROJECT_NAME}>)
  # Convert output to hex and binary
  add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_PROJECT_NAME}.hex)
  # Convert to bin file -> add conditional check?
  add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_PROJECT_NAME}.bin)
elseif (${PROJECT_TYPE} MATCHES ${PROJECT_TYPE_STATIC_LIBRARY})
  add_library(${PROJECT_NAME} ${PROJECT_CUBEMX_SOURCES} ${PROJECT_SOURCES})
endif()

add_compile_definitions (${PROJECT_DEFINES})
include_directories (${PROJECT_CUBEMX_INCLUDES} ${PROJECT_INCLUDES})

set (CMAKE_EXECUTABLE_SUFFIX ".elf")
set (CMAKE_STATIC_LIBRARY_SUFFIX ".a")
set (CMAKE_C_FLAGS "${MCPU} -std=gnu11 ${MFPU} ${MFLOAT_ABI} ${RUNTIME_LIBRARY} -mthumb -Wall -Werror")
set (CMAKE_EXE_LINKER_FLAGS "-T${LINKER_SCRIPT} ${RUNTIME_LIBRARY_SYSCALLS} -Wl,-Map=${PROJECT_NAME}.map -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group")
set (CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -x assembler-with-cpp")