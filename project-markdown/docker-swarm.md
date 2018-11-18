Docker Swarm: Current Use, Installation and Configuration

---------------------------------------------------------------

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
services. A given Docker host can be a manager or a worker or it can
perform both roles. If any of the worker node becomes unavailable,
manager schedules that node's tasks on other nodes. A node is an
instance of the docker engine participating in the
swarm [@dockerdoc2017].

A swarm is made up of multiple nodes. We need to execute "docker swarm
init" to enable swarm mode and to make current machine a swarm manager,
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





Installing the components via ssh into every node.
--------------------------------------------------

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

>\"curl -sSL https://get.docker.com \| sh=\" as suggested in https://www.raspberrypi.org/

Started the swarm and assigned a master node

>sudo docker swarm init --advertise-addr 192.168.x.x

Created the remaining two nodes, with 

>\"curl -sSL https://get.docker.com \| sh=\" as suggested in https://www.raspberrypi.org/

And then, using the docker swarm join command the token generated when the master node was created, they were added to the swarm.



Installing and configuring Docker Swarm
---------------------------------------

### Manager

Since Docker requires at least one computer to be a Manager and
Cloudmesh also requires at least one main configured piece of equipment,
a Raspberry Pi was chosen to be the main device, in this case, the
Raspberry Pi with the IP address 192.168.1.85. The following command
was run on the Terminal or that device to set it as the manager:

>`sudo docker swarm init --advertise-addr 192.168.1.85`

Workers
-------

The other two Raspberry Pi devices. In this case, the Raspberry Pi with
the IP address 192.168.1.86 and the one with 192.168.1.86, were defined
as simple worker nodes.

To define the workers, the following command was used:

>`sudo usermod -a -G docker USER`

and to work as part of the swarm the command used was:

>`docker swarm join --token *** 198.168.1.85:2377`

As a last step, it was confirmed that all the nodes were added by using
the following command:

>`sudo docker node ls`
