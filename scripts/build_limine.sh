#!/bin/bash

dd if=/dev/zero bs=1M count=0 seek=64 of=build/kernel.img
parted -s build/kernel.img mklabel msdos
parted -s build/kernel.img mkpart primary 1 100%
parted -s build/kernel.img set 1 boot on

echfs-utils -m -p0 build/kernel.img quick-format 32768
echfs-utils -m -p0 build/kernel.img import limine/limine.sys limine.sys
echfs-utils -m -p0 build/kernel.img import limine.cfg limine.cfg
echfs-utils -m -p0 build/kernel.img import target/x86_64/debug/adamant kernel.elf

# echfs-utils -m -p0 kernel.img import <path to file> <path in image>
./limine/limine-install-linux-x86_64 build/kernel.img