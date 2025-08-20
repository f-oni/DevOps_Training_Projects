# WordPress Site on AWS

A project to deploy a high-performance WordPress-based website that is scalable, secure and cost-effective using aws cloud resources. A fictitious company named `DigitalBoost` was introduced as a medium-sized marketing agency in the project.

## Objective

The project is meant to demonstrate how to utilize networking, compute, object storage and databases infrastructure provisioning on AWS cloud to host a WordPress site that is scalable, secrure and cost effective. AWS cloud resources will be provisioned in different availability zones to ensure that the site is highly available. Load balancer is leveraged upon for effective traffic distribution while auto scaling feature will be utilized for efficient scalability. Subnets and security groups will be used to enhance security by controlling access to the resources.

## Project Overview 

+ A virtual private cloud(VPC) with public and private subnets in two different availability zones.
+ Four subnets will be created. That is, two in each of the availability zones.
+ The public subnets will be associated with a public route table which provides route to the internet through an internet gateway
while the private subnets will be associated with a private route table which provides outbound route to the internet through a NAT gateway.
+ Six security groups were created will be created to control access to individual resources placed in different subnets.
+ Amazon Elastic File System (EFS) will be used as a shared storage location for the web servers.
+ MYSQL will be deployed as the Amazon Relational Database Service (Amazon RDS) engine
+ Bastion host will be created to provide access to the resources in the private subnets


## Project Implementation

The steps for the project implementation are outlined below:

1. Script development
2. Cloud infrastructure Provisioning
3. Bootstrapping
4. Auto Scaling Group
5. Simulating Auto Scaling
6. DNS and SSL Consideration

### Step 1: Script Development

A BASH script `wordpress.sh` was developed to perform the following tasks:

- Update the operating system
- Create an installation directory `/var/www/html` and mount efs.
- Install the requirements and dependencies for wordpress installation. The stack include:
  Apache, MYSQL client and PHP.
- Provide the neccessary permissions for the directory.
- Download wordpress files, extract and copy to /var/www/html.
- Create the wp-config.php file.

The script is shown below:

```

#!/bin/bash

#1. Up date package and create the html directory

sudo yum update -y
sudo mkdir -p /var/www/html

# Mount the efs to the directory
sudo yum install -y amazon-efs-utils
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-005732f3b0a52f925.efs.eu-north-1.amazonaws.com:/ /var/www/html



#2. install apache 
sudo yum install git httpd -y

#3. Install php 8 and dependencies

sudo yum install -y php php-common php-cli php-cgi php-curl php-gd php-intl php-zip php-mbstring php-xml php-json php-fpm php-mysqlnd php-gettext php-bcmath php-ctype php-fileinfo php-openssl php-pdo php-tokenizer
 
#4. Install Mysql client

sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
sudo dnf repolist enabled | grep "mysql.*-community.*"
sudo dnf install -y mysql-community-server

#5. Start and enable Apache and mysql server

sudo systemctl start httpd
sudo systemctl enable httpd 
sudo systemctl start mysqld
sudo systemctl enable mysqld


#6. set directory permissions
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
sudo find /var/www -type f -exec sudo chmod 0664 {} \;
sudo chown apache:apache -R /var/www/html 

#7. Download wordpress files, extract and copy to /var/www/html

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/


#8. create the wp-config.php file
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
```

A second second script with the name wordpress-userdata.sh was also created. The script is meant for the launch template userdata. It performs most of the task covered in the `wordpress.sh` script except for the installation directory creation and wordpress download. The following tasks were built into the script:

- Update the operating system.
- Install the requirements and dependencies for wordpress installation. The stack include:
  Apache, MYSQL client and PHP.
- Mount the efs to the html directory
- Provides the neccessary permissions for the directory.

The userdata script is shown below:

```
#!/bin/bash

#1. Update the software
sudo yum update -y


#2. install apache web server 
sudo yum install -y httpd 
sudo systemctl enable httpd 
sudo systemctl start httpd


#3. install php 8

sudo yum install -y php php-common php-cli php-cgi php-curl php-gd php-intl php-zip php-mbstring php-xml php-json php-fpm php-mysqlnd php-gettext php-bcmath php-ctype php-fileinfo php-openssl php-pdo php-tokenizer
 
#4, Install Mysql client

sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
sudo dnf repolist enabled | grep "mysql.*-community.*"
sudo dnf install -y mysql-community-server

# Start and enable mysql server

sudo systemctl start mysql
sudo systemctl enable mysql

# Mount the efs to the html directory

echo "fs-005732f3b0a52f925.efs.eu-north-1.amazonaws.com:/ /var/www/html nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" | sudo tee -a /etc/fstab
sudo mount -a

# Set Permissions
sudo chown apache:apache -R /var/www/html
sudo chmod 755 -R /var/www/html

# Restart the webserver
sudo systemctl restart httpd
sudo systemctl restart php-fpm

```

### Step 2: Cloud Infrastructure Provisioning

A custum VPC and associted general resources were first provisioned. Subsequently,  the resources for the public and private subnets were created respectively. 

#### VPC and General Resources

+ A custom VPC named `wp-vpc-01` to provide an isolated environment for resource deployment was created with `CIDR` block `10.0.0.0/16`.

  <img width="1026" height="552" alt="image" src="https://github.com/user-attachments/assets/e8254197-78c8-4778-950a-e5802638b432" />

+ Internet gateway with the name `wp-internet-gw` was created and attached to the VPC

  <img width="1357" height="531" alt="image" src="https://github.com/user-attachments/assets/3dc126dd-3bd5-465b-ba9f-1726a647eb8a" />

+ A public route table was created and named `wp-public-rt`.The two public subnets were associated with it and route from anywhere on the internet (0.0.0.0/0) through the internet gateway.

<img width="1361" height="570" alt="image" src="https://github.com/user-attachments/assets/12455ad2-76e0-474d-baba-bd417040181e" />


<img width="1334" height="446" alt="image" src="https://github.com/user-attachments/assets/03177774-e9d4-4c18-ac65-532be9177e32" />

+ NAT gateway was created with the name `wp-nat-gw`. The two private subnets were associated with a private route table which provides outbound route through the NAT gateway.

<img width="1124" height="510" alt="image" src="https://github.com/user-attachments/assets/1d0f0fc5-33ca-4c50-bfa9-f6f8d8b04d44" />



#### Subnets Setup

The following subnets were created in the two availability zones selected from eu-north-1a and eu-north-1b:

- wp-public-subnet-1a with `CIDR` block `10.0.1.0/24`
- wp-public-subnet-1b with `CIDR` block `10.0.3.0/24`
- wp-private-subnet-1a with `CIDR` block `10.0.5.0/24`
- wp-private-subnet-1a with `CIDR` block `10.0.7.0/24`

#### Security groups configuration

The following security groups were set up for the individual and group of resources to be deployed:

1. `wp-alb-sg` for the application load balancer. Port 80 and 443 traffic were allowed from anywhere.
2. `wp-ssh-sg` for resources that require SSH connection. Port 22 was allowed from within the VPC.
3. `Bastion-sg` for the bastion host. Port 22 was allowed from anywhere.
4. `webserver-sg` for the ec2 instances in the private subnets. traffic was allowed from the application load balancer(ports 80 and 443), bastion host(port 22) and `wp-ssh-sg`.
5. `wp-database-sg` for the RDS engine. Traffic was allowed from the webserver security group on Port 3306.
6. `wp-efs-sg` for the elastic file system. `NFS` traffic was allowed from the webserver security group on Port 2049 as well as SSH on port 22 from within the VPC.


#### Public Subnet Resources

The following resources were created in the public subnet

1. Bastion host
2. Application load balancer(ALB)
3. NAT gateway

   **Bastion Host:** is a "jump server" that allows a secure connection to private resources from the internet. It is a special-purpose EC2 instance located in a public subnet that acts as a secure gateway to access other instances within a private subnet. A `t3micro` ec2 instance named `bastion-host-wp` was created in the public subnet for this purpose. The `Bastion-sg` security group was attached to it.

 <img width="889" height="503" alt="image" src="https://github.com/user-attachments/assets/2d3173be-b2a9-4a8b-b368-d58d4a2df5ea" />
 

 <img width="916" height="572" alt="image" src="https://github.com/user-attachments/assets/761a70f3-7b1a-4451-a0c3-d70ece5bd321" />



   **Application load balancer(ALB):** Application load balancer named `wp-alb-01` meant to distribute incoming HTTP and HTTPS traffic across multiple Amazon EC2 instances that would be provisioned as webservers was created in the two public subnets of the two availability zones. `Internet facing` was selected in the scheme section. 

   <img width="1096" height="507" alt="image" src="https://github.com/user-attachments/assets/999c8152-ccb2-465e-99f4-9b0d3dc81013" />

A target group with the name `wp-tg-01` was created and selected for the application load balancer.
The two public subnets in availability zones of eu-north-1a and eu-north-1b were selected for the availability zone and `wp-alb-sg` was selected for the security group. 

<img width="1354" height="543" alt="image" src="https://github.com/user-attachments/assets/1b38185e-f505-4a36-9091-1241fd34f4ed" />


   **NAT gateway:** Network Address Translation (NAT) allows instances in private subnets of an AWS Virtual Private Cloud (VPC) to connect to the internet or other AWS services while preventing unsolicited inbound connections from the internet while at the same time, preventing the internet from initiating connections with those instances. The NAT gateway was created with the name `wp-nat-gw` and the two private subnets were associated with the private route table.

  <img width="1124" height="510" alt="image" src="https://github.com/user-attachments/assets/48a4abc8-8ded-427a-856c-99d2b2b38539" />

  <img width="1335" height="390" alt="image" src="https://github.com/user-attachments/assets/158609d0-5be5-4ea0-9d23-e502c9a7c016" />



#### Private Subnet Resources

The following resources were created in the private subnet

1. EC2 instance for bootstrapping.
2. RDS engine for the database.
3. Elastic file system (EFS) to provide shared storage for the webservers

   **EC2 instance for bootstrapping:** An EC2 instance named `websever-01` was launched in one of the private subnets. The instance was provisioned without a public IP address. The `webserver-sg` security group was attached to it.

   <img width="903" height="561" alt="image" src="https://github.com/user-attachments/assets/caeb3a32-02e1-400e-ba14-fdcbce5b895a" />

   <img width="939" height="556" alt="image" src="https://github.com/user-attachments/assets/8c82a9a6-386a-4138-996c-632a5b8dbeee" />


   
   **RDS engine for the database:**
- The database engine provisioned for the project was MYSQL.
- The `database subnet group` with the name `wp-db-subnet-group` was first created as a prerequisite.

<img width="1320" height="554" alt="image" src="https://github.com/user-attachments/assets/afa3d0db-e794-403a-b636-8bbdbc05f649" />

- The two availability zones as well as the two private subnets in those availability zones were added to the database subnet group.

  <img width="1331" height="556" alt="image" src="https://github.com/user-attachments/assets/b8e79f26-4f45-46a7-aafd-8a3e3ed74a49" />

- MYSQL `stardard create` method was selected and the name `database-1` was given as the instance idnetifier.

  <img width="1352" height="551" alt="image" src="https://github.com/user-attachments/assets/21af7485-c2ff-46e2-9d65-6dcfab38fdb7" />

- The `master username` and `master password` were provided respectively.

<img width="1354" height="568" alt="image" src="https://github.com/user-attachments/assets/9c984524-472f-4bbd-a9f9-bb8234d3d1da" />

- The authentication method of password was chosen and the initial database name was provided as `wordpressdb`.

  <img width="1359" height="537" alt="image" src="https://github.com/user-attachments/assets/8ad5043a-b7bb-4627-aeae-bc483188460f" />

- `Defaultmysql 8.0` was selected in the `DB parameter group` section.

  <img width="1214" height="430" alt="image" src="https://github.com/user-attachments/assets/2350c796-e048-4b7b-86ff-8aba3001b8ed" />

- The create button was clicked to start the process of the data base creation.

  
   **Elastic file system (EFS):**
Elastic file system is a fully managed, scalable, and serverless file storage service for Amazon Web Services (AWS). It allows one to create and use file systems that can be accessed concurrently by multiple EC2 instances.<br>
 The chioce of EFS meets the project's storage and accessibility requirements.<br>
`wp-efs-01` was the name given to the EFS.

<img width="958" height="584" alt="image" src="https://github.com/user-attachments/assets/f04b1431-7a87-419c-9f5f-80eeefe368b8" />

 The two availability zones and the two private subnets in those availability zones were selected for the mount targets. The `wp-efs-sg` security group was attached to the EFS.

 <img width="978" height="560" alt="image" src="https://github.com/user-attachments/assets/0c15279d-c409-4f0f-b168-27700b811a8c" />


 <img width="1129" height="561" alt="image" src="https://github.com/user-attachments/assets/4981a22b-04ca-4207-8bf4-a4143cd0eb87" />



### Step 3:  Bootstrapping

For initial setup and configuration of the wordpress site, the steps below were followed:

1. Connecting to the webserver
2. Sript Preparation and Execution
3. Installation Verification
4. Wordpress file Configuration
5. Testing wordpress

#### Connecting to the webserver

The bootsrapping is to be done with the ec2 instance in the private subnet and by design, it can only be accessed through the bastion host. Hence, the bastion host was connected to through SSH using its public IP address. from the bastion host terminal, the webserver instance located in the private subnet was connected to through SSH using its private IP address.

<img width="1014" height="456" alt="image" src="https://github.com/user-attachments/assets/89be6e85-f5f9-429f-9aa6-7a55d7b14f57" />

After a successful connection, the NAT gateway route was first tested by using the command `sudo yum update` and the command was executed successfully. 

#### Sript Preparation and Execution

+ A script named `lamp.sh` which contains programs to install wordpress requirements and dependencies was developed on the server.
+ The execute permit command `sudo chmod +x lamp.sh` was run to enable execution of the file.
+ The script was executed with the command `./lamp.sh`.

<img width="865" height="358" alt="image" src="https://github.com/user-attachments/assets/230c3e75-eab5-4e5a-b50e-08a54ff398b4" />

+ The execution was successful.

The script is shown below:

<img width="1041" height="530" alt="image" src="https://github.com/user-attachments/assets/26e54a35-dfe4-4729-b1eb-1214388b3898" />


```
#!/bin/bash

#1. Up date package and create the html directory

sudo yum update -y
sudo mkdir -p /var/www/html

# Mount the efs to the directory
sudo yum install -y amazon-efs-utils
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-005732f3b0a52f925.efs.eu-north-1.amazonaws.com:/ /var/www/html



#2. install apache 
sudo yum install git httpd -y

#3. Install php 8 and dependencies

sudo yum install -y php php-common php-cli php-cgi php-curl php-gd php-intl php-zip php-mbstring php-xml php-json php-fpm php-mysqlnd php-gettext php-bcmath php-ctype php-fileinfo php-openssl php-pdo php-tokenizer
 
#4. Install Mysql client

sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
sudo dnf repolist enabled | grep "mysql.*-community.*"
sudo dnf install -y mysql-community-server

#5. Start and enable Apache and mysql server

sudo systemctl start httpd
sudo systemctl enable httpd 
sudo systemctl start mysqld
sudo systemctl enable mysqld


#6. set directory permissions
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
sudo find /var/www -type f -exec sudo chmod 0664 {} \;
sudo chown apache:apache -R /var/www/html 

#7. Download wordpress files, extract and copy to /var/www/html

wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo cp -r wordpress/* /var/www/html/


#8. create the wp-config.php file
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

```




#### Installation Verification

The success of the script was tested by confirming that that the EFS was mounted and the installation of the wordpress dependencies were successful. 
-  EFS mount point was confirmed with the command `df -h`.

<img width="928" height="335" alt="image" src="https://github.com/user-attachments/assets/111bc95e-0deb-416d-8e83-882953c4af77" />

-  PHP installation was confiremd with the command `php -v`.
-  MYSQL client installation was confiremd with the command `mysql --version`.
-  Apache installation was confiremd with the command `sudo systemctl status httpd`.

<img width="1014" height="556" alt="image" src="https://github.com/user-attachments/assets/0c6a374a-5d07-41c8-8551-760506816861" />

-  The wordpress files were downloaded and copied to the appropriate location (/var/www/html) as expected. This was verified using `cd /var/www/html and  the `ls` command.

  <img width="1072" height="198" alt="image" src="https://github.com/user-attachments/assets/2d7dcd41-532a-4efb-9f4a-c7ec2bd4e835" />


#### Wordpress file Configuration

The `wp-config.php` file was opened with vim for configuration. The following information from the database (MYSQL) were filed into the appropriate places in the config file.

```
'DB_NAME', 'wordpressdb'
'DB_USER', 'admin'
'DB_PASSWORD', 'mypassword'
'DB_HOST', 'RDS-database-endpoint(database-1.ct6igooyornm.eu-north-1.rds.amazonaws.com)'

```
The file was saved with `:wq` and apache was reloaded with the command `sudo systemctl relaod httpd`

<img width="1036" height="155" alt="image" src="https://github.com/user-attachments/assets/2574b788-2f1a-4b7d-aa49-aab5894534ac" />

#### Testing wordpress

- The DNS of the application load balancer was copied and pasted in the address bar of a browser tab. It successfully loaded the welcome and installation page of wordpress.

<img width="1158" height="618" alt="image" src="https://github.com/user-attachments/assets/a6c3e99c-8a92-4f50-85bd-f9d18dfc42c1" />

- A site title was given as `Digitalboost`.
- Username, password and email were provided as required and the install button was clicked to install wordpress.

<img width="818" height="632" alt="image" src="https://github.com/user-attachments/assets/588684f5-601a-4614-b7dd-5658156261a0" />

- The `success!` page was next displayed which showed the instance was able to connect with the database.

  <img width="844" height="426" alt="image" src="https://github.com/user-attachments/assets/244a55dd-1128-4a5e-bf8f-06a2b2cd23d4" />

- The login button was clicked to get to the wordpress dashboard.

  <img width="1366" height="635" alt="image" src="https://github.com/user-attachments/assets/7047ccba-7bb8-4f9c-a4d3-328ce39d810c" />


### Step 4: Auto Scaling Group

 Auto scaling group automatically manages the number of Amazon EC2 instances running an application. It ensures that an application maintains its availability and performance by scaling capacity up or down as needed, based on demand, while also helping to reduce costs.
 An ASG uses a launch template to define how new EC2 instances are created. This template specifies details such as the Amazon Machine Image (AMI), instance type, key pair, security groups, and user data. Therefore, as a matter of necessity, a `launch template` was first created before the auto scaling group creation was initiated. 
 
 #### Creating a Launch Template

 Launch template was selected on the side of the  EC2 instance dashboard. The `Create launch template` button was clicked to begin the process. The name `wp-launch-template` was provided. 

 <img width="855" height="477" alt="image" src="https://github.com/user-attachments/assets/b336f5e7-2f4b-4eef-afa4-4cd16e268d00" />

In the `AMI` section, `Amazon Linux` was selected and `t3.micro` was chosen as the instance type. The `webserver-sg` security group was attached to it.

<img width="868" height="529" alt="image" src="https://github.com/user-attachments/assets/edd6390e-d300-4e60-ba47-ecd7a0139060" />

The following lines of code were pasted in the `userdata` section. and the`Create Launch Template` button was clicked to complete the process.

<img width="778" height="511" alt="image" src="https://github.com/user-attachments/assets/4e6267a5-d838-4ec0-8248-9955361a3ed5" />

The userdata script is shown below:

```

#!/bin/bash

#1. Update the software
sudo yum update -y


#2. install apache web server 
sudo yum install -y httpd 
sudo systemctl enable httpd 
sudo systemctl start httpd


#3. install php 8

sudo yum install -y php php-common php-cli php-cgi php-curl php-gd php-intl php-zip php-mbstring php-xml php-json php-fpm php-mysqlnd php-gettext php-bcmath php-ctype php-fileinfo php-openssl php-pdo php-tokenizer
 
#4, Install Mysql client

sudo wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
sudo dnf repolist enabled | grep "mysql.*-community.*"
sudo dnf install -y mysql-community-server

# Start and enable mysql server

sudo systemctl start mysql
sudo systemctl enable mysql

# Mount the efs to the html directory

echo "fs-005732f3b0a52f925.efs.eu-north-1.amazonaws.com:/ /var/www/html nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" | sudo tee -a /etc/fstab
sudo mount -a

# Set Permissions
sudo chown apache:apache -R /var/www/html
sudo chmod 755 -R /var/www/html

# Restart the webserver
sudo systemctl restart httpd
sudo systemctl restart php-fpm

```


#### Creating Auto Scaling Group

`Auto Scaling Group` was selected on the side of the  EC2 instance dashboard. The `Create Auto Scaling Group` button was clicked to begin the process. The auto scaling group was named `wp-asg-01` and the launch template, `wp-launch-template` that was created in the previous section was selected.

<img width="1351" height="575" alt="image" src="https://github.com/user-attachments/assets/2b989b9e-46e1-4907-a4ae-93c876500227" />

In the network section, the custom VPC, and the two private subnets in the two availability zones were selected.

<img width="1348" height="544" alt="image" src="https://github.com/user-attachments/assets/a5f4ecce-c935-47ea-9e6b-66162ca22755" />

In the `load balancing` section, `attach to an existing load balancer` was selected and the target group `wp-tg-01` was equally chosen.

<img width="1344" height="526" alt="image" src="https://github.com/user-attachments/assets/fbe9b29d-e12d-4d6d-9baa-987593d6b057" />

`Turn on elastic load balancing health check` check box was checked. 

<img width="1162" height="479" alt="image" src="https://github.com/user-attachments/assets/27d32d4f-6600-428b-8c3c-45b29c358a1b" />

In the desired capacity type section, the desired capacity was set at `1`. under the scaling section, the minimum desired capacity was set to `1` while the maximum desired capacity was set at `3`. 

<img width="1323" height="540" alt="image" src="https://github.com/user-attachments/assets/83167d7c-b30f-44e0-aa0f-1421145a718e" />

Finaly, the `Create auto scaling group` button was clicked to complete the process.

#### Creating Scaling Policy
A dynamic scaling policy was created.<br>
The policy type selected was `Target tracking scaling` and the metric type was `average CPU utilization`.<br> 
A target value of 25 was set in order to demonstrate auto scaling as quickly as possible.

<img width="1321" height="511" alt="image" src="https://github.com/user-attachments/assets/929704e8-8733-4810-83a2-9c1b350518ac" />


### Step 5: Simulating Auto Scaling

To begin the simulation process, the ec2 instance used for the initial setup and configuration of the wordpress site was intentionally terminated and the page where the load balancer's DNS was loaded was refreshed. The wordpress dashboard was stil reachable! It worked.

<img width="1138" height="414" alt="image" src="https://github.com/user-attachments/assets/1ebd9427-ba40-4112-adbc-d25eefca4777" />


<img width="1299" height="545" alt="image" src="https://github.com/user-attachments/assets/e9cee23e-c24c-45a9-9dbd-2974bfce711a" />



#### Simulating the Scale-Out Feature

The folowing steps were taken to simulate the scale out feature of the auto scaling
- The load balancer's endpoint (DNS) was opened on many browser tabs to generate traffic.
- The only running instance was accessed through the bastion host and the `stress utility` program was installed with  the command `sudo yum install stress-ng`.
- To increase the CPU utilization, the cammand `stress-ng --cpu 4 --timeout 60s` was run. The outcome is shown below

  <img width="938" height="362" alt="image" src="https://github.com/user-attachments/assets/7ba35eb8-7fa8-429d-a5ce-f733298975da" />


  **Observations** After a few minutes, the second instance was automatically deployed and the lifecycle tab showed that both instances were `InService` and were present in the target group.

  <img width="1349" height="513" alt="image" src="https://github.com/user-attachments/assets/6ac40b8e-e9b6-445c-b171-10678619deac" />

- The CPU utilization for both instances were further increased with the stress utility command and opening up many more web pages of the wordpress dashboard of the digitalboost landing page.

  **Observations** It was further observed that a third instance was also automatically deployed by the auto scaling group.

  <img width="1352" height="515" alt="image" src="https://github.com/user-attachments/assets/b96f467a-58f7-48ba-91d4-05252e31995c" />

  After waiting for a considerable period of time, No additional instances were deployed because 3 was set as the desired maximum capacity.

  #### Simulating the Scale-In Feature
  
  The folowing steps were taken to simulate the scale in feature of the auto scaling
  
-  The opened stress utility program was stopped on the first instance and some web pages were closed.

  **Observations** It was also observed that after some minutes, one of the three running instances was automatically terminated.

   <img width="1366" height="528" alt="image" src="https://github.com/user-attachments/assets/99bebc86-b257-47f4-a7cb-41be426ab6f6" />

   <img width="1328" height="454" alt="image" src="https://github.com/user-attachments/assets/16e46f2c-38f8-450a-9af0-da20a66e12c2" />


-  Finally, the stress utility program was stopped on the second instance and only one browser tab was opened.
  
   **Observations** Again, one of the remaining two running instances was terminated automatically by the auto scaling feature.

   <img width="1364" height="583" alt="image" src="https://github.com/user-attachments/assets/cc083fdd-0a52-4673-af30-a31364c4a463" />

   
   **Inferences:**
   
   The folowing inferences were draw from the simulation process:
   
    1. The simulation process successfully demonstrated that the auto scaling feature was able to respond to traffic demands by scaling out and scaling in as required.
    2. The number of instances were dynamically scaled within the boundary of the desired set capacities. The instances were neither scaled beyond the maximum desired capacity nor were they scaled below the minimum desired capacity.

### Step 6: DNS and SSL Consideration

**DNS** translates or converts domain names into IP addresses, enabling users to access websites and other online resources by typing in domain names instead of having to remember and enter the corresponding IP addresses. The DNS of the loadbalancer was used for the project. The name worked perfectly for the scenario but was rather long. It could have been added to the DNS records of a registered domain name. <br>
AWS Route53 can be used to register a domain name on AWS. after registration, the DNS records could be updated by adding the DNS endpoint of the load balacer to it. 

**SSL (Secure Sockets Layer)** is a security protocol that encrypts communication between a user's browser and a website's server. It ensures that data transmitted remains private and secure from interception. It protects data from tampering during transmission.<br>
In a real world scenario, the wordpress site deployed in the project, would have been made more secure by obtaining a Certificate Authority (CA) through AWS Certificate Manager.Thereafter, another listener, HTTPS (port 443) could then be added to the load balancer. HTTP listener can then be edited to forward all traffic to HTTPS.

## Conclusion

The project demonstrated how to deploy a scalable, secure and cost-effective wordpress website. AWS Cloud resources such as networking, compute, object storage and database were judiciously utilized to meet the project requirements. Automation, which is a core practice within the broader framework of DevOps, was, to a very large extent, a crucial part of the implementation. Other key DevOps processes were also employed in order to achieve success in the project. The project requirements were successfuly met and simulated.  

 

 







