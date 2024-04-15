#!/bin/bash

cp -f /home/klipper/printer_data/config/printers/boards/fysetc-spider/firmware.config /home/klipper/klipper/.config
pushd /home/klipper/klipper
make olddefconfig
make clean
make

if [ ! -d "/home/klipper/printer_data/config/firmware_binaries" ]
then
    mkdir /home/klipper/printer_data/config/firmware_binaries
    chown klipper:klipper /home/klipper/printer_data/config/firmware_binaries
fi

cp -f /home/klipper/klipper/out/klipper.bin /home/klipper/printer_data/config/firmware_binaries/firmware-fysetc-spider.bin

popd
