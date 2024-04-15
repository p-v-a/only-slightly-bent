#!/bin/bash

pushd /home/klipper/klipper
service klipper stop
make flash
# Reset ownership
chown klipper:klipper -R /home/klipper/klipper

service klipper start
popd
