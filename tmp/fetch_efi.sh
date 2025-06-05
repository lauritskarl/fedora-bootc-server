#!/bin/bash
RELEASE=42
mkdir -p /tmp/efi/boot/efi
dnf install -y --downloadonly --releasever=$RELEASE --forcearch=aarch64 --installroot=/tmp/efi/ uboot-images-armv8 bcm283x-firmware bcm283x-overlays
if [ -f "/tmp/efi/usr/share/uboot/rpi_arm64/u-boot.bin" ]; then
    mv /tmp/efi/usr/share/uboot/rpi_arm64/u-boot.bin /tmp/efi/boot/efi/rpi-u-boot.bin
    echo "Successfully moved u-boot.bin"
else
    echo "u-boot.bin not found at expected location"
    find /tmp/efi -name "u-boot.bin" -type f
    exit 1
fi
