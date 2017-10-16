#!/bin/bash

set -e
set -x

killall -9 start_rpi_capture.sh
killall -9 bayer_to_jpg.sh

