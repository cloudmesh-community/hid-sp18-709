# Docker Swarm

Docker is a technology for containerization mostly used for software
development. It is an open source tool which makes it easy to deploy
applications within containers. Applications are packaged in
containers and then they are shipped to the platforms that they need
to be executed upon. Applications distributed as containers are
divided into manageable sizes and all the dependent functions are
added and individually packaged. Operating systems such as macOS,
Linux, Windows 10 Education and Windows 10 Pro are supported
by Docker. However containers do require hardware support that needs
to be available and activated.

Docker Swarm is a clustering and scheduling tool for Docker
containers.  A swarm is made up of multiple nodes.  A node is an
instance of the docker engine participating in the swarm
[@dockerdoc2017].  A Swarm consists of to types of nodes. Worker nodes
and manager nodes. In a swarm multiple managers and workers may exist.
If any of the worker nodes become unavailable, the managers
re-schedules that node's tasks on other nodes.

We need to execute

```bash
master$ docker swarm init
```

to enable swarm mode and to make the host on which it is executed a
swarm manager. On the worker nodes we execute

```bash
worker$ docker swarm join
```

to add them to
the swarm as workers. To see the list of workers we can execute


```bash
master$ docker node ls
```

:o: yet another introduction? Gregor stopped here


Docker Swarms are used to orchestrate processes, optimizing the use or
resources across clusters. In other words, the use of Docker Swarms
allow individual computers to work as a cluster, sharing their RAM,
processors, physical memory, among other features or abilities. The
docker, when used in swarm mode, evaluates the assets across the network
and manages tasks in real time. Each computer can contribute its assets
to complete tasks in the most efficient way. It is dynamic and adapts
based on the available resources and current demands.

In order to set up a Docker Swarm, there needs to be direct access to
each machine that will be used as a node which is how we will call an
instance of Docker that will be part of the swarm. In order to set up
the nodes, the docker must be independently installed and configured on
each machine. Then, each machine must be added to the swarm, allowing it
to communicate or interact with the other nodes.

This processes not only requires human resources like technicians
working on installation and configuration, but also demands these
actions be repeated manually on each individual node or manager. While
this can be done virtually, it still requires individual attention in
the setup of each machine. In order to optimize the setup of Docker
Swarms, CloudMesh could be utilized to centralize installation and
configuration of every node and manager.

## Installing the components via ssh into every node.

The following steps were followed on each device: Usig the TV as an
external monitor, the USB input devices: keyboard and mouse, and the
Raspberry Pi with Raspbian installed. An ssh key was generated and the
device was accessed using Remmina via a XORG connection from a computer
equipped with Linux Ubuntu 17.10 Artful Aardvark.

The components were installed in the following order:

Updated the Raspbian packages Installed Python 3.6.2 and Python 2.7.13
via PIP and also Installed Cloudmesh: following the instructions found
in: https://github.com/cloudmesh/ Installed Docker CE ARM via Terminal
using the following command:

```bash
curl -sSL https://get.docker.com
```

Started the swarm and assigned a master node

```bash
$ sudo docker swarm init --advertise-addr 192.168.x.x
```

Created the remaining two nodes, with 

```bash
$ curl -sSL https://get.docker.com \| sh=\" as suggested in https://www.raspberrypi.org/
```

And then, using the docker swarm join command the token generated when the master node was created, they were added to the swarm.

## Installing and configuring Docker Swarm

### Manager

Since Docker requires at least one computer to be a Manager and
Cloudmesh also requires at least one main configured piece of equipment,
a Raspberry Pi was chosen to be the main device, in this case, the
Raspberry Pi with the IP address 192.168.1.85. The following command
was run on the Terminal or that device to set it as the manager:

```bash
$ sudo docker swarm init --advertise-addr 192.168.1.85
```

## Workers

The other two Raspberry Pi devices. In this case, the Raspberry Pi with
the IP address 192.168.1.86 and the one with 192.168.1.86, were defined
as simple worker nodes.

To define the workers, the following command was used:

```bash
sudo usermod -a -G docker USER
```

and to work as part of the swarm the command used was:

```bash
docker swarm join --token *** 198.168.1.85:2377`
```

As a last step, it was confirmed that all the nodes were added by using
the following command:

```bash
sudo docker node ls`
```
