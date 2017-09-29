#!/bin/bash

set -e

IMAGE_DIR=~/images

# check image directory exists
if [ ! -d ${IMAGE_DIR} ]
then
    echo "No image directory: ${IMAGE_DIR}"
    exit 0
fi

echo "pictures before:"
find $IMAGE_DIR -name "*Z.jpg?" | wc -l

echo "clearing pics from $IMAGE_DIR .."
find $IMAGE_DIR -name "*Z.jpg?" -delete

echo "pictures after:"
find $IMAGE_DIR -name "*Z.jpg?" | wc -l

