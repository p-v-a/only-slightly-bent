#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "ERROR: Please run as root"
  exit
fi

pushd /home/klipper/klipper
systemctl stop klipper.service
systemctl stop klipper-mcu.service
make flash
# Reset ownership
chown klipper:klipper -R /home/klipper/klipper

cp ./scripts/klipper-mcu.service /etc/systemd/system/
systemctl enable klipper-mcu.service

systemctl start klipper-mcu.service
systemctl start klipper.service
popd
