#!/bin/bash

## Model endpoint
#**Check** //https://docs.oracle.com/cd/E19902-01/html/821-1367/gjyeo.html#scrolltoc

#To create an image that looks like the desired state reparation of the model endpoint
#Before capturing the image it is important to set it up so that once it is deployed, it contains all the necessary packages, and at the same time is not bloated with unnecessary packages.
#In my case, I have only made the following changes. Although CMS could be included in the image, and other can be deleted

sudo apt-get update# Updates package list

sudo apt-get upgrade --assume-yes# Updates package list

echo program_usb_boot_mode=1 | sudo tee -a /boot/config.txt
