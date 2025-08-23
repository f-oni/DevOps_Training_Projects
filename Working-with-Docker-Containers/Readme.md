# Working With Docker Containers

## Introduction

A Docker container is a lightweight, standalone, and executable software package that includes everything needed to run an application. This includes the application's code, runtime, system tools, libraries, and settings. Containers encapsulate the application and its dependencies, ensuring it runs consistently across different computing environments.

The project demistifies working with docker containers. Container's lifecycle and associated docker commands were clearly presented and demonstrated. Other Docker commands that are relevant to containers were thoroughly explored. 


## Running Containers

A container is basically a running instance of an image. Hence, an image must be available before a container can be run based on that image. The ubuntu image was recommended for the project implementation. 
+ An Ubuntu image from the official ubuntu repository on docker hub was pulled  with the command `docker pull ubuntu`

<img width="738" height="343" alt="image" src="https://github.com/user-attachments/assets/0dfa324a-8199-413e-aee8-601562d2cbee" />

+ `docker run -t ubuntu:latest` command was used to run a container based on the ubuntu image
+ `docker ps -a` was used to check the status of the container. The output of the command showed that the container was in `exited state`. It was no longer running.
+ The container was started with the command `docker start 17f642f02fde`, where "17f642f02fde" is the container ID.
+ Again, `docker ps -a` was used to check the status of the container. This time around, the status showed `UP 4 seconds ago`.

<img width="1177" height="591" alt="image" src="https://github.com/user-attachments/assets/0039375d-f291-47be-b7ec-4081ccf6c5f7" />


## Launching Containers with Different Options

Various options are available in docker to customize the behaviour of containers. Environment variables, map ports and mount volume, and so on, could be specified.

### Environment Variables

Environment variables are key-value pairs that provide configuration and runtime information to applications running inside containers
The syntax to run a  a container by specifying an environment variable is shown below:

`docker run -e "VARIABLE_NAME=value" image-name`

  -The `-e` flag sets environment variable inside the container at runtime.
  
The following example illustrates how to run a container by specifying an environment variable. 

`docker run -e "NODE_ENV=production" ubuntu:latest`. 

<img width="1233" height="429" alt="image" src="https://github.com/user-attachments/assets/a5a6f6fa-e547-4704-a364-c69512e003c7" />


### Running Containers in the Background

- To run a container in the background, the option `-d` is added as a flag to the `docker run` command. 
- It was implemented as shown below:
`docker run -d --name=ubuntuapp ubuntu:latest`
- The output of the command was verified by executing the command `docker ps -a` to checck the available containers and the newly run container was seen listed.

<img width="1210" height="514" alt="image" src="https://github.com/user-attachments/assets/953d47d8-4d0e-4954-9235-a4a3ff9baa37" />


### Container Lifecycle

The Docker container lifecycle describes the various states a container can transition through from its creation to its eventual removal.
Docker containers go through five main stages: Created, Running, Paused, Stopped, and Deleted
The lifecycle of a docker container are listed below:

1. **Created state:** Container is made from an image but not started
2. **Running state:** Container is active and doing its job
3. **Paused state:** Container's work is temporarily stopped
4. **Stopped state:** Container is shut down
5. **Killed/Deleted state:** Container is removed from the system

To stop a running container, the  `docker stop container-name or ID` syntax is used. This was demonstrated by executing the command:`docker stop agitated_euclid`, where "agitated_euclid" is the container's name. The container's ID could as well have been specified.

<img width="1178" height="481" alt="image" src="https://github.com/user-attachments/assets/08013a8b-18c3-412c-9a0a-243b717338ed" />


The command below was used to remove the container: `docker rm -f fd78711ebab0`. The container ID was specified in this case. The effect of the `docker rm` command was verified by listing the containers with the command `docker ps -a`. The output showed that the container was no longer listed.

<img width="1155" height="403" alt="image" src="https://github.com/user-attachments/assets/189134f9-60f6-4f87-ad2b-98a30e95ac47" />


## Side Hustle Task
The side hustle task focused on demonstrating the lifecycle of a docker container.

step 1

+ A container was run based on the official ubuntu image with the command: `docker run -it --name=ubuntu-lab ubuntu:latest`

  - The `-i`: This flag keeps the standard input (stdin) open for the container, even if no process is attached
  - The `-t`: This flag allocates a pseudo-TTY (terminal) for the container. This creates a virtual terminal session, enabling interactive shell sessions within the container and allowing one to see formatted output. The output of the command is shown below:

+ Some simple command within the container. The following were run successfuly within the container:
   - `ls command`
   - `hostname command`
   - `whoami`
   - `free -h`
   - uname -m`
     
  Those linux commands displayed the expected outcomes

  <img width="1187" height="421" alt="image" src="https://github.com/user-attachments/assets/169b8d4b-bfd8-4e5b-b750-13a47f954e73" />


Step 2:

+ The running container was stopped with the command: `docker stop ubuntu-lab`  and verified with the `docker ps -a` command. 
+ The status column showed "exited 56 seconds ago" as expected.

  <img width="1253" height="349" alt="image" src="https://github.com/user-attachments/assets/e188c994-d274-4ceb-b01d-12dd2c352cbb" />

+ The stopped container was restarted with thw command `docker restart ubuntu-lab` as shown. The effect of the command was also verified with the command `docker ps -a`.
+ The status column showed "UP 5 seconds ago" as expected.

  <img width="1272" height="423" alt="image" src="https://github.com/user-attachments/assets/2123b9e4-3abf-4a78-b19c-2b38bf829933" />

+ The linux commands that were previously run before stopping the container were executed again after restarting it. There was no major observable difference in the ouputs and the behaviour of the container.

<img width="1167" height="582" alt="image" src="https://github.com/user-attachments/assets/cfbba5b6-14a8-465d-8c6a-3907512bc36b" />

  Step 3
  
  - The container was stopped again with the command `docker stop ubuntu-lab`

    <img width="1230" height="357" alt="image" src="https://github.com/user-attachments/assets/21309924-75c1-4862-878f-8ee101f81365" />

  - The container was removed with the command `docker rm -f ubuntu-lab` and verified with the command `docker ps -a`.
  - The container was no longer listed as shown in the screen shot below.

    <img width="1151" height="356" alt="image" src="https://github.com/user-attachments/assets/3fd3da6d-3570-45e8-b792-25ee03b56a2c" />



  ## Conclusion
  The project provided insights into working docker containers through practical demonstration of container lifecycle and executing some docker container-related commands

    







