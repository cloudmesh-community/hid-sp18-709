test

test again a a
****
o: This is just a draft, and contains segents that I have not written, and it is my intention to quote them, referencing appropiately.
o: This file is also missing the bibliography (bibtex) and references
****
# PXE and RPI
Using PXE to deploy Image to RPI3
According to the official documentationfor [Raspberry Pi](https://github.com/raspberrypi/documentation), [PXE Servers](http://www.pix.net/software/pxeboot/), and even though partially unrelated, the use of PXE servers to install [Sun Fire X2270](https://docs.oracle.com/cd/E19902-01/html/821-1367/pxeconfig.html), the most suited process  would follow four main stages:

1. [Installation and configuration of the PXE server](#pxe-server)
2. [Preparation of the model endpoint](#model-endpoint)
3. [Capturing and storing the image -also known as Imaging-](#capture)
4. [Deploying the image](#deployment)

## PXE server
Installation and configuration of the PXE server.
Created a server in Linux Ubuntu Version....
Following these steps: https://docs.oracle.com/cd/E19902-01/html/821-1367/pxeconfig.html
- DHCP: to assign and distribute the imges accordingly.
- DNS Settings:
- TFTP: to transfer the required files.
- PXE Server install the imges to the corresponding computers.
- NFS (Optional): to store the images.
- Portmap  (Optional- only required if using NFS)

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
## Deployment
Deploying the image

**Method useed:**

As per the professor suggestion I used the **Standard DD command:**

backup:
```bash
dd if=/dev/sdb of=sd.img bs=4M
```
Maybe://
restore:
```bash
dd if=sd.img of=/dev/sdb bs=4M
```
//

[Reply7](https://lifehacker.com/how-to-clone-your-raspberry-pi-sd-card-for-super-easy-r-1261113524)
*replies*

-   Great way to do it, but a couple notes.

    1) Make sure you know which device the SD card is, or you can mess up our
    hard drive. Do this by typing "df" and it should show you the SD card and
    how big it is. Also can be done in Disk Utility

    2) After doing the above, unmount the SD card prior to running "dd". This
    can be done at the command line or in Disk Utility.


On Linux, something like:

dd if=/dev/sdb of=./RaspberryPiCard.img

should do something similar.

Important note, 8GB cards of different brands are often slightly different
sizes! An 8GB Sandisk is NOT the same as an 8GB Transcend, at least not as far
as Win32DiskImager is concerned. Alway red lash to the same card / brand to
avoid problems. I found this the hard way!

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
**************************
# Other consulted sites and materials:




Other
[beebom](https://raspberrypi.stackexchange.com/questions/69914/how-to-clone-raspberry-pi-sd-card-on-windows-linux-and-macos)

BootmodesRPI
[beebom](https://github.com/raspberrypi/documentation/tree/master/hardware/raspberrypi/bootmodes)

NetbootRPI

<https://github.com/raspberrypi/documentation/blob/master/hardware/raspberrypi/bootmodes/net_tutorial.md>

Tried:<https://thepihut.com/blogs/raspberry-pi-tutorials/17789160-backing-up-and-restoring-your-raspberry-pis-sd-card>


Other attempts like [mkisofs](http://linuxpitstop.com/edit-iso-files-using-mkisofs-in-linux/) failed:
as well as [This one](http://it-joe.com/linux/pxe_server)

PXE:<https://www.hiroom2.com/2017/07/02/ubuntu-1604-pxeboot-thin-client-nfs-en/>

Latest, working so far:

<https://www.unixmen.com/how-to-install-dhcp-server-in-centos-and-ubuntu/>

<https://www.unixmen.com/install-and-configure-pxe-server-on-ubuntu-15-04/>

<https://infokoko.blogspot.com/2015/03/how-to-setup-diskless-ubuntu-server.html>

NFS: <https://vitux.com/install-nfs-server-and-client-on-ubuntu/>

<https://www.youtube.com/watch?v=QsrAgjtd56U>

For review:
<https://www.linuxtopic.com/2018/06/PXE-Boot-server-configuration-ubuntu.html>

PXE:
<https://infokoko.blogspot.com/2015/03/how-to-setup-diskless-ubuntu-server.html>

<https://help.ubuntu.com/community/DisklessUbuntuHowto>

<https://www.unixmen.com/install-and-configure-pxe-server-on-ubuntu-15-04/>

<https://www.thegeekstuff.com/2010/07/tftpboot-server/>

<https://www.theurbanpenguin.com/pxelinux-using-proxy-dhcp/>

<https://docs.oracle.com/cd/E20815_01/html/E20821/gjqeh.html>

Bridging the network

<https://communities.vmware.com/thread/25454>

Preseed SysPrep: <https://en.wikipedia.org/wiki/Preseed>

Fog Project: <https://fogproject.org/download>

Other Project:<https://www.plop.at/en/bootmanager/full.html>

Clean PXE:

<https://docs.oracle.com/cd/E19902-01/html/821-1367/gjyeo.html>

How to Create a PXE Installation Image for Oracle Enterprise Linux
------------------------------------------------------------------

When you create a Oracle Linux Preboot Execution Environment (PXE) installation
image on the same server that is your DHCP server, it will also act as your PXE
server. The PXE server provides the operating system files to your PXE client.

Before you install a Oracle Enterprise Linux image on your PXE server, you must
configure your Linux network to support PXE images. See [Overview of PXE
Servers](https://docs.oracle.com/cd/E19902-01/html/821-1367/gisly.html#scrolltoc).

**Before You Begin**

The PXE installation procedure requires the following items:

-   A CD/DVD drive on the DHCP server.$ sudo mkdir /tftpboot/1604/
-   Disable the firewall on your PXE server.

-   Install a Linux image on your PXE server.

-   Connect the PXE client to the same network as your PXE server.

1.  **Power on the PXE client.**

>   The PXE client is the target where you are installing Linux from a PXE image
>   on a PXE server.

1.  **When the PXE client prompts you for a network boot, press the F12 key.**

>   The PXE client attempts to obtain an IP address from the DHCP server.

>   A list of PXE servers appears.

1.  **Select a PXE server from the list.**

>   The corresponding Linux installation image downloads onto the PXE client.

1.  **To configure the Linux operating system for your server, refer to the
    manual that is shipped with your Linux media kit.**

2.  **Update the operating system.**

    -   **For Red Hat Linux, see** [Overview of Red Hat Enterprise Linux
        Installation](https://docs.oracle.com/cd/E19902-01/html/821-1367/gjtvz.html#scrolltoc)**.**

    -   **For SUSE Linux, perform an Online Software Update to update the
        operating system files. See** [How to Update the SLES Operating
        System](https://docs.oracle.com/cd/E19902-01/html/821-1367/gjtnc.html#scrolltoc)**.**

    -   **For Oracle Enterprise Linux, see** [Updating
        OEL](https://docs.oracle.com/cd/E19902-01/html/821-1367/gjfrg.html#scrolltoc)**.**

https://docs.oracle.com/cd/E19902-01/html/821-1367/pxeconfig.html\#scrolltoc


# TO DO:
According to [arstechnica.com](https://arstechnica.com/civis/viewtopic.php?t=1110936), in Ubuntu, there is a chance for errors. So will have to look for a persistent-net.rules file in Raspbian, although [Here](https://www.raspberrypi.org/forums/viewtopic.php?p=504917), it says it is not created on Raspbian.

http://www.pix.net/software/pxeboot/archive/pxespec.pdf

## UML diagrams:
*This is not mine, is from slackshare? Planning on using mermaid to render my diagrams.

You can render UML diagrams using [Mermaid](https://mermaidjs.github.io/). For example, this will produce a sequence diagram:
