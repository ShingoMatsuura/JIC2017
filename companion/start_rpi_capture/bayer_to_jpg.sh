#!/bin/bash

# usage: bayer_to_jpg.sh source-dir dest-dir
# this script continuously scans the source-dir for *.jpg files
# and does the following:
#    - rpi_to_pgm extracts the bayer image into a .ppm file 
#    - pnmtojpeg converts the .ppm file to source-dir/temp/.jpg 
#    - source-dir/temp/.jpg is moved to dest-dir
#    - source-dir/.ppm file is removed
#    - original .jpg file is removed

CONVERTER=./rpi_to_pgm

# check if converter exists
if [ ! -f $CONVERTER ]; then
    echo "could not find $CONVERTER, exiting"
    exit 1
fi

# check arguments
if [ $# -ne 2 ]; then
    echo "usage: bayer_to_jpg.sh source-dir dest-dir"
    exit 1
fi

SOURCE_DIR=$1
DEST_DIR=$2
TEMP_DIR=$SOURCE_DIR/temp

# create directories
mkdir -p $SOURCE_DIR
mkdir -p $TEMP_DIR
mkdir -p $DEST_DIR

# file pattern matching returns null if no matching files 
shopt -s nullglob

echo "searching for .jpg images in $SOURCE_DIR"

errcount=0

while [ 1 ]; do

    file_found=0

    for f in $SOURCE_DIR/*.jpg; do

       # extract bayer from jpg (produces .ppm file)
       echo "Extract bayer from $f using $CONVERTER"
       $CONVERTER $f
       echo "done extracter"

       # convert ppm to jpeg
       filename_base=$(basename $f .jpg)
       if [ -f $SOURCE_DIR/$filename_base.ppm ]; then
           echo "convert $SOURCE_DIR/$filename_base.ppm to png"
           pnmtojpeg --quality 100 $SOURCE_DIR/$filename_base.ppm > $TEMP_DIR/$filename_base.jpg
   
           # remove ppm
           rm -f $SOURCE_DIR/$filename_base.ppm
           echo "removed $filename_base.ppm"

           # move jpg to DEST_DIR
           mv -f $TEMP_DIR/$filename_base.jpg $DEST_DIR

           # remove original jpg
           rm -f $SOURCE_DIR/$filename_base.jpg
       else
           # move original jpg to dest directory
           mv -f $SOURCE_DIR/$filename_base.jpg $DEST_DIR
       fi
       
       # flag that we found a file
       file_found=1

    done

    # sleep only if no files found
    if [ $file_found = 0 ] ; then
        sleep 1
	errcount=$((errcount+1))
	echo "errcount=$errcount"
	if [ $errcount -gt 5 ]; then
		errcount=0
		killall -9 raspistill
		echo "Killed raspistill"
	fi
   else
	errcount=0
   fi 
done

