# AWS Security Groups and Network Access Control Lists (NACLs)

Access management is a fundamental concept of cybersecurity. Controlling access includes deciding who has access to what resources and for what goals. The management of resource access in the cloud is done using security groups. An AWS security group acts as a virtual firewall for the EC2 instances to control incoming and outgoing traffic. Rules can be configured based on IP protocols, port ranges, and source/destination IP addresses. Both inbound and outbound rules control the flow of traffic to and from an EC2 instance respectively.
A network access control list (NACL) is an additional way to control traffic in and out of one or more subnets. They are stateless firewalls that control traffic in and out of subnets within an Amazon Virtual Private Cloud (VPC). They act as an additional layer of security, filtering traffic based on rules defined. Unlike Security Groups, which operate at the instance level, NACLs function at the subnet level.
The project demonstrates the implementatation and use cases of AWS Security Groups and Network Access Control Lists. It explores various scenarios in which either or both can be applied.

## Terminologies
The following terminologies should be explained in connection with the project

**Inbound Rules:** These outline the types of traffic that are permitted to use the resources. They serve as a virtual firewall, controlling the traffic going in and coming out of a VPC for one or more Amazon EC2 instances or other AWS services.
**Outbound Rules:** These regulate the traffic that is permitted to depart from the resources or outgoing traffic. The destination for incoming traffic is dealt with by outbound rules.<br>
**Port:** A port on a computer serves as the communication endpoint for a particular process or service. It processes incoming and outgoing network traffic.<br>
**Stateful:** Security Groups are stateful, meaning if an inbound rule allows traffic, the return traffic is automatically permitted.<br>
**NACL Rules:** Rules that define what traffic is allowed or denied.<br>
**CIDR:** A technique for allocating IP addresses and rerouting Internet Protocol.<br>
**Ingress:** Inbound traffic or incoming network traffic.<br>
**Egress:** Outbound traffic or outgoing network traffic.

## Project Tasks
1. Part One: Security Group use cases implementation
2. Part two: Network Access Control Lists use cases implementation

## Project Resources

The following resources are required for the project implementation

1. A VPC
2. A Subnet
3. Internet gateway
4. EC2 instance
   

## Part One: Security Group use cases implementation

The following scenarios were demonstrated:

- Implementation of inbound traffic rules for HTTP and SSH protocols and allow outbound traffic for all
- Configuration of inbound rules for HTTP with no outbound rules
- Removal of both inbound and outbound rules.
- Configuration of outbound rule for all traffic with no inbound rule

### Implementation of inbound traffic rules for HTTP and SSH protocols and allow outbound traffic for all

The VPC, internet gateway and public subnet created in the previous project were utilized for this project. An EC2 instance named "server3" was created in the public subnet. A website named `MarketPeak` was hosted on server3.
The default security group setting for the EC2 instance was examined. In the inbound rules, only IPV4 SSH traffic on port 22 was permitted to access the instance. While the outbound rules permitted all IPV4 traffic with any protocol on any port number. The implication of the outbound rule is that the instance has unrestricted access to anywhere on the internet.

To test the accessibility of the website hosted on the instance, the public ip address was copied and pasted in the address bar of a browser. The following was pasted in the browser: `http://13.61.187.185` and the enter key on the keyboard. As expected, the website couldn't load because the inbound rule on the instance allowed only SSH traffic from port 22. After several attempt, a message was displayed: `site can't be reached`

### Configuration of inbound rules for HTTP with no outbound rules
For the site to be reachable, the inbound rules would have to be created to allow HTTP traffic on port 80.
The security group option was selected on the left side bar.
Clicked on `Create Security Group`
A name `server3-security-group` was provided with a description `Allow HTTP`
The VPC selected was `folu-vpc-01`(created in the previous project)
In the `inbound rule` section, `add rule` was clicked. The type selected was `HTTP`, and the CIDR block `0.0.0.0/0` was chosen. Meanwhile the `outbound rule` was not modified
The `Create security group` button was clicked to complete the process.

### Attaching Security Group to the Instance
The instance was selected and the action tab was dropped down to select the `Security` option and `Change Security groups` from the security menu options.
In the `associated security groups` section, the newly created security group was selected and the add `add security group` button was clicked. The save button was then clicked.
To test the effect of the inbound rule created, The public IP address of the instance was again copied and pated in a browser. 
The website loaded successfuly this time around. With properly configured security group inbound rules, the site became accessible.

### Security Group are stateful

To confirm if security groups are stateful or not, the outbound tab was selected and the `edit outbound rule` button was clicked.
The `delete` button was clicked to delete the outbound rule and the changes were saved by clicking the `save rules` button.
Again, the public IP address of the instance was pated in the browser. The website was accessible. Effectively, the outbound rule removal did not affect the instance accessibility. The scenario demonstrated that security groups are stateful, meaning that, they automatically allow return traffic initiated by the instances to which they are attached.

## Removal of both inbound and outbound rules

Deleting both the inbound and outbound rules means that no traffic can come into the instance and the instance can not send any traffic out.
The outbound rule was already deleted in the previous task. To delete the inbound rule therefore, the `inbound rules` tab was clicked, and thereafter the `edit inbound rule` button was clicked. The rule was deleted by clicking the `delete` button and finally, the `save rules` button was clicked. An attempt to access the instance through its public IP address failed because there were no rules permiting traffic to reach the instance. Both the incoming and outgoing traffic were restricted.

## Configuration of outbound rule for all traffic with no inbound rule
In this scenario, A rule was added to allow outbound HTTP traffic. This was to enable the instance to initiate outgoing connection over HTTP. To effect this, the outbound tab was selected and the `edit outbound rule` button was clicked. HTTP was selected under type, 0.0.0.0/0 was chosen as the CIDR block and the `save rule` button was clicked. An attepmt was made to access the instance using its IP address. But the attempt failed.
To test the outbound rule, the curl command was used from the instance to access a an external site. This worked successfully.


## Part two: Network Access Control Lists use cases implementation

The following scenarios were demonstrated:
- Examining the effect of the default settings for both inbound and outbound rules for NACLs
- Modification of the inbound rules to permit traffic from any IPV4 CIDR on all ports
- Adjusting the outbound rules to allow traffic to all CIDRs. 

## Examining the effect of the default settings for both inbound and outbound rules for NACLs

On the VPC console, the `Network ACL` option was selected at the side bar and the `Create Network ACL` was clicked to begin the process. A name was provided for the Network ACL as `folu-acl-01`,  the VPC `folu-vpc-01` was selected and the `Create network ACL` button was clicked. To examine the default settings, the newly created network ACL was selected and the `inbound rules` tab was chosen. By default, all traffic from all ports was denied.Similarly, the outbound rules was examined and it was also noticed that all traffic from all ports were denied. 

## Modification of the inbound rules to permit traffic from any IPV4 CIDR on all ports

The network ACL was selected and the `inbound rules` tab was chosen. The `Edit inbound rules` button was clicked. On the next page, `Add new rule` button was clicked, a rule number `1` was assigned, `all traffic` was specified under `Type`, CIDR block 0.0.0.0/0 was selected as the source, `Allow` was selected and then the `save changes` button was clicked to effect the action. 

### NACL Association with a Subnet

