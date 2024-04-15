#!/bin/bash

pushd /home/klipper/klipper
echo "flashing rpi-mcu"
cp -f /home/klipper/only-slightly-bent/config/boards/rpi/firmware.config /home/klipper/klipper/.config
make olddefconfig
make clean
# Reset ownership
chown klipper:klipper -R /home/klipper/klipper
popd
