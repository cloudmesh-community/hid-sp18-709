#!/bin/bash

#**DHCP Setup:**
#a. Installed a basic instance of [DHCP](https://help.ubuntu.com/lts/serverguide/dhcp.html.en):
sudo apt-get update  # Updates package list
sudo apt-get install isc-dhcp-server --assume-yes #install unattended.

#user@ubuntu:~$ sudo apt install isc-dhcp-server
#user@ubuntu:~$ sudo vi /etc/dhcp/dhcpd.conf
sudo bash -c "echo >> /etc/dhcp/dhcpd.conf"
sudo bash -c "echo default-lease-time 600; >> /etc/dhcp/dhcpd.conf"
sudo bash -c "echo max-lease-time 7200; >> /etc/dhcp/dhcpd.conf"
sudo bash -c "echo >> /etc/dhcp/dhcpd.conf"

sudo bash -c "echo subnet 10.10.0.0 netmask 255.255.255.0 { >> /etc/dhcp/dhcpd.conf"
sudo bash -c "echo  range 10.10.0.150 10.10.0.200; >> /etc/dhcp/dhcpd.conf" #this one will have to be different in the IU environment due to the ammount of RPis or endpoints connected to this DHCP
sudo bash -c "echo  option routers 10.10.0.254; >> /etc/dhcp/dhcpd.conf"
sudo bash -c "echo  option domain-name-servers 10.10.0.1, 10.10.0.2; >> /etc/dhcp/dhcpd.conf"
sudo bash -c "echo  option domain-name "PXEtest.test" >> /etc/dhcp/dhcpd.conf"
sudo bash -c "echo } >> /etc/dhcp/dhcpd.conf"

sudo systemctl restart isc-dhcp-server.service --assume-yes #restarts the dhcp unattended

#**DNS Settings:**

#In order to ensure that the DNS is pointed in the right direction, I changed it using vi editor to modify the interfaces configuration file:

#auto eth0
#iface eth0 inet static
#        address 10.10.0.021
#        netmask 255.255.255.0
#        gateway 10.10.0.1

sudo bash -c "echo >> /etc/network/interfaces"
sudo bash -c "echo auto eth0 >> /etc/network/interfaces"
sudo bash -c "echo iface eth0 inet static>> /etc/network/interfaces"
sudo bash -c "echo         address 10.10.0.021 >> /etc/network/interfaces"
sudo bash -c "echo         netmask 255.255.255.0 >> /etc/network/interfaces"
sudo bash -c "echo         gateway 10.10.0.1 >> /etc/network/interfaces"

sudo systemctl restart isc-dhcp-server.service --assume-yes #to restart te DHCP service
sudo apt-get install apache2 tftpd-hpa inetutils-inetd --assume-yes #install unattended.

#apt-get install apache2 tftpd-hpa inetutils-inetd
#Then, proceeded to configure it by edditing /etc/default/tftpd-hpa and adding the following lines:

sudo bash -c "echo RUN_DAEMON="yes" >> /etc/default/tftpd-hpa"
sudo bash -c "echo OPTIONS="-l -s /var/lib/tftpboot" >> /etc/default/tftpd-hpa"

sudo apt install tftp-hpa --assume-yes #install unattended.
#sudo apt install tftp-hpa

#sudo ufw disable #it is not installed by default in RPi, but in case this script is run on a different OS that might have the firewall enabled.
######
#Reviewed version: $ wget http://archive.ubuntu.com/ubuntu/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/netboot.tar.gz \ -C O 16-04-netboot.tar.gz

#NetBoot: $ mkdir ~/16-04-netboot
#$ tar zxf 16-04-netboot.tar.gz -C ~/16-04-netboot
