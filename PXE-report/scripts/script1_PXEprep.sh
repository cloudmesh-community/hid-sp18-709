#!/bin/bash
#TODO: sign in as root.
#TODO sudo raspi-config and expanded the root file system to take up the entire SD card.

#create a folder with the bootable linux files for the clients.

sudo mkdir -p /nfs/client1
sudo apt install rsync --assume-yes
sudo rsync -xa --progress --exclude /nfs / /nfs/client1

#Regenerate SSH host keys on the client filesystem by chrooting into it:

cd /nfs/client1
sudo mount --bind /dev dev
sudo mount --bind /sys sys
sudo mount --bind /proc proc
sudo chroot .
rm /etc/ssh/ssh_host_*
sudo dpkg-reconfigure openssh-server
sudo umount dev sys proc

#*Static address. review:these four ve next lines.

sudo echo "[Match]" >  | sudo tee -a /etc/systemd/network/10-eth0.netdev
sudo echo "Name=eth0" >>  | sudo tee -a /etc/systemd/network/10-eth0.netdev
sudo echo "[Match]" >>  | sudo tee -a /etc/systemd/network/10-eth0.netdev
sudo echo "DHCP=no" >>  | sudo tee -a /etc/systemd/network/10-eth0.netdev

#Network file

sudo echo "[Match]" >  | sudo tee -a /etc/systemd/network/11-eth0.network
sudo echo "Name=eth0" >>  | sudo tee -a /etc/systemd/network/11-eth0.network
sudo echo "[Network]" >>  | sudo tee -a /etc/systemd/network/11-eth0.network
sudo echo "Address=10.10.0.211/24" >>  | sudo tee -a /etc/systemd/network/11-eth0.network
sudo echo "DNS=10.10.0.1" >>  | sudo tee -a /etc/systemd/network/11-eth0.network
sudo echo "[Route]" >>  | sudo tee -a /etc/systemd/network/11-eth0.network
sudo echo "Gateway=10.10.0.1" >>  | sudo tee -a /etc/systemd/network/11-eth0.network

#sudo ufw disable #it is not installed by default in RPi, but Im leaving this note in case this script is run on a different OS that might have the firewall enabled.

#Adding  DNS:
sudo echo "DNS=10.10.0.1" >>  | sudo tee -a /etc/systemd/resolved.conf

#Enable the systemd-networkd daemon//more info on https://wiki.archlinux.org/index.php/systemd-networkd It will honor the configuration found on /etc/systemd/network

sudo systemctl enable systemd-networkd
sudo systemctl restart systemd-networkd #to restart the process without rebooting.

#To search for DHCP packets from client Raspberry Pi's  -https://www.raspberrypi.org/documentation/hardware/raspberrypi/bootmodes/net_tutorial.md

sudo apt install tcpdump dnsmasq --assume-yes
sudo systemctl enable dnsmasq
sudo tcpdump -i eth0 port bootpc

#setting up the dnsmasq configuration:

sudo echo  >  | sudo tee -a /etc/dnsmasq.conf
sudo echo "port=0" >>  | sudo tee -a /etc/dnsmasq.conf
sudo echo "dhcp-range=10.10.0.255,proxy" >>  | sudo tee -a /etc/dnsmasq.conf
sudo echo "log-dhcp" >>  | sudo tee -a /etc/dnsmasq.conf
sudo echo "enable-tftp" >>  | sudo tee -a /etc/dnsmasq.conf
sudo echo "tftp-root=/tftpboot" >>  | sudo tee -a /etc/dnsmasq.conf
sudo echo "pxe-service=0,'Raspberry Pi Boot'" >>  | sudo tee -a /etc/dnsmasq.conf




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
#In order to ensure that the DNS is pointed in the right direction, I changed the interfaces configuration file:

sudo bash -c "echo >> /etc/network/interfaces"
sudo bash -c "echo auto lo >> /etc/network/interfaces"
sudo bash -c "echo iface lo inet loopback >> /etc/network/interfaces"
sudo bash -c "echo >> /etc/network/interfaces"

sudo bash -c "echo auth eth0 >> /etc/network/interfaces"
sudo bash -c "echo allow-hotplug eth0 >> /etc/network/interfaces"
sudo bash -c "echo iface eth0 inet static>> /etc/network/interfaces"
sudo bash -c "echo         address 10.10.0.021 >> /etc/network/interfaces"
sudo bash -c "echo         netmask 255.255.255.0 >> /etc/network/interfaces"
sudo bash -c "echo         gateway 10.10.1.1 >> /etc/network/interfaces"

sudo systemctl restart isc-dhcp-server.service --assume-yes #to restart te DHCP service
sudo apt-get install apache2 tftpd-hpa inetutils-inetd --assume-yes #install unattended.

#apt-get install apache2 tftpd-hpa inetutils-inetd

sudo bash -c "echo RUN_DAEMON="yes" >> /etc/default/tftpd-hpa"
sudo bash -c "echo OPTIONS="-l -s /var/lib/tftpboot" >> /etc/default/tftpd-hpa"

sudo apt install tftp-hpa --assume-yes #install unattended.

#Create the TFTP and 

sudo mkdir /tftpboot
sudo chmod 777 /tftpboot
sudo systemctl enable dnsmasq.service
sudo systemctl restart dnsmasq.service
sudo cp -r /boot/* /tftpboot
sudo systemctl restart dnsmasq

#Bootloaders for pxelinux https://www.syslinux.org/old/pxe.php

sudo apt-get install -y syslinux-common

#NFS: Make a root available for the clients.
sudo apt-get install nfs-kernel-server
echo "/nfs/client1 *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports

sudo systemctl enable rpcbind
sudo systemctl restart rpcbind
sudo systemctl enable nfs-kernel-server
sudo systemctl restart nfs-kernel-server

sudo echo "'root=/dev/nfs nfsroot=10.10.0.211:/nfs/client1,vers=3 rw ip=dhcp rootwait elevator=deadline'" >  | sudo tee -a /tftpboot/cmdline.txt #https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt


#############################################################################################
#PXE among other: http://it-joe.com/linux/pxe_server#
#insall and configure the PXE server itself. the /tftpboot was already ade in line 116


cp -r /usr/lib/syslinux/* /tftpboot/ #to move the PXE boot files to the tftp that were installed inline 124

#Configure the PXE menu.
sudo echo "DEFAULT menu.c32" >  | sudo tee -a /tftpboot/pxelinux.cfg/default #https://wiki.syslinux.org/wiki/index.php?title=Menu
sudo echo "   PROMPT 0" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default
sudo echo "" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default
sudo echo "   MENU TITLE PXE Boot" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default
sudo echo "" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default
sudo echo "   LABEL Raspbian" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default
sudo echo "   MENU LABEL ^Raspbian 4.14" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default  #label for the OS, the ^ symbol is for the hotkey
sudo echo "   KERNEL nfs/ubuntu/client1/vmlinuz #the kernell mentioned on line 13" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default
sudo echo "   APPEND initrd=nfs/ubuntu/client1/initrd.lz boot=client1 netboot=nfs nfsroot=10.10.0.211:/tftpboot/nfs/raspbian" >>  | sudo tee -a /tftpboot/pxelinux.cfg/default  #here is where we inlcude the corresponding image we will be pointing to, as well as the bootable kernel and initrd file to point to the root partition.

###Additional Notes:
#Ensure that the  SDCard that will be sued on the new RPI is not bootable. Otherwise there will be conflicts due to the  bootable files existing in the card. 
# there are other ways to configure the menu, like pulling a boot.txt: https://elinux.org/R-Pi_PXE_Server but I decide to keep this scrit as straightforward as possible.




#Other resources

#https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/chap-installation-server-setup
#http://www.saminiir.com/boot-arch-linux-from-pxe/
#http://lig-membres.imag.fr/duble/software/raspberry-pi-netboot/

#there are other options for net booting/as opposed to network installattion, like Raspberry Pi 3b+'s native "netboot"

