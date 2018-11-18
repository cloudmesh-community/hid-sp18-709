# CMD5 Plugin to Create a Docker Swarm Cluster on 3 Raspberry PIs

Docker Swarm  :o: is ...

Docker swarm makes it possible to avoid
having a single point of failure and instead, have multiple nodes that
can be properly balanced and contain replicas of the information.
Currently, Dockers must be individually downloaded, installed and
configured on each physical computer that is integreated into a *swarm*. We present a plug-in
that allows the instalation of docker swarm conveniently with a cloudmesh plug-in. 

---

> -email for Andres Castro: acastrob@iu.edu
> -emailfor Uma Kugan: umakugan@iu.edu
> -emailfor Gregor von Laszweski: umakugan@iu.edu

---

Keywords:

Raspberry Pi, Cloudmesh, CMD5, Big Data, Big Data, i523, HID709, HID710

---


## Introduction

The four main internal components of docker are Docker Client and
Server, Docker Images, Docker Registries, and Docker Containers.

### Docker Client and Server

The docker server gets the request from the docker client and then
process it accordingly. Docker server and docker client can either run
on the same machine or a local docker client can be connected with a
remote server running on another machine [@turnbull2014docker].

![Docker Architecture] [@paraiso2016model]](https://github.com/cloudmesh-community/hid-sp18-709/blob/master/project-markdown/images/High-level-overview-of-Docker-architecture.png)


### Docker Images

Base image are the Operating system images such as Ubuntu 14.04 LTS, or
Fedora 20 which creates a container to run Operating system. The docker
file contains a list of instructions to build an image. When using
docker, we start with a base image, boot up, create changes and those
changes are saved in layers forming another
image [@rad2017introduction].

### Docker Registries

Docker images are placed in docker registries. It is same as source code
repositories where images can be pushed or pulled from a single source.


#### DevOps

The main goal of DevOps is to eliminate the gap between the developers
and IT operations team. Docker with DevOps get the developers and
operations team to work together so that they both understand the
challenges faced by each other, apply DevOps practices [@hackernoon].

#### CI/CD

Continuous Integration and Continuous Deployment are the most common use
cases of Docker. Continuous Integration testing and Continuous
Deployment allows developers to build codes, test them in any
environment. Docker integration with Jenkins and GitHub making it easier
for developers to build codes, test them in GitHub and trigger a build
in Jenkins and adding the image in Docker registries [@hackernoon].

#### Docker Containers As A Service

Docker help any organization to modernize their application
architecture. It can deploy scalable services securely on a wide variety
of platforms, improving flexibility and maximizing capacity. Best use
case for Docker installation is the US Government where they enhanced
their applications and made their components and services of their
system and easily transportable/shareable with other agencies within the
government [@hackernoon].

### Docker - Services

#### Docker Engine

Docker Engine is the foundation for the application platform which is
used for creating and running Docker containers. It is supported on
Linux, Windows, Cloud and Mac OS. It is lightweight, open source and
integrated with a work flow to build and containerize applications. User
interface is very simple and it makes the environment easily portable
from single container on single host to multiple applications on a many
number of hosts [@hackernoon].

#### Docker Enterprise

Docker Enterprise provides an integrated platform for both developers
and IT operations team where container management and deployment
services are together for end-to-end agile application portability. It
is easy to manage, monitor and secure images both within the registry
and those deployed across various clusters [@hackernoon].

#### Docker Hub

Docker Hub functions as a hosted registry service that helps you store,
manage, share and integrate images across various developer work flows.
Integration testing is done each time when the image is
shared [@hackernoon].

#### Docker Compose

Docker Compose is a tool that developers deploy to define and run all
multi-container Docker applications. Single host can be used to isolate
multiple environments, even if they are of the same name. Data volume is
copied automatically from old container whenever a new container is
created. Compose uses the previous configuration to create the new
container which reduces the time for replicating the same changes to the
environment [@hackernoon].

## Raspberry Pi as Platform

The Raspberry Pi is a credit-card-sized computer with ARM processor that
can run a Linux desktop operating system. Raspberry PI can plug into TV
and a keyboard. It is a little computer which can be used for many of
the things that desktop PC does, like spreadsheets, word processing,
browsing the internet, playing games and also to play high-definition
video. Raspberry is not intended to replace personal computer as its OS
support, memory etc are limited when compared to Laptop [@Rpi].

## Differences between Laptop and a Pi


Raspberry Pi uses an ARM based processor like ARM Cortex A7 or A53
depending upon the model while the traditional PC/Laptop uses a
conventional x86 /x64 Processor from either Intel or AMD. Embedded
systems had low cost and low power requirements and since ARM processor
used in the Raspberry Pi is used in embedded systems, A raspberry pi
consumes very much less power than a laptop. The processor is also much
slower than most Intel/AMD processors used in PCs, so complex programs
can not be executed. Pi does not have any wireless networking capability
like WiFi, Bluetooth etc when compared to laptop. Pi comes with 1 GB ram
for version 3 while most laptops have 2GB/4GB RAM that can be easily
expanded to 16GB. Laptops can have secondary storage for about 1 TB. It
also supports Flash based storage which tends to be more expensive per
bit than traditional Magnetic Hard drives. Therefore the Raspberry Pi
will have a smaller storage capacity than a traditional PC.A binary
built for either system will not execute on the other. Images or
binaries that was not created by you or from true source may pose a
potential threat. Docker swarm cluster can be built easily on Raspberry
Pi with just two basic commands: swarm init and swarm join [@dockrpi].

## Docker and Big Data Platform

:o; yet again duplicated

It is always been a challenge to maintain or even to have a control
deployment environment. It is very difficult to identify any issues
without proper deployment environment. Most of the times, issue can be
fixed as simple as disabling a service or just uninstalling a software
or slightly tweaking the environment. This can be easily achieved only
when we have complete control of the environment [@simplebig]. It is
very difficult to manage a distributed environment whether in cloud or
not. There are lot of manual effort whenever there is an installation
across multiple nodes. Docker allows anyone to quickly create, launch
and test Docker containers very easily. Container offer lightweight
isolation and virtualization, yielding reduced overhead, faster
deployments and restarts, and simplified migration. There are lot of
frameworks like, Google's Kubernetes, CoreOS, Multi-Container
orchestration, etcẇhich comes in handy with Dockers and Docker is very
lightweight when compared to a Virtual Machine. Even though Docker comes
very handy in addressing many of these issues, main selling point is
building consistent environments which are very easy to replicate.
Especially in big data environment, instead of installing every single
component from the Hadoop ecosystem, required for their development or
testing environment, we can just create it once and use it any number of
times and everywhere. Docker allows usage of different versions on the
same tool for different jobs without any conflict. Docker containers are
a great way of deploying services at scale and giving isolation to
services that run on the same host and improving utilization and we can
even use Dockers for scheduling batch analytical jobs.

## Docker Critique

Docker was not designed to support the long-running containers that are
needed to support production systems. While Docker gets a lot of
visibility from the development and DevOps communities, its operational
maturity still leaves a big void. There are no logs from containers and
hence logging is difficult in a distributed Docker environment. Dockers
need separate orchestration, provisioning and automation [@pitfall].
Managing a huge amount of containers is challenging, especially when it
comes to clustering containers. Running a container need root access and
due to security and governance policy, many companies may not grant root
privileges for everyone. In some companies, only software from
official/trusted sources can be installed on their machines. Since
Docker is not included in Red Hat Enterprise Linux 6, it needs to be
installed from docker.com, which is an untrusted source [@philip].

## Methods: Proposed Solution

The solution was created for a specific type of hardware and software,
but is modular enough to be extended to different environments with
similar features, such as basic architecture -which include but is not
limited to ARM single boarded computers- and an operating system based
on Debian, such as Debian, Raspbian, Ubuntu, etc.

## Hardware

For the current proposed solution, the different pieces of hardware were
chosen based on criteria such as Compatibility and Price.

The following is a list of the hardware that was used and below that
list there is a description of each piece of hardware that was used.

-   3 Raspberry Pi
-   3 Micro SD Cards with a capacity of 64 GB
-   3 USB to Micro USB Cables for power supply to the Raspberry Pi
-   1 External monitor for the configuration step only.

### Raspberry Pi

For this experiment, the 3 machines that were used were Raspberry Pi 3
Model B. Raspberry Pi are single boarded computers, that come in a small
presentation. They have been developed with education and extension in
mind, making them very popular in the academic and entrepreneur
communities. The specifications of the model that has been used for this
experiment are the following:

-   CPU: 1.2 GHZ quad-core ARM Cortex A53 ARMv8 Instruction Set.
-   GPU: Broadcom VideoCore IV @ 400 MHz
-   Memory: 1 GB LPDDR2-900 SDRAM
-   USB ports: 4
-   Network: 10/100 MBPS Ethernet, 802.11n Wireless LAN, Bluetooth 4.0

[@hackaday2016]

The Raspberry Pi are interacting with each other using a private
wireless network, and they have been assigned static Internet Protocol
Addresses. In this case 192.168.1.85, 192.168.1.86 and 192.168.1.87.

### Micro SD Cards

Because of its architecture, Raspberry devices require the use of Micro
SD Cards to contain the Operative system and other files. They emulate
the Hard drive resource used on other kinds of computers. The reason
that it is required to have at least 16 GB of memory, is because there
will be several pieces of software installed in the devices, each one of
them with different requirements:

Docker Memory Requirements [@dockerdoc2017]:

-   8GB of RAM for manager nodes or nodes running DTR.
-   4GB of RAM for worker nodes.
-   3GB of free disk space.

So at least 12 of the GB would be required for Docker and 4 GB used for
the proper functioning of Raspbian. [@rpicards2017]

Taking these requirements in consideration, there should be a minimum of
16GB of free space in the MicroSD in order to perform this experiment.

The Micro SD cards used were San Disc Memory Cards with a 64GB capacity.

### Micro USB Cables

3 USB to Micro USB Cables for power supply to the Raspberry Pi Since
these small computers don't use the regular power supply chords, they
are equipped with MicroUSB ports to power the device. All of these
devices are plugged to a main power outlet that allows to charge
multiple devices at the same time. There are other options to power the
devices include, such as attaching them to external batteries.

### External monitor

Since the Raspberry Pi are headless machines, they require to be
accessed directly for the initial set up and after that it is possible
to continue the configuration and installation process using any kind of
remote access, like SSH or RealVNC. For this initial connection, any
kind of screen that is HDMI compatible is useful. In this case the
initial setup of the Raspberry Pi was performed on a Toshiba 55 inch
HDTV with HDMI port. After that they were accessed from a Laptop
computer with Linux Ubuntu 17.10, using Remmina via ssh using XORG.

### Initial input devices

In order to set up the devices. The Raspberry Pi will require a set of
initial input devices attached to each computer. For this exercise, a
USB enabled standard keyboard and a USB enabled standard mouse were
used.

Software
--------

### Raspbian

Currently, the default way to deploy the operating system to the
Raspberry Pi is by using an Operating System installation Manager called
Noobs -which stands for "New Out Of Box Software"-. This manager can be
downloaded directly from the Raspberry Pi website and it includes
several Operating system options, among them:

-   Raspbian
-   Pidora
-   LibreELEC
-   OSMC
-   RISC OS
-   Arch Linux

Since Raspbian is the default Operating system and most commonly used,
this experiment decided to use it. This is also helpful because there is
material available in different websites with instructions on how to
install Docker in Debian based Machines. Raspbian is Debian based.
Another important reason is that Docker has as a requirement that the
Linux kernel version on which it will be installed is 3.10 or higher.
The Kernel version of the version of Raspbian that was used is 4.9.

The version of Raspbian that was used has the following specifications:

-   Kernel version: 4.9
-   Release date: 2017-11-16

### Docker

There are several versions of Docker available. Each version with their
own advantages and disadvantages. Because of the architecture used by
Raspberry Pi -ARM instead of AMD-, the Docker version used is *Docker
for Debian ARM*. With the following Specifications:

-   Version 17.09.0-ce
-   Release 2017-09-26

This version of Docker is Community Edition, which means that it is
available for free and can be installed on bare metal or cloud
infrastructure. This flexibility is good for the experiment, because it
will be installed on Raspberry Pi, which are considered physical devices
or bare metal Machines [@dockerdoc2017].

## Prerequisites

There are several reasons to have the pre requisites that the user will
find in this document. They will be explained in a separate section.
Before using the proposed solution, the user's environment needs to meet
the following requirements:

### Raspbian Installed

Raspbian must be installed and configured on all Micro SD Cards. For
this, the user may download Noobs from <https://www.raspberrypi.org/>
and copy it to a formated Micro SD Card. Once the Raspberry Pi has the
MicroSD loaded with noobs in place and has the input devices and display
attached to it, the user may follow the OS installation guide found on:
>http://raspbian.org/

It is advisable to be hooked up to the network where the user is
planning on implement this solution before running Noobs for the first
time. This will allow the user to download newer packages or Raspbian
and avoid interruptions in the process.

This requirement exists because there is a function that is being
explored to capture Raspberry Pi images to be deployed later on and
avoid the present pre requisite, but it is not ready yet.

### Update OS repositories

In order to ensure that the user is accessing the latest version
available of the software, it is important to update the Raspbian
repositories. In this case, the user can access the Terminal and enter
the following commands:

>`sudo apt-get update`

to update the list of available repositories and then

>`sudo apt-get upgrade`

to upgrade the available packages. The first time that the user runs one
of these commands, the root password will have to be entered. This
process might take a few minutes [@debianpackage].

### Remote access setup

Enable SSH on the Raspberry Pi. After Raspbian installation, enable SSH
on all your Raspberry Pi machines.

To do this, the user has to add a line in the file `sshd\_config` found
in the directory `/etc/ssh/` The line has to go at the end of in the
`Authentication section`. It has to contain the following string:
>`PermitRootLogin yes`. [@rootSsh]

### Changing hostnames

In order to keep the three Raspberry Pi organized it is highly advisable
to assign an exclusive and distinctive hostname to each Raspberry Pi.
The three Raspberry Pi have the following static IP addresses:

> 1.  pi85 - 192.168.1.85
> 2.  pi86 - 192.168.1.86
> 3.  pi87 - 192.168.1.87

By default, all Raspberry Pi devices will have the same Host Name.

To change this feature on each machine, the user will have to modify the
line that contains `127.0.1.1` and as hostname it includes the string
`raspberrypi` in `/etc/hosts` file, in most of the cases it is the last
line in the file. Then, the user may type the desired hostname instead
of the word raspberrypi and save the file and close it. This part can be
done by using the text editor that comes by default with Raspbian, an
editor called `nano`. It is not advisable for the users to modify the
rest of the entries, at least as part of this project.

Once the file is modified, the user will have to initialize the hostname
with the `hostname.sh` script this can be done using the following line
in the Terminal:

>`sudo /etc/init.d/hostname.sh`

To check if the modification has worked as expected, the user may check
the hostname of the machine from the Terminal by running the command:
`hostname -I`

## Steps Followed


### Testing shell commands prior to integrations with Cloudmesh

Since Raspberry pi is not currently listed under the supported operative
systems for Docker or Cloudmesh, The process of deploying Docker and
configuring the swarm Mode was successfully tested on the Raspberry Pi
first using the commands that are intended for Debian. Once the Swarm
was configured, the three Raspberry Pi devices were left on for over 24
hours and it was not observed any kind of abnormal behavior, like
looping services in the OS or overheating.

### Purchasing the hardware

The different hardware components were purchased via Amazon.com and took
anywhere between 2 to 5 days to arrive. The different components can
also be purchased through multiple on line sources or local electronics
stores.





### Additional Research


Initially, for this case, it was considered an option to developed a
function called CaptureImage and a second function called Deploy
Raspbian. As their names suggest, the first one intended to capture an
image or backup of a Raspberry Pi. This first function would receive the
IP address or hostname of the desired machine and the desired location
to store the captured image, alongside the corresponding credentials and
wrap a **dd** shell command similar to the following:

:o: is the quote correct this is markdown not latex

```
dd if=/dev/mmcblk0 bs=1M ` gzip -QUOTE \| dd of=imageDir\|
```

Among the challenges faced, this line was returning an invalid syntax,
most likely because of the use of the variables. Since there was not a
lot of time, the team decided to postpone this function.

The second function was called DeployRaspbian and would receive the
route and name where the image would be deployed, i.e.`/dev/bkp` and
image name and route, i.e.`~/Desktop/raspbian.gz`. The shell command
that would be wrapped would be:

>`gzip -dc diskNm PIPE sudo dd of=imageName bs=1m conv=noerror,sync`

More information on this topic can be found in the section called
**Backup** ***www.raspberrypi.org***.

Among the challenges, there is no clarity on whether the image can be
deployed over a lan connection and this point there is not enough time
to run tests. Also, since this is a copy of a previously used Raspbian,
there is a chance that there might be conflicts related to the IP
addresses that might be stored in different files of the OS.

### Final code
The final version of the code can be found on:

<https://github.com/cloudmesh-community/hid-sp18-709/tree/master/project-code>

Other options of coding were considered during the development of this
solution. Since all of the deployment can successfully be done via
terminal in Raspbian, two main options were considered:

Option 1. A bash script for every part of the deployment and wrap it in
python. This option would have been less dynamic and wouldn't make the
best use of the available resources, but at the same time it could have
ben easier to addapt to linux Operating systems other than Raspbian.

### Conclusions

It is possible to create the plug in. Using the SH sub process included in python 2.5-3.5. The team was able to try the steps one at a time at the level of py scripts, but encountered an error previously mentioned in this document when trying to implement it as part of cms. Also, as the professor suggested, this same system can be implemented as a different  abstraction for deployments such as an abc class similar to the following:

:o: format wrong

```
class deployment

  def prepare
    # prepares installation including downloads and other installs needed

   def deploy
     # deploys the package or software

   def configure
     # does some configurations

   def test(test)
     # does a test wheer a name is passed of a test (you could have multiple)
     # the name all woudl be running all tests
```

 
Since most of this work was working with bash commands tunneled through python scripts and implemented in CMS, Once this is fully functional, it is very possible that the same methodology can be followed to add more layers of complexity, i.e. Kubernetes. 

It would be important to consider that the fact that the passwords would have to be either hard coded or transferred in plain text has to be seen as a vulnerability, that has to be addressed either by adding an encryption/decryption module or finding another way to safely access the root of the target device.



