# Working With Docker Containers
## Introduction
A Docker container is a lightweight, standalone, and executable software package that includes everything needed to run an application. This includes the application's code, runtime, system tools, libraries, and settings. Containers encapsulate the application and its dependencies, ensuring it runs consistently across different computing environments.

The project demistifies working with docker containers. Container's lifecycle and associated docker commands were clearly presented and demostrated. Other Docker commands that are relevant to containers were thoroghly explored. 
## Running Containers
A container is basically a running instance of an image. Hence, an image must be available before a container can be run based on the image. The ubuntu image was recommended for the project implementation. 
An Ubuntu image from the official ubuntu repository on docker hub was pulled  with the command `docker pull ubuntu`
`docker run -t ubuntu:latest` command was used to run a container based on the ubuntu image
`docker ps -a` was used to check the status of the container. The output of the command showed that the container was in `exited state`. It was no longer running.
The container was started with the command `docker start 17f642f02fde`, where "17f642f02fde" is the container ID.
Again, `docker ps -a` was used to check the status of the container. This time around, the status showed `UP 4 seconds`.

## Launching Containers with Different Options

Various options are available in docker to customize the behaviour of containers. Environment variables, map ports and mount volume, and so on, could be specified.

### Environment Variables
Environment variables are key-value pairs that provide configuration and runtime information to applications running inside containers
The syntax to run a  a container by specifying an environment variable is shown below: `docker run -e "VARIABLE_NAME=value" image-name`
  -The `-e` flag sets environment variable inside the container at runtime.
The following example command illustrates how to run a container by specifying an environment variable. 
`docker run -e "NODE_ENV=production" ubuntu:latest`. 

### Running Containers in the Background

To run a container in the background, the option `-d` is added as a flag to the `docker run` command. It was implemented as shown below:
`docker run -d --name=ubuntuapp ubuntu:latest`
The output of the command was verified by executing the command `docker ps -a` to checck the available containers and the newly run container was seen listed.

### Container Lifecycle

