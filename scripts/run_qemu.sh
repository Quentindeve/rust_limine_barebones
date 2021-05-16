#!/bin/bash
qemu-system-x86_64 build/kernel.img -serial stdio -d cpu_reset,int -no-reboot