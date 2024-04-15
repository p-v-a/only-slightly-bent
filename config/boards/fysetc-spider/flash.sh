#!/bin/bash

MCU_CAN_ID=4b86c84f3a5b
FW_BIN=/home/klipper/printer_data/config/firmware_binaries/firmware-fysetc-spider.bin
FLASH_SCRIPT=/home/klipper/katapult/scripts/flashtool.py
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

${FLASH_SCRIPT} -i can0 -f ${FW_BIN} -u ${MCU_CAN_ID}
