#!/bin/bash

pushd /home/klipper/klipper
sudo systemctl stop klipper.service
sudo systemctl stop klipper-mcu.service

make flash

sudo cp ./scripts/klipper-mcu.service /etc/systemd/system/
sudo chown root:root /etc/systemd/system/klipper-mcu.service
sudo systemctl enable klipper-mcu.service

sudo systemctl start klipper-mcu.service
sudo systemctl start klipper.service
popd
