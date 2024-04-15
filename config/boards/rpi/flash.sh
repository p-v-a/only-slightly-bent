#!/bin/bash

pushd /home/klipper/klipper
service klipper stop
make flash
# Reset ownership
chown klipper:klipper -R /home/klipper/klipper

cp ./scripts/klipper-mcu.service /etc/systemd/system/
systemctl enable klipper-mcu.service

service klipper start
popd
