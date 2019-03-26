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

