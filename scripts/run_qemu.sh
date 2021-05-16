#!/bin/bash
qemu-system-x86_64 --enable-kvm build/kernel.img -serial stdio -no-reboot