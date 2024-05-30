######################  INCLUDE  ######################################
include(${CMAKE_SOURCE_DIR}/CMake/platform.cmake)
include (${CMAKE_SOURCE_DIR}/CMake/application.cmake)
###################### VARIABLES ######################################
set (MCPU                             ${MCPU_CORTEX_M4})
set (MFPU                             ${MFPU_FPV4_SP_D16})
set (MFLOAT_ABI                       ${MFLOAT_ABI_HARDWARE})
set (RUNTIME_LIBRARY                  ${RUNTIME_LIBRARY_REDUCED_C})
set (RUNTIME_LIBRARY_SYSCALLS         ${RUNTIME_LIBRARY_SYSCALLS_MINIMAL})

set (PROJECT_DEFINES
    # LIST COMPILER DEFINITIONS HERE   
    "DEBUG"
    "STM32F407xx"
    "USE_HAL_DRIVER"
    )

set (LINKER_SCRIPT
    ${CMAKE_SOURCE_DIR}/Platform/STM32F407VGTx_FLASH.ld
  )

############ MODIFY ACCORDING TO REQUIREMENTS) ########################

#######################################################################

################## PROJECT SETUP ######################################

enable_language(ASM)

add_executable(${PROJECT_NAME} ${PROJECT_PLATFORM_SOURCES} ${PROJECT_APPLICATION_SOURCES} ${PROJECT_EXTERNAL_SOURCES})
# Convert output to hex and binary
add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_PROJECT_NAME}.hex)
# Convert to bin file -> add conditional check?
add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${CMAKE_PROJECT_NAME}> ${CMAKE_PROJECT_NAME}.bin)

add_compile_definitions (${PROJECT_DEFINES})
# include_directories (${PROJECT_CUBEMX_INCLUDES} ${PROJECT_INCLUDES})

set (CMAKE_EXECUTABLE_SUFFIX ".elf")
set (CMAKE_STATIC_LIBRARY_SUFFIX ".a")
set (CMAKE_C_FLAGS "${MCPU} ${MFPU} ${MFLOAT_ABI} ${RUNTIME_LIBRARY} -Og -mthumb -fdata-sections -ffunction-sections -g -gdwarf-2 -Wall -Werror")
set (CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")
set (CMAKE_EXE_LINKER_FLAGS "-T${LINKER_SCRIPT} ${RUNTIME_LIBRARY_SYSCALLS} -Wl,-Map=${CMAKE_PROJECT_NAME}.map -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group -Wl,--print-memory-usage")
set (CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -x assembler-with-cpp")
