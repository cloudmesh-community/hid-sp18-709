# CMD5 Plugin to Create a Docker Swarm Cluster on 3 Raspberry PIs

- Andres Castro Benavides
- Uma M Kugan
- Gregor von Laszewski 

GVL: citation are still done with bibtex in addition to urls in text.
e.g. [@dockerdoc2017]

## Abstract

Information technologies are evolving from mainly one-host
environments to more distributed environment. Docker Swarm makes it
possible to avoid having a single point of failure and instead, have
multiple nodes that can be properly balanced and contain replicas of
the information.  Currently, Dockers must be individually downloaded,
installed and configured on each physical computer in order for the
desired computers to work in swarm mode. This paper details the
development of a plug-in that would allow CloudMesh to deploy a Docker
Swarm cluster. The creation of this plug-in would be the first step
towards the development of a tool which would allow larger debian
based networks to work as container oriented virtual environments with
optimized usage of resources.
    
## Introduction


### Docker Swarm


Docker is the technology used for containerization for software
development. It is an open source tool which makes it easy to deploy
applications. Applications are packaged in containers and then it is
shipped to all the platforms that is supposed to work with. Applications
are divided into manageable sizes and all the dependent functions are
added and individually packaged. Both Linux and Windows are supported by
Docker.

Docker Swarm is a clustering and scheduling tool for Docker containers.
A swarm is nothing but multiple Docker hosts which run in swarm mode and
act as managers to manage delegation and workers will run swarm
services). A given Docker host can be a manager or a worker or it can
perform both roles. If any of the worker node becomes unavailable,
manager schedules that node's tasks on other nodes. A node is an
instance of the docker engine participating in the swarm [@dockersdoc].

A swarm is made up of multiple nodes. We need to execute docker swarm
init to enable swarm mode and to make current machine a swarm manager,
run docker swarm join on other machines to add them to the swarm as
workers and run docker node ls on the manager to view the nodes in this
swarm.

Docker Swarms are used to orchestrate processes, optimizing the use or
resources across clusters. In other words, the use of Docker Swarms
allow individual computers to work as a cluster, sharing their RAM,
processors, physical memory, among other features or abilities. The
docker, when used in swarm mode, evaluates the assets across the network
and manages tasks in real time. Each computer can contribute its assets
to complete tasks in the most efficient way. It is dynamic and adapts
based on the available resources and current demands.


#### Inside Docker

The four main internal components of docker are Docker Client and
Server, Docker Images, Docker Registries, and Docker Containers.

#### Docker Client and Server

The docker server gets the request from the docker client and then
process it accordingly. Docker server and docker client can either run
on the same machine or a local docker client can be connected with a
remote server running on another machine [@turnbull2014docker]. Fig. 1
Docker architecture [@turnbull2014docker].

#### Docker Images

Base image are the Operating system images such as Ubuntu 14.04 LTS, or
Fedora 20 which creates a container to run Operating system. The docker
file contains a list of instructions to build an image. When using
docker, we start with a base image, boot up, create changes and those
changes are saved in layers forming another image
[@rad2017introduction].

#### Docker Registries

Docker images are placed in docker registries. It is same as source code
repositories where images can be pushed or pulled from a single source.

#### Docker Containers

Docker image creates a docker container. Containers have everything for
the application to run on its own.



### Docker Swarm Installation and Configuration

In order to set up a Docker Swarm, there needs to be direct access to
each machine that will integrated as  a node  in the swarm. 
In order to set up the nodes, docker
must be independently installed, configured and instantiated on each machine. Then,
each machine must be added to the swarm with management commands, allowing it to communicate or
interact with the other nodes.

In its simplest form this processes is often documented to be executed by hand. 
Naturally for smaller deployments this is not an issue. 

However, it is an issue large scale deployments can not be managed in such a fashion. 
In our case wi like to manage clusters with hundrets of docker nodes. Such deployments not only require automation through the deployment, but also through the maintenance phase. This includes updates to the operating system, as well as other routine tasks.
To address these administrative tasks of (a) setting up docker swarm and (b) updating the cluster when needed CloudMesh [@cloudmesh] could be utilized to centralize installation and configuration of every
node and manager.


### Creating CloudMesh plug-ins


TODO: what it currently does and has the potential to do. gregor can contribute ... remind him

By creating
CloudMesh plug-ins, it is possible to extend its potential from diferent
kinds of cloud based environments interconnection to deployment of a
container management system, in this case, Docker.

Utilizing CloudMesh to Centralize Docker Swarm Installation Cloud Mesh
does not have a plugin that allows you to deploy container solutions on
physical networks. Create a plugin that would allow Cloud Mesh to deploy
container solutions (in this case, the Swarm mode of Docker) to a
physical devient based network (in this case, a series of raspberry
pies). Could be used as a model to deploy other types of container
oriented solutions. It is taking a simple network (Debian based netword
and allowing it to centralize resources and assigning tasks and
optimizing different functions by installing a container management
system, called Docker Swarm.

In order to simulate the deployment of a Docker Swarm cluster, this
Cloudmesh project develops a Cloudmesh plugin, that deploys a Docker
Swarm cluster on three Raspberry Pis, allowing them to be part of this
multi cloud environment.

The cloud mesh allows Methods you to deploy the Docker Swarms (are
container management tools) to the raspberry pies.

## Methods: Proposed Solution


### Hardware

We intend to test our instalation on four different hardware environments

1. **Wifi network of 3 PIs**: a small scale cluster that can be replicated with modest cost and done by anyone. This cluster contains:

	* 3 Raspberry Pi 
	* 3 Micro SD Cards (64 GB) 
	* 3 USB to Micro USB Cables 
	* 1 Multiple USB power supply for the 3 PIs
	* 1 wifi Network
	* 1 external monitor or TV with HDMI interface (to make the setup easier initially).

2. **LAN network of 3 PIs**: The setup is the same as the first setup, but instead of using a wifi, we areusing a wired network. TO do so we add an ethernet switch

	* 1 Ethernet switch with 4 connectors

3. **100 node Raspberry PI 3B cluster**: We replicate setup 3 not just on 3 but 100 nodes of  a raspbery PI 3B

	* 100 Raspberry PI 3B
	* x network switches
	* x power plugs
	* can we use 32GB? SD Card?

3. **100 node Raspberry PI 3B+ cluster**: Since we started the project, a new generation of Pi's has been made available and we replicate the experiemnt on the new PI's to conduct comparative benchmarks.

	* 100 Raspberry PI 3B+
	* x network switches
	* x power plugs
	* * can we use 32GB? SD Card?


The hardware was purchased via Amazon and took anywhere between 2 to 5
days to arrive. However ordering larger quantities of PI's may take more time.

For now we focus on setup 1 and demonstrate what is neede dto execute by hand so we can automatize these steps with cloudmesh.


#### Wifi network of 3 Raspberry Pi

For this experiment we use 3  Raspberry Pi 3
Model B. Raspberry Pis are single inexpensive computer boards. They have been developed with education and
extension in mind, making them very popular in the academic and
entrepreneur communities. The specifications of the model that has been
used for this experiment are the following:

CPU: 1.2 GHZ quad-core ARM Cortex A53 (ARMv8 Instruction Set) GPU:
Broadcom VideoCore IV @ 400 MHz Memory: 1 GB LPDDR2-900 SDRAM USB ports:
4 Network: 10/100 MBPS Ethernet, 802.11n Wireless LAN, Bluetooth 4.0
Cite https://hackaday.com/2016/02/28/introducing-the-raspberry-pi-3/

They are interacting with each other using a private wireless network,
and they have been assigned static Internet Protocol Addresses. In this
case 192.168.1.85, 192.168.1.86 and 192.168.1.87.

#### Micro SD Cards

Because of its architecture, Raspberry devices can use either MicroSD cards or USB devices to hold the operating system. In our case we chose Micro SD Cards.
They emulate
the Hard drive resource used on other kinds of computers. The reason we ned them is that the instalation will require at least 16 GB of memory. We will need to install the following detailing its requirements.

Docker Memory Requirements:

* 8GB of RAM for manager nodes or nodes running DTR
* 4GB of RAM for worker nodes
* 3GB of free disk space [@dockerdoc2017]

So at least 12GB is required for Docker and 4GB is used for
the proper functioning of Raspbian. [@rpicards2017]

Taking these requirements in consideration, there should be a minimum of
16GB of free space in the MicroSD in order to perform this experiment.

The MicroSD cards used were SanDisc Memory Cards with a 64GB capacity.

#### Micro USB Cables

3 USB to Micro USB Cables for power supply to the Raspberry Pi's Since
these small computers don't use the regular power supply chords, they
are equipped with MicroUSB ports to power the device. All of these
devices are plugged to a main power outlet that allows to charge
multiple devices at the same time. There are other options to power the
devices include, such as attaching them to external batteries.

#### External monitor

Since the Raspberry Pi's are headless machines, they require to be
accessed directly for the initial set up and after that it is possible
to continue the configuration and installation process using any kind of
remote access, like SSH or RealVNC. For this initial connection, any
kind of screen that is HDMI compatible is useful. In this case the
initial setup of the RPis was performed on a Toshiba 55 inch HDTV with
HDMI port. After that they were accessed from a Laptop computer with
Linux Ubuntu 17.10, using Remmina via ssh (XORG).

#### Initial input devices

In order to set up the devices. The Raspberry Pi will require a set of
initial input devices attached to each computer. For this exercise, a
USB enabled standard keyboard and a USB enabled standard mouse were
used.

### System Setup

Currently, the default way to deploy the operating system to the
Raspberry Pi is by using an Operating System installation Manager called
Noobs -which stands for *New Out Of Box Software*-. 

GVL: WHy do we need NObs and not just Rasbian? WHat is the difference?

This manager can be
downloaded directly from the Raspberry Pi website and it includes
several Operating system options, among them:

* Raspbian Pidora LibreELEC OSMC RISC OS Arch Linux

Since Raspbian is the default Operating system and most commonly used,
this experiment decided to use it. This is also helpful because there is
material available in different websites with instructions on how to
install Docker in Debian based Machines. Raspbian is Debian based.
Another important reason is that Docker has as a requirement that the
Linux kernel version on which it will be installed is 3.10 or higher.
The Kernel version of the version of Raspbian that was used is 4.9.

#### Raspbian

The version of Raspbian that was used has the following specifications:
Release date of 2017-11-16 and the kernel version 4.9.

#### Docker

There are several versions of Docker available. Each version with their
own advantages and disadvantages. Because of the architecture used by
Raspberry Pi -ARM instead of AMD-, the Docker version used is *Docker
for Debian ARM*. With the following Specifications:

GVL: so are ther multiple for pi or is there only one?

Version 17.09.0-ce Release 2017-09-26

This version of Docker is Community Edition (CE), which means that it is
available for free and can be installed on bare metal or cloud
infrastructure. This flexibility is good for the experiment, because it
will be installed on Raspberry Pi's, which are considered physical
devices or bare metal Machines [@dockerdoc].

### Prerequisites


Before using the proposed solution, the user's environment needs to meet
the following requirements:

#### OS: Raspbian

Raspbian must be installed and configured on all MicroSD Cards. -- For
this, the user may follow the OS installation guide on Raspberry Pi home
page -- This requirement exists because there is a function that is
being explored to capture Raspberry Pi's images to be deployed later on
and avoid this pre requisite, but it is not ready yet.


#### OS: Password

First we must change the default password. Type in 

```sudo password pi```

and enter a new password, please don't skip this step as otherwise your py will be vulnarable to attack. YOu must do this before you acativate the WiFI network.


#### OS: update repositories

In order to ensure that the user is accessing the latest version
available of the software, it is important to update the Raspbian
repositories. For example, the user can access the teminal and enter the
following commands:

```bash
pi$ sudo apt-get update 
pi$ sudo apt-get upgrade
```

The first time that the user runs one of these commands, the user may
need to enter the root password. This process might take a few minutes.

#### Remote access setup

Enable SSH on the Raspberry Pi's. -- After Raspbian installation, enable
SSH on all your Raspberry Pi machines.



#### Changing hostnames

First, we change Raspberry Pi hots name. To do so, we change the labeled with `127.0.1.1` hostname `raspberrypi` in
`/etc/hosts` file (in most of the cases it is the last line in the
file). Leave all the other entries as it is. sudo nano /etc/hosts Change
local Hostname in `/etc/hostname` file. sudo nano /etc/hostname
Initialize hostname using `hostname.sh` script

```bash
pi$ sudo /etc/init.d/hostname.sh
```

Get hostname for your PI

```console
pi$ hostname -I
pi$ sudo nmap -sn 192.168.1.0/24
```

Next, we install Docker using following command -- For details, you may follow
this link --
<https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/>
We aslo need to make sure your user account can access the Docker client.

```console
pi@ curl -sSL https://get.docker.com | sh
pi@ usermod pi -aG docker If your username isn't pi then replace pi with
alex for instance.
```

Repeat Now repeat the above for each of the RPis.

## Automation of the Parallel Process

It is clear that these steps can easily be automated. There are several abroaches to this. 
including cloudmesh. For this purpose we recently started a new version of cloudmehs that is managed at 

* <https://github.com/cloudmesh-community/cm>

and provides the bare bones structure for executing the steps in parallel. 

Alternative approches coudl include:

* pdsh
* fabric
* ansible


