# Advanced Linux Commands

## Introduction
The project introduces some required linux commands to perform server administrative and management tasks. Tasks to be demonstrated include: files and directory permission, user access and privileges  management.

## File Permission
A file named "script.sh" was created using the command **touch script.sh** in the location */home/Documents*. The operation was confirmed woth the **ls** command

![image](https://github.com/user-attachments/assets/75702660-9894-43e9-bde3-8a2a603dc71d)

The permission on the newly created file was checked with the command: **ls -latr**. Read and write permissions are available for the file *owner* and *group* while only read permission is available for the *others*

![image](https://github.com/user-attachments/assets/4141efd0-86c1-42fd-944b-af8853a99789)

The current permission on the script.sh file was updated to grant everybody the *execute* permission. The command for the task was **chmod +x script.sh**. The action was again confirmed with the **ls -latr** command. The owner, group owner and others now have the "execute" permission on the file.

![image](https://github.com/user-attachments/assets/dfe10aa7-e293-4f82-89b1-edeab51400cc)

## Superuser Privilege
Any user with the superuser privilege can perform tasks like the root user. To gain temporary access like as a superuser(root user), the command **sudo(super user do)** is used to preceed such tasks. But to switch to the root, the command **sudo -i** is used, and to return to the normal user, simply enter *exit* in the terminal

![image](https://github.com/user-attachments/assets/bca8d0db-f97c-4268-be2b-03a44be0490e)

## User Management

User management has to do with creating users and granting them the required access.
To create a user with the name johndoe, the command: **sudo adduser johndoe**

![image](https://github.com/user-attachments/assets/4ac62332-80b5-4c69-83e6-c8e9d33f1a8c)

After logout, the new user's account was logged into successfully.

![image](https://github.com/user-attachments/assets/a265b9f8-96dc-4908-b7a1-9eb7c9e9897b)

![image](https://github.com/user-attachments/assets/5457ece6-98f9-4bf4-b8b4-562ac27d5b57)

Johndoe's home directory was accessed with: **cd /home** and **cd johndoe** and **pwd** for confirmation

![image](https://github.com/user-attachments/assets/cfde6f58-3d91-404f-8847-c459ebd40133)

## Administrative privileges

Newly created users like johndoe are not granted superuser privileges by default. A new user would have to be added to the **sudo group** in order to enjoy administrative privileges.
To add johndoe to the sudo group, the command: **sudo  usermod -aG sudo johndoe**. Now, Johndoe can run the *sudo* command with administrative privileges.

![image](https://github.com/user-attachments/assets/38bd7f56-df5a-402a-a5bb-bf2ecdb4ce92)

Johndoe switches to another user with the command: **su folu**

![image](https://github.com/user-attachments/assets/9bc1947f-5570-491e-a738-bc81ff61b7c2)

The password for johndoe was changed with the command: **sudo passwd johndoe**. A Prompt to enter the password and validating it was completed and the operation was successfuly performed. The updated password was tested by login out and login in with the new password.

![image](https://github.com/user-attachments/assets/345b1994-b611-4a00-b0fe-1eae5079d160)

## Creating a Group
 A group named "developers" was created with the command: **sudo groupadd developers**.

 ![image](https://github.com/user-attachments/assets/a80e4e2e-e0f5-4429-be41-c0590bf1c4d6)

 johndoe was added to the newly created group with the command: **sudo usermod -aG developers 














