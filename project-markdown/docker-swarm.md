## Docker Swarm

Docker Swarm is a clustering and scheduling tool for Docker
containers, made up of multiple nodes.  A node is an instance of the
docker engine participating in the swarm.There are two types of nodes:
worker nodes and manager nodes. In a swarm multiple managers and
workers may exist.  If any of the worker nodes become unavailable, the
managers re-schedules that node's tasks on other
nodes. [@dockerdoc2017].

### Node Setup

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

### Installing the components via ssh into every node.

The following steps were followed on each device: Usig the TV as an
external monitor, the USB input devices: keyboard and mouse, and the
Raspberry Pi with Raspbian installed. An ssh key was generated and the
device was accessed using Remmina via a XORG connection from a computer
equipped with Linux Ubuntu 17.10 Artful Aardvark.

### Installing and configuring Docker Swarm

#### Manager

Since Docker requires at least one computer to be a Manager and
Cloudmesh also requires at least one main configured piece of equipment,
a Raspberry Pi was chosen to be the main device, in this case, the
Raspberry Pi with the IP address 192.168.1.85. The following command
was run on the Terminal or that device to set it as the manager:

```bash
$ sudo docker swarm init --advertise-addr 192.168.1.85
```

#### Workers

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
