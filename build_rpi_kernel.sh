#!/bin/bash

echo "configure build output path"

KERNEL_TOP_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
OUTPUT="$KERNEL_TOP_PATH/out"
echo "$OUTPUT"

BUILD_LOG="$KERNEL_TOP_PATH/rpi_build_log.txt"

echo "move kernel source"
cd linux

KERNEL=kernel7
RPI3BPLUS_CONF=bcm2709_defconfig
ARCH_SYS=arm
COMPILER=arm-linux-gnueabihf-
echo "make defconfig"
make ARCH=$ARCH_SYS CROSS_COMPILE=$COMPILER O=$OUTPUT $RPI3BPLUS_CONF

echo "kernel build"
make ARCH=$ARCH_SYS CROSS_COMPILE=$COMPILER O=$OUTPUT zImage modules dtbs -j4 2>&1 | tee $BUILD_LOG
