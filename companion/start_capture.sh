#!/bin/bash

set -e
set -x

QUALITY=100

# create datetime directory for images
DATETIME_DIR=$(date +"%Y%m%d_%H-%M-%S")
mkdir /media/usb0/${DATETIME_DIR}

#ln -s latest_img.jpg fake_chameleon.pgm

## TODO: check param, ISO:400
raspistill -n -r -ISO 400 -q $QUALITY -v -dt -t 3600000 -tl 0 -o /media/usb0/${DATETIME_DIR}/%dZ.jpg

#change to /mnt
#cd /media/usb0

#start mavproxy
#mavproxy.py --master localhost:14655 --aircraft MyCopter