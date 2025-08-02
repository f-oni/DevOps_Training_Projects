# AWS Load Balancer and Auto Scaling Group 

The project provides insight into how to maintain scalability and high availability in AWS cloud platform. High availability (HA) in cloud computing, is a system's ability to operate continuously without interruption, even when individual components fail, by using redundancy, fault tolerance, and automatic failover mechanisms to ensure continuous service and minimize downtime. Scalability on the other hand, is the ability of cloud resources to adjust up or down automatically in response to changing demands. Auto scaling groups and load balancers were utilized to achieve both scalability and high availability. 

The following steps were followed for the project implementation


1. Creating Launch Template
2. Auto Scaling Groups
3. Scaling Policies Configuration
4. Attaching Application Load Balancer
5. Testing Auto Scaling


## Creating Launch Template

A launch template is a resource in AWS that saves instance configuration details, such as AMI, instance type, key pair, security groups, and network settings, to launch Amazon EC2 instances. It simplifies and automates the launch process. It allows consistentency, customization, and version-controlled instance deployments. To create a launch template, the following steps were followed:

The Launch Templates option was selected in the left side bar of the EC2 service dashboard.
`Create Lauch Template` button located at the top right corner of the page was clicked.
A name `folu-template` and description was provided for the template.

<img width="1366" height="563" alt="image" src="https://github.com/user-attachments/assets/5785ebba-404a-43b0-b8bd-d94325948583" />

A preferred Ubuntu `ami` and instance type were selected. `t3.micro` was chosen as the instance type.

<img width="1366" height="579" alt="image" src="https://github.com/user-attachments/assets/fe86ff87-54be-4479-9f0a-5c59de744167" />


An existing key pair was selected in the key pair name box.

<img width="1359" height="579" alt="image" src="https://github.com/user-attachments/assets/1929fcfb-3670-45e4-8e86-74ee47e4bee5" />

In the networking section, an existing security group was selected. 

<img width="1366" height="596" alt="image" src="https://github.com/user-attachments/assets/90e38f94-e9cb-4a92-a3d8-6a067be624b7" />

In the `user data` section, a script was provided to install apache2 on every launched EC2 instance.

<img width="1336" height="490" alt="image" src="https://github.com/user-attachments/assets/117deb46-58b5-4af1-be2e-ec4c2946a0f3" />

The `Create Launch Template` button was finally clicked to create the launch template.

<img width="1366" height="568" alt="image" src="https://github.com/user-attachments/assets/0b18a5dc-9424-4f04-9a5d-1dac9c22ad4d" />



##  Auto Scaling Groups

Auto Scaling group in AWS is a feature that maintains the desired number of healthy Amazon EC2 instances by automatically adding or removing them based on traffic or load.
The steps to create an auto scaling group are described below:

The `Auto Scaling Groups` option was selected in the left side bar of the EC2 service dashboard.

`Create Auto Scaling Groups` button located at the top right corner of the page was clicked.

<img width="1366" height="574" alt="image" src="https://github.com/user-attachments/assets/152fccc2-9ba3-4269-b4d4-ffcec179a496" />

In the `Choose Launch Template Section`, A name `folu-ASG` was specified and the previously created launch template was selected.

The default VPC was selected under the networking section as well as the availability zones.

<img width="1361" height="581" alt="image" src="https://github.com/user-attachments/assets/b3a34fbf-d9ca-4b21-941c-c514b616416b" />

`Attach to a new load balancer` option was selected in the `load balancing` section. The type of load balancer selected was `Application load balancer` and a name `folu-ALB` was provided for the load balancer.

<img width="1362" height="581" alt="image" src="https://github.com/user-attachments/assets/5bf45491-e142-4989-bbce-88347a8e761a" />

In the `Configuration group size and scaling` section, the desired capacity was set at 1, minimum capacity was set at 1 while the maximum capacity was set at 3.

<img width="1327" height="543" alt="image" src="https://github.com/user-attachments/assets/30a29950-7a0a-43af-ab3f-473d547e7d9e" />

<img width="1283" height="559" alt="image" src="https://github.com/user-attachments/assets/c85b711a-47d8-422e-98d9-e7feec948a1b" />


The other default settings were left for the remaining sections and the `Create Auto Scaling Groups` button was clicked to complete the process.

The auto Scaling Group was created successfully.

<img width="1366" height="585" alt="image" src="https://github.com/user-attachments/assets/0924e444-c314-439c-9e51-6d725f04e688" />


## Scaling Policies Configuration

The `Automatic Scaling` tab was selected and the `Create dynamic scaling policy` button was clicked to begin the policy creation process.

<img width="1365" height="581" alt="image" src="https://github.com/user-attachments/assets/fb830bcf-9030-4a0a-b31e-95d74eca7403" />

`Target tracking scaling` was selected. The metric type chosen was `Average CPU Utilization` and the `target value` entered was 60.

<img width="1299" height="559" alt="image" src="https://github.com/user-attachments/assets/b05283f9-3dd0-4b7e-9a86-b8d4cb0310d5" />

The scaling policy was successfully created.

<img width="1352" height="563" alt="image" src="https://github.com/user-attachments/assets/43643943-61ac-414f-959a-0043910f6326" />


## Attaching Application Load Balancer

The `integration tab` was selected in the auto scaling group dashboard to show the load balancing section.

<img width="1366" height="603" alt="image" src="https://github.com/user-attachments/assets/c1d93b93-a4e4-4be2-bae6-d8b5bb379ef4" />

The `Edit` button was clicked in the load balancing section. The load balancer `folu-ALB` was selected and the selection was updated.

<img width="1366" height="589" alt="image" src="https://github.com/user-attachments/assets/1b13e7c0-826e-4ba9-ade2-44bf6d742f66" />


## Testing Auto Scaling

The `stress utility` was installed with the command `sudo apt install stress -y`.

<img width="1145" height="472" alt="image" src="https://github.com/user-attachments/assets/f006cc4f-6b08-4cdd-a6ac-c03141a6a537" />


To load the CPU, the following command was run `stress -c 4`

<img width="950" height="381" alt="image" src="https://github.com/user-attachments/assets/1901f85d-1548-4854-b7c1-2cfe631a2faf" />


**Observations:** The instance counts increased from 1 to 2 and eventually to 3, the maximum desired capacity

<img width="1366" height="613" alt="image" src="https://github.com/user-attachments/assets/8ca15ae9-4c7b-4f00-bd92-2a26a3d893b2" />

<img width="1359" height="579" alt="image" src="https://github.com/user-attachments/assets/a4f1f006-f5f6-4a4f-8ad5-3c26c99a5d8f" />

<img width="1366" height="589" alt="image" src="https://github.com/user-attachments/assets/fd28f9b9-45c5-472c-b77f-8e40b160f199" />




## Conclusion

The project successfully demonstrated how to achieve high availability and maintain scalability while deploying cloud resources.




