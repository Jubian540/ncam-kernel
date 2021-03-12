#!/bin/bash

CORE=`cat /proc/cpuinfo |grep "processor"|wc -l`
THREAD=$(($CORE*2))

make clean
make uImage ARCH=arm CROSS_COMPILE=arm-himix100-linux- -j$THREAD

cp arch/arm/boot/uImage ./kernel.bin

