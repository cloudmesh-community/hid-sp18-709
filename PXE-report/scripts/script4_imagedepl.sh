#!/bin/bash
#reading input
echo -e "Hi, please type the word: \c "
read  word
echo "The word you entered is: $word"
echo -e "Can you please enter two words? "
read word1 word2
echo "Here is your input: \"$word1\" \"$word2\""
echo -e "How do you feel about bash scripting? "
# read command now stores a reply into the default build-in variable $REPLY
read
echo "You said $REPLY, I'm glad to hear that! "
echo -e "What are your favorite colours ? "
# -a makes read command to read into an array
read -a colours
echo "My favorite colours are also ${colours[0]}, ${colours[1]} and ${colours[2]}:-)"


#Unsuccessfully tried other tools like: **ccd2iso**, following documentation from different sources, among them the one in the following [link](http://manpages.ubuntu.com/manpages/trusty/man1/ccd2iso.1.html)

#the .img is a generic term. it is a binary file and if you don't know the
#filesystem they can be troublesome to mount. try this command when you are
#trying to mount an unknown filesystem:

sudo mkdir /tmp/mount/
sudo mount -t debugfs /path/to/file.img /tmp/mount/

#after that, we just release the netboot ready version: [pxe netboot](https://wiki.ubuntu.com/UEFI/PXE-netboot-install)

#Later attempted [IAT](http://www.pctechtips.org/how-to-convert-img-images-to-iso-in-linux/)

[Back to the begining](#pxe-and-rpi)
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
