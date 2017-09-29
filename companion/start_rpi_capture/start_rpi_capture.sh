#!/bin/bash

set -e
set -x

QUALITY=100

# create directory for images
#BASE_DIR=/media/usb0/
BASE_DIR=~/images
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
raspistill -n -r -ISO 400 -q $QUALITY -v -dt -t 3600000 -tl 0 -o ${IMAGE_DIR}/%dZ.jpg

