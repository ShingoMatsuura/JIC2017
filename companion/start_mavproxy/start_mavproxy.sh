#!/bin/bash

TLOGDIR=/media/usb0/tlog

# figure out logfile name
counter=0
if [[ -e ${TLOGDIR}/mav-$counter.tlog ]] ; then
    while [[ -e ${TLOGDIR}/mav-$counter.tlog ]] ; do
        let counter++
    done
fi

logfilename=${TLOGDIR}/"mav-$counter".tlog
#echo $logfilename

set -e
set -x

# start mavproxy with:
#    - main connection to cmavnode via UDP
#    - udp connection on port 9000 for use by other processes
#    - udp broadcast connection to allow multiple GCSs to connect to the flight controller via mavproxy
mavproxy.py \
    --logfile $logfilename \
    --source-system 217 \
    --master localhost:14655 \
    --mav10

