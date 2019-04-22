#!/bin/bash

## Model endpoint
#**Check** //https://docs.oracle.com/cd/E19902-01/html/821-1367/gjyeo.html#scrolltoc

sudo apt-get update# Updates package list

sudo apt-get upgrade --assume-yes# Updates package list

echo program_usb_boot_mode=1 | sudo tee -a /boot/config.txt

