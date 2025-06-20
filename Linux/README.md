# SSH Connection to Linux Remote Server on AWS

## AWS Account
Personalized AWS account was logged into. see the management console below

![image](https://github.com/user-attachments/assets/aaf9a301-ebf7-4af9-acda-12bdccb156f5)

## EC2 Instance

An EC2 instance was created. Ubuntu sever t2.micro was selected.

![image](https://github.com/user-attachments/assets/6e018162-29a4-4f55-8a03-2725dff150df)

The server was successfully created and running

![image](https://github.com/user-attachments/assets/7870ccf4-a0d0-4588-b507-a1dcea9618bd)

The public key was created and downloaded to a local folder.

![image](https://github.com/user-attachments/assets/c8602455-08d5-4bc5-b6b1-3d95fbc4094c)

The instance ID and public IP address were noted as shown. 

![image](https://github.com/user-attachments/assets/1f36042a-05d4-4a26-b68c-6832eba7ae75)

## Remote Connection to the Server

To establish a remote connection to the server from a windows system, MobaXterm was launched. See MobaXterm interface below:

![image](https://github.com/user-attachments/assets/7246e19c-4795-4ff9-9f5a-8dc54c10b971)

The directory containing the public key was switched to from MobaXterm terminal by using the command: **cd "directory name"** and ls to list the content of the directory.

![image](https://github.com/user-attachments/assets/3dc833a3-cc49-4950-a533-410537ff6130)

Connection to the remote server was initiated and established by running the command: SSH -i "key.pem" ubuntu@public ip address

![image](https://github.com/user-attachments/assets/9d61205f-403c-43a1-9396-04ef9d23f8c2)

The image below shows the welcome page of the server after a successful connection was established through SSH and the public key

![image](https://github.com/user-attachments/assets/c45eb698-6778-4aaf-8be4-b83038cd2a74)

## Excecuting Commands

The package was first updated by using the command: **sudo apt update**

![image](https://github.com/user-attachments/assets/6305bfdd-41cd-48a4-829b-b08dcce0858f)

The **ls /** was also executed to see the directories at the root level

![image](https://github.com/user-attachments/assets/2335ae90-f845-45fb-8873-2d593bd5e803)

The tree command was installed by using **sudo apt install tree**

![image](https://github.com/user-attachments/assets/a72d40bf-f7b3-4a03-85a9-d32fc8db4d48)

The following "tree" command was run: **tree / -L 1**

![image](https://github.com/user-attachments/assets/aa3ee74c-fc11-4a06-97b9-fb1c4d66f64b)

Nginx was installed using the command **sudo apt install nginx**

![image](https://github.com/user-attachments/assets/a1960c1b-bd2b-4a8f-8606-a114721ac78f)

Nginx version was confirmed with the command: **nginx -v**

![image](https://github.com/user-attachments/assets/04ce8f23-856c-43b1-b80f-cfeef9501db7)

A user was added with the command **sudo adduser folu**

![image](https://github.com/user-attachments/assets/8edf1e56-c259-45fb-a95a-098bc9a88697)

The installed "tree" was removed by using **sudo apt remove tree**

![image](https://github.com/user-attachments/assets/e4035ead-6c0f-437c-9209-1d4f72bbc0d6)

## Instance Termination

The instance was terminated after the exercise.

![image](https://github.com/user-attachments/assets/510380d6-5f79-4738-a159-5214715421b4)

## Conclusion

The task demonstrated how to connect to a remote server using SSH. It also provided opportunity to run Linux basic commands as well as package installation.





















