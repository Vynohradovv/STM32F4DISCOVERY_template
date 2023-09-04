FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update \
    && apt-get -y install cmake \
    && apt-get -y install ninja-build \
    && apt-get -y install gcc-arm-none-eabi \
    && apt-get -y install gdb-multiarch \
    && apt-get -y install libnewlib-arm-none-eabi

RUN git clone https://github.com/cpputest/cpputest.git ~/cpputest \
    && cd ~/cpputest \
    && cmake -B cpputest_build \
    && cmake --build cpputest_build \
    && cd cpputest_build \
    && make install