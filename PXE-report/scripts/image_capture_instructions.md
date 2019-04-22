# Instructions for Capturing the image

For academic purposes, I have used the latest light image provided from rasppberrypi.org: 2017-11-29-raspbian-stretch-lite.
This can be used as is or modified either with PiBakery or using the following manual instructions:

This part I have not scripted, But here are the instructions I followed

The Raspberry Pi SD Card was opened in the linux computer, in this case, a Ubuntu Machine, and obtained the list of the filesystems identified by linux, using the following command:in a terminal:

```bash
sudo fdisk -l
```



Once the device was identified, the SD Card -a 32GB usb device- was found with the name _/dev/sdb_ . I used the following command to save the image as an .img file:

```bash
sudo dd if=/dev/sdb of=\~/raspbian.img
```

The resulting IMG file can be opened and converted  to an ISO using mkisofs.
The other possible option is to unzip the raspbian image and modifying it after mounting it:

create the directory where its going to be mounted.
```bash
sudo mkdir /mnt/tmp
```

```bash
sudo fdisk -l 2017-11-29-raspbian-stretch-lite.img
```

And extract the 2017-11-29-raspbian-stretch-lite.zip file there. 
It should result in an .img file


 #look into the file system to calculate the offset needed:

```bash
Disk 2017-11-29-raspbian-stretch-lite.img: 1.7 GiB, 1858076672 bytes, 3629056 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x37665771

Device                                Boot Start     End Sectors  Size Id Type
2017-11-29-raspbian-stretch-lite.img1       8192   93236   85045 41.5M  c W95 FA
2017-11-29-raspbian-stretch-lite.img2      94208 3629055 3534848  1.7G 83 Linux
```

With this information, the 

Then, use the information -Boot start- and multiply it by 512 to obtain the offset required: 512×94208=48234496

Now we can use that resulting number to mount the image:

```bash
sudo mount -o loop,offset=48234496 2017-11-29-raspbian-stretch-lite.img /mnt/tmp
```

After mounting it, once can modify the mounted image at will, by working on the mounted image:

```bash
cd /mnt/tmp
```

Once we are done modifying the OS structure, the image can be turned into an img file using the first command or into an ISO using the following command:


```bash
sudo mkisofs -o bootiso.iso /mnt/tmp
```


#Some of the steps I took are also described in [raspberrypi.stackexchange.com](https://raspberrypi.stackexchange.com/questions/69914/how-to-clone-raspberry-pi-sd-card-on-windows-linux-and-macos) and more in detail in [raspberrypistarterkits.com](https://www.raspberrypistarterkits.com/how-to/clone-raspberry-pi-sd-card-on-windows-linux-macos/), this last link includes information on how to save the image using other Operating Systems to capture it.
#Other methods that I tried included the back up of the image using Clonezilla as described in [geekanddummy.com](https://geekanddummy.com/how-to-raspberry-pi-tutorial-part-2-sd-card-backuprestore/), generating an image for testing.

#Didn't use but sounds interesting for future consideration: https://github.com/RPi-Distro/pi-gen


