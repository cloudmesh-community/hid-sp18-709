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
sudo bash -c "echo auto eth0 >> /etc/network/interfaces"
sudo bash -c "echo iface eth0 inet static>> /etc/network/interfaces"
sudo bash -c "echo         address 10.10.0.021 >> /etc/network/interfaces"
sudo bash -c "echo         netmask 255.255.255.0 >> /etc/network/interfaces"
sudo bash -c "echo         gateway 10.10.0.1 >> /etc/network/interfaces"

sudo systemctl restart isc-dhcp-server.service --assume-yes #to restart te DHCP service
sudo apt-get install apache2 tftpd-hpa inetutils-inetd --assume-yes #install unattended.

#apt-get install apache2 tftpd-hpa inetutils-inetd

sudo bash -c "echo RUN_DAEMON="yes" >> /etc/default/tftpd-hpa"
sudo bash -c "echo OPTIONS="-l -s /var/lib/tftpboot" >> /etc/default/tftpd-hpa"

sudo apt install tftp-hpa --assume-yes #install unattended.

#Create the TFTP

sudo mkdir /tftpboot
sudo chmod 777 /tftpboot
sudo systemctl enable dnsmasq.service
sudo systemctl restart dnsmasq.service
sudo cp -r /boot/* /tftpboot
sudo systemctl restart dnsmasq

#NFS: Make a root available for the clients.
sudo apt-get install nfs-kernel-server
echo "/nfs/client1 *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports

sudo systemctl enable rpcbind
sudo systemctl restart rpcbind
sudo systemctl enable nfs-kernel-server
sudo systemctl restart nfs-kernel-server

sudo echo "'root=/dev/nfs nfsroot=10.10.0.211:/nfs/client1,vers=3 rw ip=dhcp rootwait elevator=deadline'" >  | sudo tee -a /tftpboot/cmdline.txt #https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt

#insall and configure the PXE server itself.

''' NOTES:
/var/lib/tftpboot/pxelinux.cfg/default

DISPLAY boot.txt

DEFAULT etch_i386_install

LABEL etch_i386_install
       kernel debian/etch/i386/linux
       append vga=normal initrd=debian/etch/i386/initrd.gz  --
LABEL etch_i386_linux
       kernel debian/etch/i386/linux
       append vga=normal initrd=debian/etch/i386/initrd.gz  --

LABEL etch_i386_expert
       kernel debian/etch/i386/linux
       append priority=low vga=normal initrd=debian/etch/i386/initrd.gz  --

LABEL etch_i386_rescue
       kernel debian/etch/i386/linux
       append vga=normal initrd=debian/etch/i386/initrd.gz  rescue/enable=true --

PROMPT 1



On boot.txt change: #https://elinux.org/R-Pi_PXE_Server
- Boot Menu -
=============

etch_i386_install
etch_i386_linux
etch_i386_expert
etch_i386_rescue


https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/chap-installation-server-setup
http://www.saminiir.com/boot-arch-linux-from-pxe/
http://lig-membres.imag.fr/duble/software/raspberry-pi-netboot/

Raspberry Pi 3b+ native netboot

Raspberry Pi 3b+ model comes with a network boot procedure enabled by default. It is also possible to enable this bootup procedure on Raspberry Pi 3B model, but it is not enabled by default, and I did not test this activation procedure myself (yet). I just tested the Raspberry Pi 3b+ model.

The major plus of using this procedure is that such a node does not need a SD card anymore. And the SD card is the most frequent point of failure on Raspberry Pi boards.

Note that even if the raspberry pi foundation mentions “PXE booting”, the network boot procedure is not really compatible with a standard PXE setup. Actually, the Raspberry Pi board just tries to retrieve using TFTP the same files it usually finds on the SD card: bootcode.bin, start.elf, config.txt, cmdline.txt, dtb and overlay files, kernel or kernel7.img, etc.
ISC DHCPd setup

The tutorial written by the raspberry pi foundation is based on dnsmasq on server side. In WalT we use ISC DHCPd. We could however adapt it easily, just by adding the following code on top of our dhcpd.conf file:

class "rpi-pxe" {
  match if ((binary-to-ascii(16,8,":",substring(hardware,1,3)) = "b8:27:eb") and
            (option vendor-class-identifier = "PXEClient:Arch:00000:UNDI:002001"));
  option vendor-class-identifier "PXEClient";
  option vendor-encapsulated-options "Raspberry Pi Boot";
}

Actually, if the DHCP server does not respond with this vendor option set to value Raspberry Pi Boot, the Raspberry Pi board will consider its network boot procedure is not implemented on server-side and it will abort its network boot.
