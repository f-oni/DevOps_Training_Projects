# Working with Docker Images

## Introduction
The project introduces how to build docker images from dockerfile and how to run containers. The concepts of pulling images from and pushing images to docker hub was also explored.

## Docker Hub
Docker Hub is a cloud-based registry service provided by Docker for finding, sharing, and managing Docker container images. Users can push and pull Docker images to and from repositories, enabling easy sharing and distribution of containerized applications.

## Docker Basic Commands
The following basic docker commands were used during the project implementation.

**Docker Search Command:**

To explore available images on docker hub, the `docker search command` is used. The command allows one to search for images available on Docker hub. For example, to search for the ubuntu image, the command below was used 

`docker search ubuntu`.

<img width="1006" height="562" alt="image" src="https://github.com/user-attachments/assets/b3b91715-6c47-4bc3-a71f-193267d89a28" />


**Docker Pull Command:** 

The docker pull command is used to download Docker images from a Docker registry, such as Docker Hub or a private registry, to the local machine and thereby making it available for use on the local machine. An example of its usage is shown below: `docker pull ubuntu`. The command pulls or downloads the latest version of ubuntu from the registry to the local machine.

<img width="1108" height="341" alt="image" src="https://github.com/user-attachments/assets/03a776b0-579a-4883-b174-f34d0130ee1b" />


**Docker Images** The `docker images` command, is used to list all Docker images that are present on a local machine. It provides a summary of information for each image stored on a local machine. It was used as shown below: `docker images`

<img width="860" height="336" alt="image" src="https://github.com/user-attachments/assets/ce9e4e0c-bdde-40c1-9ecf-c70ca4ff650a" />



## Dockerfile
A Dockerfile is a plain text document that contains a set of instructions used to build a Docker image. It is like a script that automates the process of creating a Docker image, defining the environment and the application that will run inside a container. 

### Creating a dockerfile

Dockerfile can be created by using a text editor and following the dockerfile instruction syntax. Key instrunctions commonly found in a dockerfile are listed below:

**FROM:** Specifies the base image from which to build.
**RUN:** Executes commands inside the container during image creation, typically for installing software or configuring the environment.
**COPY:** Copies files and directories from the host machine into the image.
**WORKDIR:** Sets the working directory for subsequent instructions.
**EXPOSE:** Informs Docker that the container will listen on a specific port at runtime.
**CMD:** Defines the default command to execute when a container starts from the image.
**ENTRYPOINT:** Configures a container that will run as an executable.
**ENV:** Sets environment variables within the container.

## Project Task 1

+ The task is meant to develop a dockerfile using NGINX as the base image
+ Provide a basic html file in the same directory with the dockerfile
+ Include instruction in the dockerfile to copy the index.html file to the NGINX public directory.
+ Build a docker image from the dockerfile
+ Run a container based on the docker image created
+ Push the image to docker hub.

Step 1

The dockerfile developed is shown below:

```

 # Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# No need for CMD as NGINX image comes with a default CMD to start the server

```
**FROM nginx:latest** Specifies the base image from which is NGINX.

**WORKDIR  /usr/share/nginx/html/** Sets the working directory in the container for subsequent instructions

**COPY index.html /usr/share/nginx/html/** Copies the local HTML file to the NGINX default public directory

**EXPOSE 80** Informs Docker that the container will listen on port 80 at runtime. 

**CMD:** Defines the default command to execute when a container starts from the image. It was not used in this instance because NGINX image comes with a default CMD to start the server.

Step 2

- A line of text was appended to the index.html file as shown `echo "Welcome to Darey.io" >> index.html`
- An image was built by navigating to directory containing the index.html file and the dockerfile and executing the command: `docker build -t dockerfile .`
  
  - **docker build:** This is the core command used to construct a Docker image from a Dockerfile and a build context
  - the `-t` flag tags the image. It is as a human-readable name for the final image. The name supplied here was dockerfile
  - The `. ` at the end of the docker build command tells Docker that it should look for the Dockerfile in the current directory.

  <img width="1071" height="438" alt="image" src="https://github.com/user-attachments/assets/3f961c0a-e93d-4792-9e88-2f8e67d9a76a" />


To run a container based on the custom NGINX image that was created, the following command was run: `docker run -p 8080:80 dockerfile`. The above command will create an image that will listen on `port 8080`.

<img width="968" height="501" alt="image" src="https://github.com/user-attachments/assets/c98d68f5-dc5f-48c0-9451-f731da3a843c" />

To list all containers, the command `docker ps -a` was used.

<img width="1230" height="270" alt="image" src="https://github.com/user-attachments/assets/e6929c00-647f-40f8-99b5-c97a9de9d802" />

The command `docker start 05dfafcc1fe2` was used to  start the container.

<img width="1302" height="507" alt="image" src="https://github.com/user-attachments/assets/faef7a5b-02f3-4fea-8ce5-23f53d2fb725" />

`http://localhost:8080` was used to accesed the content of the webbrowser as the implementation was done on a virtual box. If it was done on a cloud virtual machine, the address would have been `http://publicIPaddress:8080` and inbound rule would have been added to allow incoming traffic on port 8080.

<img width="1224" height="378" alt="image" src="https://github.com/user-attachments/assets/c4a87927-6a88-4e63-b834-ca33b3ef176a" />


## Pushing Docker Image to Docker Hub

The image was first tagged as with the command `docker tag dockerfile folu980/my-Nginx:v1.0`

<img width="1063" height="423" alt="image" src="https://github.com/user-attachments/assets/9e28e954-d953-4176-a500-b0dacc68f334" />

The repository was logged into with the command `docker login -u folu980`

<img width="1070" height="278" alt="image" src="https://github.com/user-attachments/assets/517ccd3b-5061-41b5-9812-f2d92b6b51d6" />

The image was pushed to the repository with the command `docker push folu980/my-Nginx:v1.0`

<img width="1071" height="433" alt="image" src="https://github.com/user-attachments/assets/c0edfd29-5aa5-4342-b599-32e38857d8ca" />

Docker hub was visited to verify that the image was successfully pushed to the repository. The screenshot is shown below:

<img width="1327" height="586" alt="image" src="https://github.com/user-attachments/assets/39a7a14f-5157-40f4-b004-f24923df541d" />



## Side Hustle Task

The side hustle task's implementation is similar to the project task except for a pernalized static site to be provided as the index.html file.
- The site was named `web-one`
- The dockerfile was developed using NGINX as the base image
- The index.html file was provided in the same directory with the dockerfile with the content "Hello, Iam learning DevOps. Let's learn together".

   <img width="737" height="335" alt="image" src="https://github.com/user-attachments/assets/c8bbb228-a9f3-42c6-9654-f8de657623dc" />


The dockerfile is shown below:

```
 # Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

```

**FROM nginx:latest** Specifies the base image from which is NGINX.

**WORKDIR  /usr/share/nginx/html/** Sets the working directory in the container for subsequent instructions

**COPY index.html /usr/share/nginx/html/** Copies the local HTML file to the NGINX default public directory

**EXPOSE 80** Informs Docker that the container will listen on port 80 at runtime. 

**CMD:** Defines the default command to execute when a container starts from the image. It was not used in this instance because NGINX image comes with a default CMD to start the server.


An image was built by navigating to directory containing the index.html file and the dockerfile and executing the command: `docker build -t web-one .`

<img width="1292" height="442" alt="image" src="https://github.com/user-attachments/assets/7f6f1a8b-7386-4126-9577-0efe9444128a" />


+ `docker run -p 4040:80 web-one`. was used to run a container from the image

  <img width="1298" height="479" alt="image" src="https://github.com/user-attachments/assets/6e129b4e-47d4-4e15-b34d-f5aae01eba93" />

+ The container was started with the command `docker start faffed90db5b`

  <img width="1035" height="621" alt="image" src="https://github.com/user-attachments/assets/0c3e0253-2941-41e0-8471-22dbc89b4ca4" />

+ The content was accessed by typing `http://localhost:4040` in the address bar of a browser.

  <img width="937" height="557" alt="image" src="https://github.com/user-attachments/assets/afd5d173-7ff9-4075-8abb-157a3f6fcf82" />

+ The image was tagged with the command `docker tag web-one folu980/nginx:v1.3`

  <img width="1018" height="439" alt="image" src="https://github.com/user-attachments/assets/70be45d5-722b-4f2f-85b9-9266b214c95b" />

+ `login -u folu980` was used to login to docker repository

  <img width="717" height="303" alt="image" src="https://github.com/user-attachments/assets/67d3698b-fe80-4fdd-8b9b-642552fb19ce" />

+ The image was pushed to docker repository using the command: `docker push folu980/nginx:v1.3`

  <img width="730" height="412" alt="image" src="https://github.com/user-attachments/assets/2354b1e5-8877-4ee2-ab8a-09581f37966f" />

+ The image pushed to docker hub was verify as shown:

  <img width="1115" height="518" alt="image" src="https://github.com/user-attachments/assets/893fb14d-fd89-4350-b395-9362b96d9e9b" />


## Conclusion

The project introduced dockerfile and how to build images and run containers based on dockerfile. Downloading images from docker hub repository and pushing images were explored and demonstrated.







