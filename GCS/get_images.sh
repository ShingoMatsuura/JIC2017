#!/bin/bash

# download images
scp "apsync@10.0.1.128:/home/apsync/image/*Z.jpg" "~images"

# download tlogs
scp "apsync@10.0.1.128:/home/apsync/start_mavproxy/mav*.tlog" "~images"
