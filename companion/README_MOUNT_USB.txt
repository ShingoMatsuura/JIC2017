#####################################################################
  Setting to mount USB memory and save images and tlog
#####################################################################

#1. insert USB memory to RPI

#2. check USB connection. you can find /dev/sda1
sudo fdisk -l

#3. create a partition of USB memory
sudo fdisk /dev/sda1

#3-1. add partition, enter n
Command (m for help):n

#3-2. information partition, enter p
Select (default p):p

#3-3. select partition, enter 1
Partition number (1-4, default):

#3-4. set first sector, enter default value
First sector (2048-60062467, default 2048):2048

#3-5. set last sector, enter default value
Last sector, +sectors or +size{K,M,G,T,P} (2048-60062467, default 60062467):60062467

## this message will be shown
## Created a new partition 1 of type 'Linux' and of size 28.7 GiB.

#3-6. write partition, enter w
Command (m for help):w

## The partition table has been altered.
## Calling ioctl() to re-read partition table.
## Re-reading the partition table failed.: Invalid argument

#3-7. reboot
sudo reboot

#4. format the partition as ext4
sudo mkfs.ext4 /dev/sda1

#4-1. confirmation message will be shown, enter y

## mke2fs 1.42.12 (29-Aug-2014)
## /dev/sda1 contains a vfat file system
## Proceed anyway? (y,n)

#5. create mount directory
sudo mkdir /media/usb0

#6. mount USB memory
sudo mount /dev/sda1 /media/usb0

#7. setting for auto mount, check UUID
sudo blkid /dev/sda1

## ex)
##/dev/sda1: UUID="dc69fc31-4a50-44e2-a3f7-f5648fea6f8d" TYPE="ext4" PARTUUID="386954cf-01

#8. change to /etc
cd /etc

#9. make copy of fstab
sudo cp fstab fstab.org

#10. add setting for USB memory
sudo nano fstab

## ex). add with UUID you checked step #7
##UUID="dc69fc31-4a50-44e2-a3f7-f5648fea6f8d" /media/usb0     ext4    nofail  0       2

#11. Save modified fstab

#12. reboot
sudo reboot

#13. check mounted USB memory
df

## ex). you can find like below
## /dev/sda1       30280032      16  30280016   1% /media/usb0

#14. create image directory on /media/usb0
cd /media/usb0
sudo mkdir images
sudo chown apsync. images

#15. create tlog directory on /media/usb0
cd /media/usb0
sudo mkdir tlog
sudo chown apsync. tlog

