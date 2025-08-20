# Getting Started with Docker
## Introduction

Docker is an open platform that helps developers to build, share, run, and verify applications within lightweight, isolated environments called containers. Docker is a tool that is used to automate the deployment of applications in lightweight containers so that applications can work efficiently in different environments in isolation. The following terminologies and concept should be properly understood in order to work with docker effectively:

1. Images:
Docker images are read-only templates that contain the instructions for creating a Docker container. They are built from a Dockerfile, which specifies the application's environment and dependencies.
2. Docker container:
A Docker container is a lightweight, executable software package that includes everything needed to run an application, including the code, runtime, system tools, libraries, and settings. It is a runnable instance of a Docker image. A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another
3. Registry (Docker Hub):
A centralized repository for storing and sharing Docker images. Developers can pull pre-built images or push their own custom images to the registry.

## The Project

The project is an introduction to docker. It covers docker installation and running some basic docker commands. The underlisted steps were followed

1. Prerequisite installation
2. Docker repository configuration
3. Docker installation
4. Running docker commands

### Prerequisite installation

The first step is to add docker's official GPG key to the local host.
The ubuntu operating ssystem is updated with the command `sudo apt update` 
To install Certificate authorities and other essential packages, the following command is run: `sudo apt-get install ca-certificates curl gnupg`
The command will install
- Certificate authorities
- curl (a data transfer tool) and
- The GUP Privacy Guard for secure communication and package verification.

  step 2
  Creating a directory for storing keyrings files, which are used for docker's authentication. The command to achieve that is shown below:
  `sudo install -m 0755 -d /etc/apt/keyrings` . It creates a directory /etc/apt/keyrings with permissions 0755. The permission interpretation is shown below:
  
  +  Owner (User): Read, Write, and Execute (represented by 7)
  +  Group: Read and Execute (represented by 5)
  +  Others: Read and Execute (represented by 5)
  
  

