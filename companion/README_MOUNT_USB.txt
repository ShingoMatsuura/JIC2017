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
Partition number (1 -4, default):1

#3-4. write partition, enter w
Command (m for help):w

#4. format the partition as ext4
sudo mkfs.ext4 /dev/sda1

#5. create mount directory
sudo mkdir /media/usb0

#6. mount USB memory
sudo mount /dev/sda1 /media/usb0

#7. setting for auto mount, check UUID
sudo fdisk /dev/sda1

## ex)
##/dev/sda1: UUID="dc69fc31-4a50-44e2-a3f7-f5648fea6f8d" TYPE="ext4" PARTUUID="386954cf-01

#8. change to /etc
cd /etc

#9. make copy of fstab
sudo cp fstab fstab.org

#10. add setting for USB memory
sudo nano fstab

## ex). add with UUID you checked step #7
##UUID="dc69fc31-4a50-44e2-a3f7-f5648fea6f8d" /media/usb0     ext4    defaults  0       2

#11. Save modified fstab

#12. reboot
sudo reboot

#13. check mounted USB memory
fd

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

