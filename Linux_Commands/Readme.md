# Linux Basic Commands
The project is to demonstrate how to use commands to execute task in the terminal. The tasks demonstrated include navigating through the various directories and working with files directories.

## Establishing Connection
Connection to the remote server was established through SSH

![image](https://github.com/user-attachments/assets/4e9924ce-5a67-428a-b224-c6d3d7ecd6ea)

## Working with Directories

The command **mkdir** was used to create directory. The first directory to be created in the root directory. The command **mkdir /root/example** was used to create the file but it failed due to permission denied error. To mitigate that, the following command was used instead **sudo mkdir /root/example**. It was successfully created.

![image](https://github.com/user-attachments/assets/76a60242-c7df-4137-9937-df41a9dd7c3b)

The created folder was varified using the **ls /root** command

![image](https://github.com/user-attachments/assets/a6b8f141-e6ca-4dba-82b7-ddc736aa22ce)

## Navigation and Directory Structure

To know the present location of a user, the command **pwd** was used

![image](https://github.com/user-attachments/assets/3b3ef1ec-85ad-44c9-b3fd-32dfa848f677)

The **cd** command was employed for navigating through the directory structure. 

![image](https://github.com/user-attachments/assets/d93d516c-766e-4cc5-b526-25a5ba5cf7fa)

The following commands: **cd /** amd **pwd** were used to access the root directory to confirm the present location

![image](https://github.com/user-attachments/assets/260a4368-6397-40a4-8940-9f653ecb6ed4)

List storage command **ls -l** was used 

![image](https://github.com/user-attachments/assets/fc94c1f8-a4b1-4df7-8a54-91a937e3e728)

Navigating to the /usr directory using the **sudo cd /usr** and creating and a directory named "photos" using **sudo mkdir photos** 
sudo which meanns "super user do" was necessary to be able to execute task with as an elevated user - the root privilege.

![image](https://github.com/user-attachments/assets/1a338e87-1faa-477f-ae72-ef838c65f232)

**cd photos** was used to navigate into the directory. Then, three random directories or folders were created in the newly created *photos* directory with the command: **sudo mkdir folder1 folder2 folder3** The **ls** command was used to list the content of the dictory in order to verify that the folders were created

![image](https://github.com/user-attachments/assets/2a854cbd-9db1-4285-bede-268e3f464a09)

Navigating to the first directory in the folder directory. With **cd folder1**, it was possible to enter the folder1 directory. **pwd** was used to reveale the full path to the folder1 directory (/usr/photos/folder1).

![image](https://github.com/user-attachments/assets/584b4742-913f-400d-a30f-38c102da76ed)

### The *ls* command

To list the content of /bin directory, the command: **ls /bin**

![image](https://github.com/user-attachments/assets/66ea7223-24cb-49f3-b452-43766022eb10)

To list the content of /etc directory, the command: **ls /etc**

![image](https://github.com/user-attachments/assets/c5c8fbff-55bc-4feb-8527-79409a8e6d7d)

To list the content of /home directory, the command: **ls /home**

![image](https://github.com/user-attachments/assets/7874299a-3de7-496f-9483-f42e1c1244c8)

To list the content of /usr directory, the command: **ls /usr**

![image](https://github.com/user-attachments/assets/14612dd2-5a06-4e4c-9ea1-2d79b1fe71f9)

To list the content of /var directory, the command: **ls /var**

![image](https://github.com/user-attachments/assets/1b6863b1-6bde-4125-9e63-668e9a0a8620)


### The *ls* command with flags

The **ls** command which is used to display files and directories can be used with different flags in order to accomplish various tasks.
**ls -R** was used to recursely list the content of a directory
**ls -a** was used to display hidden files in a directory in addition to the visible ones.
**ls -lh** flag combination that makes it possible to see a detailed long list of a content in a human readable format like MB, GB and TB.

![image](https://github.com/user-attachments/assets/c9a3d645-e3da-4c30-9b1f-930915b7d2f2)

### The *cat* command

The **cat** command, a short form of concatenate, is used to read, list and display the content of a file to the standard output.
It was used to display the content of the Os-release file in the /etc directory using the command **cat /etc/os-release**

![image](https://github.com/user-attachments/assets/784ea977-d1f0-4da3-a1ae-223da71b7873)

## Working with files

### The *touch* command

The *touch* command is used for file creation.
**touch /home/ubuntu/Documents web.html** was used to create a file with the name *web.html* in the /home/ubuntu/Documents directory. The *ls* command was used to confirm that the file was created. 

![image](https://github.com/user-attachments/assets/02315d30-02cc-4587-8aca-3f05c9087493)

While in the */home/ubuntu/Documents directory, multiple files were created with the command: **touch file1.txt file2.txt file3.txt**

![image](https://github.com/user-attachments/assets/88c55595-602a-4326-8003-88ccb02bc9c5)


### The *cp* command. 

The *cp* command is used to copy files and directories and their contents.
Using **cd /home/ubuntu/Documents and ls**, the Docucuments directory was accessed and content was listed. It contains a file with the name *web.html* The command **cp /home/ubuntu/Desktop** was used to copy the file to the *Desktop* directory. Again, the **ls** command was used to verify that the file was successfully copied.

![image](https://github.com/user-attachments/assets/363fbdd0-5087-412b-bfe5-283dd9a06a6d)

To recursively copy a directory and its content into another directory, the *-R* flag is combined with the touch command. for example, to copy a directory named project1 and its content to another directory with the name all_project, the following command was used: **cp -R project1 all_project**

![image](https://github.com/user-attachments/assets/c7a3df57-9b4c-44eb-8196-da1badf4042f)

### The *mv* command

The *mv* is used to move a file or folder from one location to the other by indicating the source and destination paths. It can also be used to rename a file.
To move a file with the name file2.txt in the /home/ubuntu/Documents directory to /home/ubuntu/Desktop directory, the cd command was first used to navigate to the Documents directory, then the following command was executed: **mv file2.txt /home/ubuntu/Desktop**. the move was verified by using the ls command at both the source and destination respectively. 

![image](https://github.com/user-attachments/assets/feed55b8-a85f-4278-a800-1dd51d83a4c1)

The file with the name "file6.txt" was renamed to "note.txt" by using the command: **mv file6.txt note.txt**. It should be noted that the file will be renamed in the same directory.

![image](https://github.com/user-attachments/assets/e31f4f0e-f036-42d7-9c16-dc2a195e9550)


### The *rm* command

The *rm* command is used to remove a file or folder. It can be combined with the different flags in order to perform variety of tasks or get different results.
A file with the name *note.txt* was removed using **rm note.txt**
A file with the name file1.txt was interactively removed by adding the flag *-i* to the *rm* command. the command used was **rm -i file1.txt**.
The flag *-f*, which denotes force remove, is added to the rm command to remove a file without confirmation. **rm -f file3.txt** was used to force remove file3.txt

![image](https://github.com/user-attachments/assets/32e4a5b8-7ad0-404f-bb99-890c94151b2f)

The flag *-r* is added to the *rm* command to recursively remove a folder and it's content. The directory Desktop was removed using the command **rm -r Desktop**.

![image](https://github.com/user-attachments/assets/39cb3cea-f58b-442f-b92f-27e21dd5349c)

### The find command
The *find* command is used to search for files and directories based on various criteria within a particular directory. for example, to find the file with the name *note.txt* in the home directory, the following command was used with the "name" criteria: **find /home -name note.txt**

![image](https://github.com/user-attachments/assets/bce2bcdf-d90e-4650-94eb-4ecd4269540b)

## Conclusion
The usage of various basic linux commands was demonstrated during the project. The directory structure and navigation was thoroughly explored. Various ways to work with and manage files and directories were demonstrated.






























 




