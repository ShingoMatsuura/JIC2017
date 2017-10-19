#!/bin/bash

# WARNING: this script is run as root!
set -e
set -x

# set timezone to GMT
export TZ=GMT

# sleep 30 seconds to allow system time to be set
sleep 30

pushd ~apsync/start_rpi_capture

# directory for images
SOURCE_DIR=/var/images
DATETIME_DIR=$(date +"%Y%m%d_%H-%M-%S")
DEST_DIR=/media/usb0/images/${DATETIME_DIR}

# create DEST_DIR
mkdir -p ${DEST_DIR}

# start rpi capture
screen -L -d -m -S rpi_capture -s /bin/bash ./start_rpi_capture.sh >start_rpi_capture.log 2>&1

# start bayer to jpg conversion
screen -L -d -m -S bayer_to_jpg -s /bin/bash ./bayer_to_jpg.sh ${SOURCE_DIR} ${DEST_DIR} >bayer_to_jpg.log 2>&1

exit 0

