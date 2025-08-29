# Jenkins Pipeline Job

Pipelines are Jenkins jobs enabled by the Pipeline plugin and built with simple text scripts that use a Pipeline DSL (domain-specific language) based on the Groovy programming language. Hence, users can define continuous delivery pipelines "as code." Jenkins offers two primary types of pipeline syntax for defining continuous delivery workflows:

**Declarative Pipeline:**

The syntax uses a Domain-Specific Language (DSL) based on Groovy, designed to be intuitive and more readable. Declarative Pipelines are defined inside a pipeline block and are less verbose than Scripted Pipelines. It uses a structured syntax, making it easier to read and write, especially for those new to Jenkins pipelines. It emphasizes a clear, hierarchical structure with predefined sections like agent, stages, steps, and post. Declarative pipelines are defined within a pipeline { ... } block in a Jenkinsfile.

**Scripted Pipeline:**

The Scripted Pipeline is based on the Groovy scripting language. It offers greater flexibility and control over the pipeline logic. However, it requires a better understanding of Groovy scripting for the implementation of the complex code. Scripted pipelines are typically defined within a node { ... } block in a Jenkinsfile.

## Creating A Pipeline Job

+ On the Jenkins dashboard, `New Item` was selected in the left menu to create a new pipeline job
+ A name `My pipelie job` was given and pipeline project was selected and the `OK` button was clicked.

  <img width="1366" height="648" alt="image" src="https://github.com/user-attachments/assets/1465b9f3-0fcb-4ee3-a7f3-110d7416103b" />

+ On the configuration page, the check box preceeding `GitHub hook trigger for GITScm Polling` was checked.

  <img width="1247" height="656" alt="image" src="https://github.com/user-attachments/assets/af4136e8-5f5e-4d4d-8f96-de0545ca636c" />

+ The selection was applied and saved.


## Writing Jenkins Pipeline Script

The script below was provided for the implememtation

<img width="1364" height="643" alt="image" src="https://github.com/user-attachments/assets/0b626ff7-fecc-4986-b336-877896f67f68" />


### Script Analysis

-  **Agent Configuration:** The agent in the script was configured as `agent any` which means that the pipeline can run on any available agent
-   **Stages:** Defines the various stages of the pipeline.
-    **Stage 1 (Connects To Github):** This stage involeves a step to check out code from the specified Git repository `https://github.com/f-oni/jenkins-scm.git'. The main branch was also specified in the stage
-  **Stage 2 (Build Docker Image):**  The stage 2 builds a docker image named 'dockerfile' using the source code obtained from GtHub repository. The shell ('sh') was used to run the **'docker build'** command.
- **Stage 3 stage ('Run Docker Container'):** The stage 3 runs a docker container named **nginx** in detached mode **('-itd')** and the container is mapped to port 8081 on the host machine. The image used to run the container was the one built in stage 2.

 ### Generating Syntax for Stage 1
 
 To generate syntax for the github repository to be used in stage 1, the `pipeline syntax` button was clicked. 
 
+ `Checkout: Checkout from version control` was selected from the drop down.

  <img width="1348" height="733" alt="image" src="https://github.com/user-attachments/assets/57202777-9cfc-43e0-9fa9-1d4a383a6e8d" />

+ The github repository url was provided and the main branch was specified.

  <img width="1366" height="657" alt="image" src="https://github.com/user-attachments/assets/67022a09-5907-4ed9-b0d7-0d341ef3423e" />

+ Finaly, `Generate pipeline script` button was clicked to provide the syntax.

  <img width="1364" height="645" alt="image" src="https://github.com/user-attachments/assets/bf4f5e4c-97bb-41d7-9ef1-9485e661bc9d" />

+ The generated syntax was copied and pasted in the appropriate space in stage 1.

  <img width="1362" height="637" alt="image" src="https://github.com/user-attachments/assets/906837c4-bb8a-4a3b-b6ea-ae0049f169a9" />


## Docker Installation

For Jenkins to run docker commands, docker must be installed on the server. 

The installation was done with the script below:

```
 sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl status docker

```


+ The file was made executable with the command `chmod u+x docker.sh`
+ The script was executed with the command `./docker.sh`

## Pipeline Scripts

Two files were provided in the repository named `jenkins-scm`. The files are

- dockerfile
- index.html


  The content of the dockerfile is shown below:

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


  The index.html file contains the following text as shown

  `Congratulations, You have successfully run your first pipeline code.`

  ## Pipeline job implementation
  
  The two files were committed to the repository and a build was triggered by the webhook. The pipeline ran successfuly
  

  <img width="1366" height="611" alt="image" src="https://github.com/user-attachments/assets/a5e8a29d-9a88-4b7a-bb06-5cd5dde78783" />


  <img width="1356" height="631" alt="image" src="https://github.com/user-attachments/assets/33e685e3-6809-4a2f-9183-67776a5a8b55" />
  

  <img width="1366" height="642" alt="image" src="https://github.com/user-attachments/assets/41f51365-dc76-422b-a8e4-c17cf8bb9a25" />



  
  ## Verification:
  
- A rule was added to the inbound rule of the ec2 instance running Jenkins server to allow traffic on port 4041 as port 8081 was already assigned.

  <img width="797" height="326" alt="image" src="https://github.com/user-attachments/assets/616aa65f-98af-4851-a8c4-a61e35f181b9" />

  
- The content of the index.html was access on the browser using `http://16.171.55.48:4041`. The page was successfully rendered.

  <img width="1342" height="546" alt="image" src="https://github.com/user-attachments/assets/6012f67e-3475-424c-bebd-e4d0a17ace4b" />


  

  ## Project Challenges

 1. The build did not proceed in the `my pipeline job` project after the first commit because the previous project was still connected to the webhook.
    
    **Remediation:** The other project connected to the webhook was disconnected and that solved the problem
    
3. The port 8081 that was specified in the script was already allocated. The script returned with `error 125`

    <img width="1354" height="661" alt="image" src="https://github.com/user-attachments/assets/dfab1737-e2c3-45ba-8ccf-c4352de34c3b" />

    **Remediation** The script was updated with port 4041 instaead of port 8081 that was allocated. That also provided the needed solution as the scritp ran without any errors

     <img width="1354" height="661" alt="image" src="https://github.com/user-attachments/assets/4b8854d9-4da3-41f9-b2cb-a9cb4e23d831" />



  ## Conclusion
  The project successfully demonstrated how to use Jenkins pipeline to implement Continuous integration and continuous delivery. The pipeline script automated CICD process.
