FROM ubuntu:23.10

# https://serverfault.com/a/797318
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install sudo
RUN apt-get upgrade -y

RUN apt-get install gcc-arm-none-eabi libstdc++-arm-none-eabi-newlib -y

RUN apt-get install build-essential cmake -y
RUN apt-get install wget openssh-client -y

RUN apt-get install gdb-multiarch -y
RUN ln -s /usr/bin/gdb-multiarch /usr/bin/arm-none-eabi-gdb

# CodeChecker

RUN apt-get install clang clang-tidy cppcheck build-essential wget gcc-multilib git python3-pip python3-dev python3-venv srecord -y
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.39.3/install.sh | bash
CMD source ~/.profile && nvm install v16.20.2

RUN apt-get install cmake -y

# Google Test

RUN apt-get install libgtest-dev -y
RUN cd /usr/src/gtest && cmake CMakeLists.txt && make
RUN cp /usr/src/gtest/lib/*.a /usr/lib

# Doxygen

RUN apt-get install doxygen graphviz -y

RUN useradd -m user && echo "user:$(mkpasswd -s </dev/null)" | chpasswd -e && adduser user sudo

USER user
WORKDIR /home/user
    
# CodeChecker

ENV PATH="${PATH}:/home/user/.local/bin"

RUN pip3 install --user --break-system-packages codechecker