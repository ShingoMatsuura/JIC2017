#!/bin/bash

set -e
set -x

# set timezone to GMT
export TZ=GMT

# sleep 30 seconds to allow system time to be set
#sleep 30

QUALITY=100
ISO=100

# create directory for images
BASE_DIR=/var/images
DATETIME_DIR=$(date +"%Y%m%d_%H-%M-%S")
IMAGE_DIR=${BASE_DIR}
DATETIME_YEAR=$(date +"%Y")

# create base directory
#mkdir -p ${BASE_DIR}

# create image directory
#mkdir -p ${IMAGE_DIR}

# take pictures using raspistill timelapse
while [ 1 ]; do
    raspistill -n -r -ISO $ISO -q $QUALITY -v -dt -t 3600000 -tl 2000 -o ${IMAGE_DIR}/${DATETIME_YEAR}%d00Z.jpg > raspistill.log 2>&1 || /bin/true
    echo " *************** raspistill exited, restarting ***************"
    sleep 1
done

