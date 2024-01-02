#!/bin/bash

KERNEL_TOP_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
OUTPUT="$KERNEL_TOP_PATH/out"
echo "$OUTPUT"

cd linux

BOOT_PATH=/root/test/boot

make O=$OUTPUT modules_install
echo "Copy Kernel Image to SD Card"
cp $OUTPUT/arch/arm/boot/dts/*.dtb $BOOT_PATH/
cp $OUTPUT/arch/arm/boot/dts/overlays/*.dtb* $BOOT_PATH/overlays/
cp $OUTPUT/arch/arm/boot/dts/overlays/README $BOOT_PATH/overlays/
cp $OUTPUT/arch/arm/boot/zImage $BOOT_PATH/kernel7.img
