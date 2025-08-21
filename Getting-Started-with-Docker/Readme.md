# Getting Started with Docker
## Introduction

Docker is an open platform that helps developers to build, share, run, and verify applications within lightweight, isolated environments called containers. Docker is a tool that is used to automate the deployment of applications in lightweight containers so that applications can work efficiently in different environments in isolation. The following terminologies and concept should be properly understood in order to work with docker effectively:

1. **Images:**
Docker images are read-only templates that contain the instructions for creating a Docker container. They are built from a Dockerfile, which specifies the application's environment and dependencies.

2. **Docker container:**
A Docker container is a lightweight, executable software package that includes everything needed to run an application, including the code, runtime, system tools, libraries, and settings. It is a runnable instance of a Docker image. A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. In nutshell, containers are running instances of docker images. They have a liffcycle: **create**, **start**, **stop** and **delete**

3. **Registry (Docker Hub):**
A centralized repository for storing and sharing Docker images. Developers can pull pre-built images or push their own custom images to the registry.

## The Project

The project is an introduction to docker basics. It covers docker installation and how to run some basic docker commands. The underlisted steps were followed for the project implementation

1. Installation Prerequisites
2. Docker repository configuration
3. Docker installation and verification
4. Running docker basic commands

### Installation Prerequisite 
**Step 1**

- The first step is to add docker's official GPG key to the local host.
- The ubuntu operating system is updated with the command `sudo apt update` 
- To install Certificate authorities and other essential packages, the following command is run: 

`sudo apt-get install ca-certificates curl gnupg`

The command will install
- Certificate authorities
- curl (a data transfer tool) and
- The GNU Privacy Guard for secure communication and package verification.

  <img width="1008" height="546" alt="image" src="https://github.com/user-attachments/assets/65480fb8-4b35-4ae3-83db-5db39bffc3e9" />


  **Step 2**
  
  Creating a directory for storing keyrings files, which are used for docker's authentication. The command to achieve that is shown below:
  `sudo install -m 0755 -d /etc/apt/keyrings` . It creates a directory /etc/apt/keyrings with permissions 0755. The permission interpretation is shown below:
  
  +  Owner (User): Read, Write, and Execute (represented by 7)
  +  Group: Read and Execute (represented by 5)
  +  Others: Read and Execute (represented by 5)

    <img width="1260" height="419" alt="image" src="https://github.com/user-attachments/assets/da70412c-c9c9-48da-937f-07a8d9ed75b0" />

 
  **Step 3**
  
  Downloading the docker GPG key
  To download the download the docker GPG key, the command below was used
  
  ```
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  
  ```
  The above command downloads the docker GPG key using `curl`

  
<img width="1260" height="419" alt="image" src="https://github.com/user-attachments/assets/da70412c-c9c9-48da-937f-07a8d9ed75b0" />


  **Step 4**
  
  Setting prmissions on the docker GPG key file
  
  The command below was used to set read permissions for all users on the docker GPG key file within the APT keyring directory

  `sudo chmod a+r /etc/apt/keyrings/docker.gpg`

  ### Docker repository configuration
  
  This was done by adding the repository to the `APT` sources.
  The lines of code below was used to accomplish that

  ```
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  ```
 +  The `echo command` creates a docker APT repository configuration entry for the ubuntu system. It also incoporates the system architecture and the docker GPG key.
 +  The `sudo tee /etc/apt/sources.list.d/docker.list > /dev/null` writes the configuration to the  `/etc/apt/sources.list.d/docker.list > file`


<img width="1307" height="309" alt="image" src="https://github.com/user-attachments/assets/62e86af7-b958-4ec0-8aa4-bd04512dfb6c" />


### Docker installation and verification

- The OS was first updated with the command `sudo apt-get update`
- The command below was run to install the latest version of docker.

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

```

<img width="1287" height="580" alt="image" src="https://github.com/user-attachments/assets/53f806e8-cdcd-408a-8616-620efe4395de" />

To verify that docker was successfuly installed, the following command was run

`sudo systemctl status docker`

The output of the command showed that docker was successfully installed.

<img width="1288" height="498" alt="image" src="https://github.com/user-attachments/assets/c9b6a5b7-c245-439a-850e-9515338a10c9" />


### Running Basic Docker Commands

To run docker commands without the root privileges, a user has to be added to the docker group. The command below was used to achieve that.

`sudo usermod -aG docker $USER`

<img width="736" height="415" alt="image" src="https://github.com/user-attachments/assets/cccf8553-9268-4c47-a969-902ea97fbb75" />


A logout was required to effect the change.

The following set of docker basic commands were run thereafter:

1. **docker run command:** The docker run command is used to create and start a new container from a specified Docker image.

   It was demonstrated by executing the command `docker run hello-world`. The output is shown below.
   
   <img width="1048" height="572" alt="image" src="https://github.com/user-attachments/assets/e94ecf96-81e1-494b-8ac8-2689c1f15ce2" />

   - docker pulled the helllo-world image from the docker hub because it was not available locally.
   - It created a container based on the `hello-world` image.
   - It started the container and executed the predefined command in the `hello-world` image.
   successfully execution was verified usin the command: `docker images`. The output is shown below:

3. **Docker ps:** The `docker ps command` is used to list running containers on a Docker host. It provides a concise overview of active containers, including some important details such as: container IDS, names, image, and status. It was executed as shown:
    `docker ps` with the output below

   <img width="1316" height="446" alt="image" src="https://github.com/user-attachments/assets/edd247a5-0bd2-4812-b590-339091a1d0b1" />

   The flag `a` was added to view all containers, irespective of their status.
   `docker ps -a`. the output is shown below

   <img width="1272" height="239" alt="image" src="https://github.com/user-attachments/assets/892001c4-91d7-4a66-a5d5-efe55b71b490" />


4. **Docker stop:** Docker stop command is used to gracefully stop one or more running Docker containers. Its execution is shown below:

    `docker stop 1936fa25be91`
    The command stopped the container with the id: `1936fa25be91`.
    To verify effect of the command, the containers were listed after running the `stop command` and the status of the particular container changed from `up` to `exited`.

   <img width="1305" height="372" alt="image" src="https://github.com/user-attachments/assets/31179c9c-52c4-493b-a0d7-6bcfbf84c3d6" />


5. **Docker Pull** The `docker pull` command is used to download Docker images from a registry, such as Docker Hub, to the local machine. Its implementation is showm below:

    `docker pull ubuntu`.
   
   The command pulled or downloaded the latest version of the "ubuntu" image from docker hub. The output is shown below.

   <img width="1108" height="341" alt="image" src="https://github.com/user-attachments/assets/bf1e3b69-982d-43d9-abde-a1e96aa95028" />


6. **Docker Push:** The `docker push` command is used to upload a local docker image to a Docker registry, such as Docker Hub or a self-hosted registry.

 A login to the registry is requirement before a local image can be pushed. the command to login is :

 `docker login -u <username>`

 <img width="753" height="414" alt="image" src="https://github.com/user-attachments/assets/15fba85a-5945-4d02-b53b-c96e767c0f3f" />


    The `docker push` is demonstrated as shown:<br>
    
   `docker push folu980/ubutu:v1.0`.

   <img width="728" height="318" alt="image" src="https://github.com/user-attachments/assets/5f016d16-dc69-4a50-9fa7-c41359b1f930" />

   
    The image was successfully pushed to the repository as shown.
    

   <img width="1304" height="536" alt="image" src="https://github.com/user-attachments/assets/602a4bb3-e4df-4189-b520-00b3647a2c21" />



7. **Docker Images:** The `docker images` command is used to list all docker images available on the local machine. This command provides a quick overview of the images that have been pulled from a registry or built locally. The command was run as shown:


      `docker images`. The output of running the command is displayed below:

   <img width="807" height="222" alt="image" src="https://github.com/user-attachments/assets/1cd830ba-5b23-4406-9efa-fdbea04b3734" />


8. **Docker RMI:** The `docker RMI` command is used to remove one or more Docker images from the local system. `RMI` stands for "remove image." Docker RMI implementation is shown below:

   `docker rmi -f ib44b5a3e06a` The command was used to remove an image with the ID `ib44b5a3e06a`.
   
    The `docker images` command was run to verify that the specified image was remove.

<img width="1045" height="457" alt="image" src="https://github.com/user-attachments/assets/4e576e6c-750e-407c-b6f8-db1247a77481" />

## Conclusion

The project helped to lay a ground work for working with docker and docker containers. Docker concepts and terminologies such as images, containers and registry were properly introduced. The basic docker commands such docker run, docker ps, docker pull, docker push, docker images and docker rmi that were explored serve as a good foundation for working with containers.

   
   
   


  
  

