# CMD5 Plugin to Create a Docker Swarm Cluster on 3 Raspberry PIs

:o: obviously the bibbtex labels are wrong

---

Author:

- Andres Castro Benavides, acastrob@iu.edu
- Uma M Kugan, umakugan@iu.edu
- Gregor von Laszweski, laszewski@gmail.com

---

Keywords:

Raspberry Pi, Cloudmesh, CMD5, Big Data, Big Data, i523, HID709, HID710

---

## Abstract

Docker Swarm makes it
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

Currently, Dockers must be individually downloaded, installed and
configured on each physical computer that is integreated into a
*swarm*. We present a plug-in that allows the instalation of docker
swarm conveniently with a cloudmesh plug-in.  The four main internal
components of docker are Docker Client and Server, Docker Images,
Docker Registries, and Docker Containers.

### Docker Client and Server

The docker server gets the request from the docker client and then
process it accordingly. Docker server and docker client can either run
on the same machine or a local docker client can be connected with a
remote server running on another machine [@turnbull2014docker].

![Docker Architecture [@paraiso2016model]](images/High-level-overview-of-Docker-architecture.png)


### Docker Images

Base image are the Operating system images such as Ubuntu 14.04 LTS, or
Fedora 20 which creates a container to run Operating system. The docker
file contains a list of instructions to build an image. When using
docker, we start with a base image, boot up, create changes and those
changes are saved in layers forming another
image [@rad2017introduction].

### Docker Registries

Docker images are placed in docker registries. It is same as source code
repositories where images can be pushed or pulled from a single source.


#### DevOps

The main goal of DevOps is to eliminate the gap between the developers
and IT operations team. Docker with DevOps get the developers and
operations team to work together so that they both understand the
challenges faced by each other, apply DevOps practices [@www-hackernoon-docker].

#### CI/CD

Continuous Integration and Continuous Deployment are the most common use
cases of Docker. Continuous Integration testing and Continuous
Deployment allows developers to build codes, test them in any
environment. Docker integration with Jenkins and GitHub making it easier
for developers to build codes, test them in GitHub and trigger a build
in Jenkins and adding the image in Docker registries [@www-hackernoon-docker].

#### Docker Containers As A Service

Docker help any organization to modernize their application
architecture. It can deploy scalable services securely on a wide variety
of platforms, improving flexibility and maximizing capacity. Best use
case for Docker installation is the US Government where they enhanced
their applications and made their components and services of their
system and easily transportable/shareable with other agencies within the
government [@www-hackernoon-docker].

### Docker - Services

#### Docker Engine

Docker Engine is the foundation for the application platform which is
used for creating and running Docker containers. It is supported on
Linux, Windows, Cloud and Mac OS. It is lightweight, open source and
integrated with a work flow to build and containerize applications. User
interface is very simple and it makes the environment easily portable
from single container on single host to multiple applications on a many
number of hosts [@www-hackernoon-docker].

#### Docker Enterprise

Docker Enterprise provides an integrated platform for both developers
and IT operations team where container management and deployment
services are together for end-to-end agile application portability. It
is easy to manage, monitor and secure images both within the registry
and those deployed across various clusters [@www-hackernoon-docker].

#### Docker Hub

Docker Hub functions as a hosted registry service that helps you store,
manage, share and integrate images across various developer work flows.
Integration testing is done each time when the image is
shared [@www-hackernoon-docker].

#### Docker Compose

Docker Compose is a tool that developers deploy to define and run all
multi-container Docker applications. Single host can be used to isolate
multiple environments, even if they are of the same name. Data volume is
copied automatically from old container whenever a new container is
created. Compose uses the previous configuration to create the new
container which reduces the time for replicating the same changes to the
environment [@www-hackernoon-docker].

