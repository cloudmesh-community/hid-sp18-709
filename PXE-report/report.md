****

:o: Disclaimer: This is just a draft, and contains segents that I have not written, and it is my intention to quote them, referencing appropiately.

:o: This file is also missing the bibliography (bibtex) and references

****
# PXE and RPI
Using PXE to deploy Image to RPI3
According to the official documentationfor [Raspberry Pi](https://github.com/raspberrypi/documentation), [PXE Servers](http://www.pix.net/software/pxeboot/), and even though partially unrelated, the use of PXE servers to install [Sun Fire X2270](https://docs.oracle.com/cd/E19902-01/html/821-1367/pxeconfig.html), the most suited process  would follow four main stages:

:o: the PXE server must be set up as one of the PIs the above is not clear what you do, alterbnative you can use a Linux server. This must be general and not related to HW, other than if you use a PI as PXE server

1. Installation and configuration of the PXE server (see @sec:pxe-server}
2. [Preparation of the model endpoint](#model-endpoint)
3. [Capturing and storing the image -also known as Imaging-](#capture)
4. [Deploying the image](#deployment)

:o: you need to use section links as explained in notation.md, see the first link

:o: diagram of your setup is missing, it is difficult to understand what you do

:o: you could for example improve the NOW instructions and burn the os and have ips


than it would be grate to have the following

    cms pxe --server=ipofserver --worker=10.0.0.[1-10] --names=worker[00-10]

that does this all automatically ... ?



## PXE server {#sec:pxe-server}

Installation and configuration of the PXE server.
Created a server in Linux Ubuntu Version....
Following these steps: https://docs.oracle.com/cd/E19902-01/html/821-1367/pxeconfig.html

:o: stand alone links must be in <>

- DHCP: to assign and distribute the imges accordingly.
- DNS Settings:
- TFTP: to transfer the required files.
- PXE Server install the imges to the corresponding computers.
- NFS (Optional): to store the images.
- Portmap  (Optional- only required if using NFS)


:o: why not develop a simple script and run that installs it. put this in git, git clone it and do sh  on it. Its noice that you explain it but, teh explanation seems to refer to too many external documents?

**DHCP Setup:**
a. Installed a basic instance of [DHCP](https://help.ubuntu.com/lts/serverguide/dhcp.html.en):

```bash
user@ubuntu:~$ sudo apt install isc-dhcp-server
```
b. Then, configured it, by modifying the configuration fileand Assigned a Static IP Address: [DHCP address](https://www.cyberciti.biz/faq/howto-get-linux-static-dhcp-address/) and set a [hostname](https://serverfault.com/questions/80909/how-to-change-the-hostname-at-the-end-of-pxe-unattended-installation-on-debian)


```bash
user@ubuntu:~$ sudo vi /etc/dhcp/dhcpd.conf
```
By adding the corresponding information:

```bash
default-lease-time 600;
max-lease-time 7200;

subnet 10.10.0.0 netmask 255.255.255.0 {
 range 10.10.0.150 10.10.0.200; #this one will have to be different in the IU environment due to the ammount of RPis or endpoints connected to this DHCP
 option routers 10.10.0.254;
 option domain-name-servers 10.10.0.1, 10.10.0.2;
 option domain-name "PXEtest.test"
}
```
Assigned a Static IP Address: [DHCP address](https://www.cyberciti.biz/faq/howto-get-linux-static-dhcp-address/) and set a [hostname]()

and then, restarted the service:

```bash
user@ubuntu:~$ sudo systemctl restart isc-dhcp-server.service
```

**DNS Settings:**

In order to ensure that the DNS is pointed in the right direction, I changed it using vi editor to modify the interfaces configuration file:

```bash
user@ubuntu:~$ sudo vi /etc/network/interfaces
```
```bash
auto eth0
iface eth0 inet static
        address 10.10.0.021
        netmask 255.255.255.0
        gateway 10.10.0.1
```

Saved, closed and then, restart the service one more time:
```bash
user@ubuntu:~$ sudo systemctl restart isc-dhcp-server.service
```
**TFTP Installation**

Installed the TFTP  Server, there are more instrctions on [this link](https://medium.com/@Sciri/configuring-a-tftp-server-on-ubuntu-for-switch-upgrades-and-maintenance-caf5b6833148)
And

```bash
user@ubuntu:~$ sudo apt-get install apache2 tftpd-hpa inetutils-inetd
```
Then, proceeded to configure it by edditing /etc/default/tftpd-hpa
and adding the following lines:

RUN_DAEMON="yes"
OPTIONS="-l -s /var/lib/tftpboot"

```bash
user@ubuntu:~$ sudo apt install tftp-hpa
```

**PXE Server Installation**

Among the requirements that PXE Server has to work properly, it needs to have the firewall disabled on the server where the PXE solution will be running.

I checked it on my machine:

```bash
user@ubuntu:~$ sudo ufw status
```
And got the following response: _Status: inactive_, but if it was enabled, it can easily be disabled by running the following command:

```bash
user@ubuntu:~$ sudo ufw disable
```

I attempted different techniques to install the PXE server, including the use of complete solutions like  [FOG](https://fogproject.org), [Dnsmasq](https://www.tecmint.com/install-ubuntu-via-pxe-server-using-local-dvd-sources/), and the traditional [PXE server](https://docs.oracle.com/cd/E19902-01/html/821-1367/gista.html#scrolltoc)

The option that I stayed with was the traditional way to install the PXE server:

```bash
user@ubuntu:~$ sudo apt-get update
```
Review version: $ wget http://archive.ubuntu.com/ubuntu/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/netboot.tar.gz \ -C O 16-04-netboot.tar.gz

NetBoot: $ mkdir ~/16-04-netboot
$ tar zxf 16-04-netboot.tar.gz -C ~/16-04-netboot

## Model endpoint

**Check** //https://docs.oracle.com/cd/E19902-01/html/821-1367/gjyeo.html#scrolltoc

To create an image that looks like the desired state reparation of the model endpoint
Before capturing the image it is important to set it up so that once it is deployed, it contains all the necessary packages, and at the same time is not bloated with unnecessary packages.
In my case, I have only made the following changes. Although CMS could be included in the image, and other can be deleted

```bash
user@ubuntu:~$ sudo apt-get update
```
```bash
user@ubuntu:~$ sudo apt-get upgrade
```
Ensure tthat the USB Boot Mode is enabled. This is the case by default on RPI3 (hacer referencia)

```bash
user@ubuntu:~$ echo program_usb_boot_mode=1 | sudo tee -a /boot/config.txt
```

[Back to the begining](#pxe-and-rpi)
Created a bootale ige

## Capture

Once the image is in the desired state, its time for capturing and storing the image -also known as Imaging-

Then proceeded to create an image:

Following the instructions presented on [Beebom](https://beebom.com/how-clone-raspberry-pi-sd-card-windows-linux-macos/):

1. The Raspberry Pi SD Card was opened in the linux computer, in this case, a
Ubuntu Machine, and obtained the list of the filesystems identified by linux,
using the following command:in a terminal:

```bash
user@ubuntu:~$ sudo fdisk -l
```

2. Once the device was identified, the SD Card -a 32GB usb device- was found with the name _/dev/sdb_ ., I used the following command to save the image as an .img file.

```bash
user@ubuntu:~$ sudo dd if=/dev/sdb of=\~/raspbian.img
```

The steps I took are also described in [raspberrypi.stackexchange.com](https://raspberrypi.stackexchange.com/questions/69914/how-to-clone-raspberry-pi-sd-card-on-windows-linux-and-macos) and more in detail in [raspberrypistarterkits.com](https://www.raspberrypistarterkits.com/how-to/clone-raspberry-pi-sd-card-on-windows-linux-macos/), this last link includes information on how to save the image using other Operating Systems to capture it.
Other methods that I tried included the back up of the image using Clonezilla as described in [geekanddummy.com](https://geekanddummy.com/how-to-raspberry-pi-tutorial-part-2-sd-card-backuprestore/), generating an image for testing.

The resulting image was quite large, so I proceeeded to shorten the size of the
image: following the instructions given in a [Github Repository](https://github.com/qrti/shrink)

Then converted it to an ISO:
I found different options online.  Tried using **ddrescue**:
As explained in this [link](https://ubuntuforums.org/showthread.php?p=10454262)

Unsuccessfully tried other tools like: **ccd2iso**, following documentation from different sources, among them the one in the following [link](http://manpages.ubuntu.com/manpages/trusty/man1/ccd2iso.1.html)

the .img is a generic term. it is a binary file and if you don't know the
filesystem they can be troublesome to mount. try this command when you are
trying to mount an unknown filesystem:  

```bash
user@ubuntu:~$ sudo mkdir /tmp/mount/
user@ubuntu:~$ sudo mount -t debugfs /path/to/file.img /tmp/mount/
```
after that, we just release the netboot ready version: [pxe netboot](https://wiki.ubuntu.com/UEFI/PXE-netboot-install)




Later attempted [IAT](http://www.pctechtips.org/how-to-convert-img-images-to-iso-in-linux/)

[Back to the begining](#pxe-and-rpi) 

:o: we do not need the bck links

## Deployment

Deploying the image


[beebom](https://raspberrypi.stackexchange.com/questions/311/how-do-i-backup-my-raspberry-pi)

Write the image:

[beebom](https://lifehacker.com/how-to-clone-your-raspberry-pi-sd-card-for-super-easy-r-1261113524)

DRBL: -el instalador es provisional-

[beebom](https://www.linux.com/news/drbl-quick-and-easy-thin-client-server)

[beebom](https://clonezilla.org)

PXE Wheezy:

[beebom](https://www.raspberrypi.org/forums/viewtopic.php?p=852780)

[beebom](ttps://github.com/aweijnitz/pi_backup)

Bootable media:

### UNetbootin

[beebom](https://ubuntu-mate.community/t/how-to-use-unetbootin/672)

[beebom](https://fossbytes.com/create-bootable-usb-media-from-iso-ubuntu/)

[Back to the begining](#pxe-and-rpi)


# TO DO:
According to [arstechnica.com](https://arstechnica.com/civis/viewtopic.php?t=1110936), in Ubuntu, there is a chance for errors. So will have to look for a persistent-net.rules file in Raspbian, although [Here](https://www.raspberrypi.org/forums/viewtopic.php?p=504917), it says it is not created on Raspbian.

http://www.pix.net/software/pxeboot/archive/pxespec.pdf

## UML diagrams:
*This is not mine, is from slackshare? Planning on using mermaid to render my diagrams.

You can render UML diagrams using [Mermaid](https://mermaidjs.github.io/). For example, this will produce a sequence diagram:
