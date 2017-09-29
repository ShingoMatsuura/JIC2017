#!/bin/bash

# WARNING: this script is run as root!
set -e
set -x

pushd ~apsync/start_rpi_capture
screen -L -d -m -S rpi_capture -s /bin/bash ./start_rpi_capture.sh >start_rpi_capture.log 2>&1

exit 0

