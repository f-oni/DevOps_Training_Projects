# WordPress Site on AWS

## Objective

The project is meant to demonstrate infrastructure provisioning on AWS to host a worpress site that is scalable, secrure and cost effective. AWS cloud resources will be provisioned in different availability zones to ensure that the site is highly available. Load balancer is leveraged on for effective traffic distribution while auto scaling feature will be utilized to efficient scalability. Subnets and security groups wil be used for enhanced security.

## Project Overview 

A virtual private cloud(VPC) with public and private subnets in two different availability zones.
One public subnet and one private subnet is created in each of the availability zones.
The public subnets are associated with a public route table which provides route to the internet through an internet gateway
The private subnets are associated with a private route table which provides outbound route to the internet through an NAT gateway
Six security groups were created to control access to individual resources placed in different subnets
Amazon Elastic File System (EFS) is a fully managed, scalable, and serverless cloud file storage service was used as a shared storage location for the web servers.
The Amazon Relational Database Service (Amazon RDS) engine deployed was MYSQL
Bastion host was created to provide restricted access to the resources in the private subnets

## Infrastructure Architecture





## Project Implementation

The steps for the project implementation are outlined below:
1. Script development
2. Cloud infrastructure Provisioning
3. Bootstrapping
4. Testing and simulation

### Script Development

A BASH script `wordpress.sh` was developed to perform the followin tasks:

- Update the operating system
- Create an installation directory `/var/www/html` and mount efs.
- Install the requirements and dependencies for wordpress installation. The stack include:
  Apache, MYSQL client and PHP.
- Provides the neccessary permissions for the directory.
- Download wordpress files, extract and copy to /var/www/html.
- Create the wp-config.php file.

The script is shown below:

A second second script with the name wordpress-userdata.sh was also created. The developed for the launch template. It performs most of the task covered in the `wordpress.sh` script except installation directory creation and wordpress download. The following tasks are built into the script:

- Update the operating system.
- Install the requirements and dependencies for wordpress installation. The stack include:
  Apache, MYSQL client and PHP.
- Mount the efs to the html directory
- Provides the neccessary permissions for the directory.

The userdata script is shown below:

### Cloud Infrastructure Provisioning
A custum VPC and associted general resources were first provisioned. Subsequently,  the resources for the public and private subnets were created respectively. 

### VPC and General Resources

+ A custom VPC named `wp-vpc-01` to provide an isolated environment for resource deployment was created with `CIDR` block `10.0.0.0/16`.
+ Internet gateway with the name `wp-internet-gw` was created and attached to the VPC
+ A public route table was created and named `wp-public-rt`.The two public subnets were associated with it and route from anywhere on the internet (0.0.0.0/0) through the internet gateway.
+ NAT gateway was created with the name `wp-nat-gw`. The two private subnets were associated with a private route table which provides outbound route through the NAT gateway.


### Public and Private Subnets Resources

#### Subnets Setup

The following subnets were created two availability zones selected from eu-north-1a and eu-north-1b:

- wp-public-subnet-1a with `CIDR` block `10.0.1.0/24`
- wp-public-subnet-1b with `CIDR` block `10.0.3.0/24`
- wp-private-subnet-1a with `CIDR` block `10.0.5.0/24`
- wp-private-subnet-1a with `CIDR` block `10.0.7.0/24`

#### Security groups configuration

The following security groups were set up for individual and group of resources:
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

   **Bastion Host:** is a "jump server" that allows a secure connection to private resources from the internet. It is a special-purpose EC2 instance located in a public subnet that acts as a secure gateway to access other instances within a private subnet. A t3micro ec2 instance named `bastion-host-wp` was created in the public subnet for this purpose. The `Bastion-sg` security group was attached to it.

   **Application load balancer(ALB):** Application load balancer named `wp-alb-01` meant to distribute incoming HTTP and HTTPS traffic across multiple Amazon EC2 instances that would be provisioned as webservers was created in the public subnet. A target group with the name `wp-tg-01` was created and selected for the application load balancer. The two public subnets in availability zones of eu-north-1a and eu-north-1b were selected for availability zone and `wp-alb-sg` was selected for the security group. 

   **NAT gateway:** Network Address Translation (NAT) allows instances in private subnets of an AWS Virtual Private Cloud (VPC) to connect to the internet or other AWS services while preventing unsolicited inbound connections from the internet while at the same time, preventing the internet from initiating connections with those instances. The NAT gateway was created with the name `wp-nat-gw` and the two private subnets were associated with the private route table.

#### Private Subnet Resources

The following resources were created in the private subnet

1. EC2 instance for bootstrapping.
2. RDS engine for the database.
3. Elastic file system (EFS) to provide shared storage for the webservers

   **EC2 instance for bootstrapping:** An EC2 instance named `websever-01` was launched in one of the private subnets. The instance was provisioned without a public IP address. The `webserver-sg` security group was attached to it.
   **RDS engine for the database:** The database engine provisioned for the project was MYSQL. The database subnet group with the name `wp-db-subnet-group` was first created as a prerequisite. The two availability zones as well as the two private subnets in those availability zones were added to the database subnet group. MYSQL `stardard create` method was selected and the name `database-1` was given as the instance idnetifier. The `master username` and `master password` were provided respectively. The authentication method of password was chosen and the initial database name was provided as `wordpressdb`. `Defaulmysql 8.0` was selected in the `DB parameter group` section. The create button was clicked to start the process of the data base creation.
   **Elastic file system (EFS):**  Elastic file system is a fully managed, scalable, and serverless file storage service for Amazon Web Services (AWS). It allows one to create and use file systems that can be accessed concurrently by multiple EC2 instances. The chioce of EFS meets the project's storage and accessibility requirements. `wp-efs-01` was the name given to the EFS. The two availability zones as and the two private subnets in those availability zones were selected for the mount targets. The `wp-efs-sg` security group was attached to the EFS. The

### Bootstrapping

The bootsrapping is to be done with the ec2 instance in the private subnet and the only way of accessing it is through the bastion host. Hence, the bastion host was connected to through SSH using its public IP address. from the bastion host terminal, the instance located in the private subnet was connected to through SSH using its private IP address. The connection was successful. NAT gateway route was first tested by using the command `sudo yum update`. The command was executed successfully. The `lamp.sh` script was moved to the server. The execute permit command `sudo chmod +x lamp.sh` was run to enable execution of the file. The script was executed with the command `./lamp.sh`. The execution was successful. The success of the script was tested by confirming that that the EFS was mounted and the installation of the wordpress dependencies were successful. EFS mount point was confirmed with the command `df -h`. PHP installation was confiremd with the command `php -v`. MYSQL client installation was confiremd with the command `mysql --version`. Apache installation was confiremd with the command `sudo systemctl status httpd`. The wordpress files were downloaded and copied to the appropriate location (/var/www/html) as expected. This was verified using `cd /var/www/html and  the `ls` command.



 







