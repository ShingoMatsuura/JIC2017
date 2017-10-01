#!/bin/bash

set -e
set -x

# wait 30 seconds to allow APWeb to set system time from the GPS
sleep 30

QUALITY=100

# create directory for images
BASE_DIR=/media/usb0/images
#BASE_DIR=~/images
DATETIME_DIR=$(date +"%Y%m%d_%H-%M-%S")
IMAGE_DIR=${BASE_DIR}/${DATETIME_DIR}

# create base directory
if [ ! -d ${BASE_DIR} ]
then
    mkdir ${BASE_DIR}
fi

# create image directory
if [ ! -d ${IMAGE_DIR} ]
then
    mkdir ${IMAGE_DIR}
fi

## TODO: check param, ISO:400
while [ 1 ]; do
    raspistill -n -r -ISO 400 -q $QUALITY -v -dt -t 3600000 -tl 3500 -o ${IMAGE_DIR}/%dZ.jpg
    echo "*************** raspistill exited, restarting ******************"
    sleep 1
done

