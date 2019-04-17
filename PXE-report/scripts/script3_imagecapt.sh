#!/bin/bash

## Capture

#1. The Raspberry Pi SD Card was opened in the linux computer, in this case, a Ubuntu Machine, and obtained the list of the filesystems identified by linux, using the following command:in a terminal:
#sudo fdisk -l #
#2. Once the device was identified, the SD Card -a 32GB usb device- was found with the name _/dev/sdb_ ., I used the following command to save the image as an .img file.

sudo dd if=/dev/sdb of=\~/raspbian.img #Based on default settings.

#The steps I took are also described in [raspberrypi.stackexchange.com](https://raspberrypi.stackexchange.com/questions/69914/how-to-clone-raspberry-pi-sd-card-on-windows-linux-and-macos) and more in detail in [raspberrypistarterkits.com](https://www.raspberrypistarterkits.com/how-to/clone-raspberry-pi-sd-card-on-windows-linux-macos/), this last link includes information on how to save the image using other Operating Systems to capture it.
#Other methods that I tried included the back up of the image using Clonezilla as described in [geekanddummy.com](https://geekanddummy.com/how-to-raspberry-pi-tutorial-part-2-sd-card-backuprestore/), generating an image for testing.
#The following 2 might or might not happen:
#The resulting image was quite large, so I proceeeded to shorten the size of the image: following the instructions given in a [Github Repository](https://github.com/qrti/shrink)
#Then converted it to an ISO:
#I found different options online.  Tried using **ddrescue**:
#As explained in this [link](https://ubuntuforums.org/showthread.php?p=10454262)
