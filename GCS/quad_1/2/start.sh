#!/bin/bash

set -e
set -x

# geosearch min score
#MIN_SCORE=100
MIN_SCORE=1
MOSAIC_THUMBSIZE=100

CURRENT=$(cd $(dirname $0) && pwd)
IMG_DIR=${CURRENT}/`ls -d */`
TLOG=${CURRENT}/`ls -1t | grep -e tlog$ | head -n 1`

# start geosearch
geosearch.py --sensorwidth 3.674 --lens 4.0 --minscore ${MIN_SCORE} --roll-stabilised --pitch-stabilised --time-offset 0 --mosaic-thumbsize ${MOSAIC_THUMBSIZE} --map-thumbsize 60 --start --vehicle-type Copter --mavlog ${TLOG} ${IMG_DIR}

