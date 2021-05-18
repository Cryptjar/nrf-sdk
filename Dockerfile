FROM ubuntu:18.04


# Install the base software
RUN apt-get update && apt-get install --no-install-recommends -y \
	wget ca-certificates unzip make \
	&& rm -rf /var/lib/apt/lists/*


# Install the ARM GCC compiler and libraries
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 \
	&& tar -xjf gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 \
	&& rm gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2


# Install the Nordic SDK and tweak the posix makefile
RUN wget https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip \
	&& unzip nRF5_SDK_15.3.0_59ac345.zip \
	&& rm nRF5_SDK_15.3.0_59ac345.zip \
	&& rm -r nRF5_SDK_15.3.0_59ac345/examples \
	&& echo "GNU_INSTALL_ROOT ?= /gcc-arm-none-eabi-8-2018-q4-major/bin/" > /nRF5_SDK_15.3.0_59ac345/components/toolchain/gcc/Makefile.posix \
	&& echo "GNU_VERSION ?= 8.2.1" >> /nRF5_SDK_15.3.0_59ac345/components/toolchain/gcc/Makefile.posix \
	&& echo "GNU_PREFIX ?= arm-none-eabi" >> /nRF5_SDK_15.3.0_59ac345/components/toolchain/gcc/Makefile.posix


# The environment variables
ENV PATH /gcc-arm-none-eabi-8-2018-q4-major/bin:$PATH
ENV NRF52_SDK_15_3_0_HOME /nRF5_SDK_15.3.0_59ac345


CMD bash

