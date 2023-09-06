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

set (PROJECT_NAME                     "STM32F407Discovery")
project(${PROJECT_NAME})

###################### CONSTANTS ######################################
set (MCPU_CORTEX_M0				        "-mcpu=cortex-m0")
set (MCPU_CORTEX_M0PLUS				    "-mcpu=cortex-m0plus")
set (MCPU_CORTEX_M3				        "-mcpu=cortex-m3")
set (MCPU_CORTEX_M4				        "-mcpu=cortex-m4")
set (MCPU_CORTEX_M7				        "-mcpu=cortex-m7")
set (MCPU_CORTEX_M33				    "-mcpu=cortex-m33")
set (MFPU_FPV4_SP_D16                   "-mfpu=fpv4-sp-d16")
set (MFPU_FPV5_D16                      "-mfpu=fpv5-d16")
set (RUNTIME_LIBRARY_REDUCED_C          "--specs=nano.specs")
set (RUNTIME_LIBRARY_STD_C              "")
set (RUNTIME_LIBRARY_SYSCALLS_MINIMAL   "--specs=nosys.specs")
set (RUNTIME_LIBRARY_SYSCALLS_NONE      "")
set (MFLOAT_ABI_SOFTWARE                "-mfloat-abi=soft")
set (MFLOAT_ABI_HARDWARE                "-mfloat-abi=hard")
set (MFLOAT_ABI_MIX                     "-mfloat-abi=softfp")
#######################################################################

option(PROJECT_UITTESTS "Compile the tests" OFF)
if(PROJECT_UITTESTS)
    add_subdirectory(Tests)
else(PROJECT_UITTESTS)
    add_subdirectory(App)
endif(PROJECT_UITTESTS)