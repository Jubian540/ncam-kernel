#!/bin/bash

CORE=`cat /proc/cpuinfo |grep "processor"|wc -l`
THREAD=$(($CORE*2))

make clean
if [ ! -f .config ];then
	make hi3516ev200_full_defconfig
fi
make uImage ARCH=arm CROSS_COMPILE=arm-himix100-linux- -j$THREAD

cp arch/arm/boot/uImage ./kernel.bin

