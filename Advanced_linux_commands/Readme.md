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

## Creating a Group, adding a member and deleting a user
 A group named "developers" was created with the command: **sudo groupadd developers**.

 ![image](https://github.com/user-attachments/assets/a80e4e2e-e0f5-4429-be41-c0590bf1c4d6)

 johndoe was added to the developers group with the command: **sudo usermod -aG developers. Johndoe's group membership was verified with the **id johndoe** command 

 ![image](https://github.com/user-attachments/assets/8b146559-3fbe-4deb-b93c-eb6f42173420)

 The user johndoe was deleted using the command **sudo userdel johndoe** and the deletion was confirmed with **id johndoe** which returned "No such user".

 ![image](https://github.com/user-attachments/assets/7480a94f-fdb8-49db-a769-26b48380e1f0)

 ## Side Hustle Task 3

 A group with the name "devops" was created with **sudo groupadd devops**  and verified using **getent group devops**.
 
 ![image](https://github.com/user-attachments/assets/d7fe14de-6d4d-42e6-a71c-abad55842bdd)

 Five users were created with the following command:
 - **sudo adduser mary**
 - **sudo adduser mohammed**
 - **sudo adduser ravi**
 - **sudo adduser tunji**
 - **sudo adduser sofia**
The multiple users created was verified with the command **tail /etc/passwd**

![image](https://github.com/user-attachments/assets/aebe67d5-6fc0-4bf2-8ee1-001e9010cae5)

Each of the user was added to the devops group with the command:

- **sudo usermod -aG devops mary**
- **sudo usermod -aG devops mohammed**
- **sudo usermod -aG devops ravi**
- **sudo usermod -aG devops tunji**
- **sudo usermod -aG devops sofia**

![image](https://github.com/user-attachments/assets/41bbe754-6fc2-411c-940d-d65bd1e777e3)

### Mary

1. Mary's account was switched to by using **su mary**.
2. A directory named folder_mary was created in her home directory(*/home/mary*).
3. The current permission and group ownership on the directory was checked with the command **ls -la**.
4. The group ownership of the directory was changed with the command: **sudo chown /home/mary/folder_mary**.
5. Read and write permissions were granted to the group with the command: **sudo chmod g+rw /home/mary/folder_mary**.

![image](https://github.com/user-attachments/assets/337d896b-fd1c-4179-a1ab-833a7bd816f3)

![image](https://github.com/user-attachments/assets/a293aa77-2e99-4a3a-b418-f0eb9f7d4640)

### Mohammed

1. Mary's account was switched to by using **su mohammed**.
2. A directory named folder_mary was created in her home directory(*/home/mohammed*).
3. The current permission and group ownership on the directory was checked with the command **ls -la**.
4. The group ownership of the directory was changed with the command: **sudo chown /home/mohammed/folder_mohammed**.
5. Read and write permissions were granted to the group with the command: **sudo chmod g+rw /home/mohammed/folder_mohammed**.

![image](https://github.com/user-attachments/assets/19a831e7-845d-4267-8085-6d92042bffd2)


### ravi

1. Mary's account was switched to by using **su ravi**.
2. A directory named folder_mary was created in her home directory(*/home/ravi*).
3. The current permission and group ownership on the directory was checked with the command **ls -la**.
4. The group ownership of the directory was changed with the command: **sudo chown /home/ravi/folder_ravi**.
5. Read and write permissions were granted to the group with the command: **sudo chmod g+rw /home/ravi/folder_ravi**.

![image](https://github.com/user-attachments/assets/328f8d02-58ed-4503-a995-13e68d835375)


### tunji

1. Mary's account was switched to by using **su tunji**.
2. A directory named folder_mary was created in her home directory(*/home/tunji*).
3. The current permission and group ownership on the directory was checked with the command **ls -la**.
4. The group ownership of the directory was changed with the command: **sudo chown /home/tunji/folder_tunji**.
5. Read and write permissions were granted to the group with the command: **sudo chmod g+rw /home/tunji/folder_tunji**.

   ![image](https://github.com/user-attachments/assets/f753dd8c-acba-4019-a17c-333c907aaea8)


### sofia

1. Mary's account was switched to by using **su sofia**.
2. A directory named folder_mary was created in her home directory(*/home/sofia*).
3. The current permission and group ownership on the directory was checked with the command **ls -la**.
4. The group ownership of the directory was changed with the command: **sudo chown /home/sofia/folder_sofia**.
5. Read and write permissions were granted to the group with the command: **sudo chmod g+rw /home/sofia/folder_sofia**.

   ![image](https://github.com/user-attachments/assets/6d63d427-18f8-44ae-8ea6-91863eaa4818)


   ## Conclusion
   
   The project help to demonstrate the server administrator's routine tasks. File permission, user account creation and user management, administrative privileges were some of the tasks performed during the project execution.    









 















