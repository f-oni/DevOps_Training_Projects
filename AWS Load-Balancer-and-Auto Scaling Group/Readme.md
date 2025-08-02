# AWS Load Balancer and Auto Scaling Group 

The project provides insight into how to maintain scalability and high availability in AWS cloud platform. High availability (HA) in cloud computing, is a system's ability to operate continuously without interruption, even when individual components fail, by using redundancy, fault tolerance, and automatic failover mechanisms to ensure continuous service and minimize downtime. Scalability on the other hand, is the ability of cloud resources to adjust up or down automatically in response to changing demands. Auto scaling groups and load balancers were utilized to achieve both scalability and high availability. 

The steps below will be followed for the project implementation:

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
A preferred Ubuntu `ami` was selected and `t3.micro` was chosen as the instance type.
An existing key pair was selected in the key pair name box.
In the networking section, an existing security group was selected. 
In the `user data` section, a script was provided to install apache2 on every launched EC2 instance.
The `Create Lauch Template` button was finally clicked.


##  Auto Scaling Groups

Auto Scaling group in AWS is a feature that maintains the desired number of healthy Amazon EC2 instances by automatically adding or removing them based on traffic or load.
The steps to create an auto scaling group are described below:

The `Auto Scaling Groups` option was selected in the left side bar of the EC2 service dashboard.
`Create Auto Scaling Groups` button located at the top right corner of the page was clicked.
In the `Choose Lauch Template Section`, A name `folu-ASG` was specified and the previously created lauch template was selected.
The default VPC was selected under the networking section. The availability zones were equally selected.
`Attach to a new load balancer` option was selected in the `load balancing` section. The type of load balancer selected was `Application load balancer` and a name `folu-ALB` was provided for the load balancer.
In the `Configuration group size and scaling` section, the desired capacity was set at 1, minimum capacity was set at 1 while the maximum capacity was set at 3.
The default setting was left for the remaining sections and the `Create Auto Scaling Groups` button was clicked to complete the process.
The auto Scaling Group was created successfully.

## Scaling Policies Configuration

`Automatic Scaling` tab was selected and the `Create dynamic scaling policy` button was clicked to begin the policy creation process.
`Target tracking scaling` was selected. The metric type chosen was `Average CPU Utilization` and the `target value` entered was 60.
The scaling policy was successfully created.

## Attaching Application Load Balancer

The `integration tab` was selected in the auto scaling group dashboard to show the load balancing section.
The `Edit` button was clicked in the load balancing section. The load balancer `folu-ALB` was selected and the selection was updated.

## Testing Auto Scaling




