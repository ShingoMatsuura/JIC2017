#!/bin/bash

set -e
set -x

geosearch.py --sensorwidth 3.674 --lens 40 --minscore 1000 --roll-stabilised --time-offset 1 --mavlog $1/mav.tlog $1