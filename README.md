## Post OS Install Tasks/Fixes
### CAN interface
Adapter is running candleLight firmware - https://github.com/candle-usb/candleLight_fw.git

#### CAN interface setup
Latest Raspbery pi comes with systemd support, however attempts to bring CAN interface using systemd were unsuccessful and I have defaulted to /etc/network/interfaces.d method

create file /etc/network/interfaces.d/can0 with content below.
```
allow-hotplug can0
iface can0 can static
 bitrate 1000000
 up ifconfig $IFACE txqueuelen 1024
 pre-up ip link set $IFACE type can bitrate 1000000
 pre-up ip link set $IFACE txqueuelen 1024
```

Also copy udev rule for candleLight devices from candleLight repo
```
sudo cp 70-candle-usb.rules /etc/udev/rules.d/
```

#### USBCAN adapter firmware install/update
TBD

#### Canbus timeout
There is known bug causing out of order packets delivery, [discussed here](https://www.teamfdm.com/forums/topic/1524-debugging-canbus-and-communication-timeout-while-homingbytes_invalid/) and proposed fix
[64 bit CANBUS telegrams out of order issue, fixed in 6.6-rc6](https://lore.kernel.org/all/20230705-gs_usb-rx-offload-v1-6-8e7e46e40137@pengutronix.de/)
The RPi used to runs on kernel 6.1 kernel, however they switched to kernel 6.6 on 2024-03-15, so below command is here for historical reasons.
```
rpi-update rpi-6.6.y
```
