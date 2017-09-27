#!/bin/bash

set -e
set -x

QUALITY=100

# create datetime directory for images
DATETIME_DIR=$(date "+%Y%m%d_%H-%M-%S")
mkdir /mnt/img/${DATETIME_DIR}

FILE_NAME=$(date "%Y%m%d%H%M%S%2N")
#ln -s latest_img.jpg fake_chameleon.pgm

## TODO: check param, ISO:400
raspistill -w 1280 -h 960 -n -r -ISO 400 -q $QUALITY -v -dt -t 3600000 -tl 0 -o /mnt/img/${DATETIME_DIR}/${FILE_NAME}Z.jpg

#change to /mnt
cd /mnt

#start mavproxy
mavproxy.py --master localhost:14655 --aircraft MyCopter

