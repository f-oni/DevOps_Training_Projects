# AWS Security Groups and Network Access Control Lists (NACLs)

Access management is a fundamental concept of cybersecurity. Controlling access includes deciding who has access to what resources and for what goals. The management of resource access in the cloud is done using security groups. An AWS security group acts as a virtual firewall for the EC2 instances to control incoming and outgoing traffic. Rules can be configured based on IP protocols, port ranges, and source/destination IP addresses. Both inbound and outbound rules control the flow of traffic to and from an EC2 instance respectively.
A network access control list (NACL) is an additional way to control traffic in and out of one or more subnets. They are stateless firewalls that control traffic in and out of subnets within an Amazon Virtual Private Cloud (VPC). They act as an additional layer of security, filtering traffic based on rules defined. Unlike Security Groups, which operate at the instance level, NACLs function at the subnet level.
The project demonstrates the implementatation and use cases of AWS Security Groups and Network Access Control Lists. It explores various scenarios in which either or both can be applied.

## Terminologies

The terminologies used in connection with the project are be explained below: 

**Inbound Rules:** These outline the types of traffic that are permitted to use the resources. They serve as a virtual firewall, controlling the traffic going in and coming out of a VPC for one or more Amazon EC2 instances or other AWS services.<br>
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
3. part three: Allowing Security Group Inbound and Outbound Traffic but Disallowing NACL Inbound Traffic

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

<img width="1366" height="562" alt="image" src="https://github.com/user-attachments/assets/b6477ded-5d94-46e2-877c-db1fcaba5b79" />

The default security group setting for the EC2 instance was examined. In the inbound rules, only IPV4 SSH traffic on port 22 was permitted to access the instance. While the outbound rules permitted all IPV4 traffic with any protocol on any port number. The implication of the outbound rule is that the instance has unrestricted access to anywhere on the internet.

<img width="1132" height="526" alt="image" src="https://github.com/user-attachments/assets/220a086c-3ae2-4ac4-a8e1-eefc437d3517" />


<img width="1136" height="523" alt="image" src="https://github.com/user-attachments/assets/c6e822de-2656-4cc0-8250-dfed09327636" />


To test the accessibility of the website hosted on the instance, the public ip address was copied and pasted in the address bar of a browser. The following was pasted in the browser: `http://13.61.187.185` and the enter key on the keyboard. As expected, the website couldn't load because the inbound rule on the instance allowed only SSH traffic from port 22. After several attempt, a message was displayed: `site can't be reached`

<img width="1246" height="592" alt="image" src="https://github.com/user-attachments/assets/9947310d-a2bb-4bf4-9083-8c017c4debe1" />


### Configuration of inbound rules for HTTP with no outbound rules

For the site to be reachable, the inbound rules would have to be created to allow HTTP traffic on port 80.
The security group option was selected on the left side bar.
Clicked on `Create Security Group`

<img width="1366" height="562" alt="image" src="https://github.com/user-attachments/assets/e8002ace-2953-43b4-8dda-11364a98ffc6" />

A name `server3-security-group` was provided with a description `Allow HTTP`
The VPC selected was `folu-vpc-01`(created in the previous project)

<img width="1366" height="562" alt="image" src="https://github.com/user-attachments/assets/187001ad-42a2-4f55-b2e1-0ef6389fd7e4" />

In the `inbound rule` section, `add rule` was clicked. The type selected was `HTTP`, and the CIDR block `0.0.0.0/0` was chosen.

<img width="1366" height="601" alt="image" src="https://github.com/user-attachments/assets/66ab8cf7-b2d5-43e8-b921-ba5be5b20a63" />

Meanwhile the `outbound rule` was not modified

<img width="1356" height="527" alt="image" src="https://github.com/user-attachments/assets/a927bfa9-f291-4b68-af93-8556eb4e0bdd" />

The `Create security group` button was clicked to complete the process. The security group named `sever3-security-group` was successfully created.

<img width="1134" height="580" alt="image" src="https://github.com/user-attachments/assets/4bfbb16b-c345-4924-bc13-b5c0476e38ea" />


### Attaching Security Group to the Instance

The instance was selected and the action tab was dropped down to select the `Security` option and `Change Security groups` from the security menu options.

<img width="1136" height="585" alt="image" src="https://github.com/user-attachments/assets/01853029-2982-4a29-8bba-ca9f7d40af1d" />

In the `associated security groups` section, the newly created security group was selected and the add `add security group` button was clicked.

<img width="1366" height="556" alt="image" src="https://github.com/user-attachments/assets/03fa3a0b-3956-4fad-b373-2a7c23103d7f" />

<img width="1362" height="562" alt="image" src="https://github.com/user-attachments/assets/fdbe7b19-ab2b-4ceb-a8b6-7d0104c1b034" />

The save button was then clicked.
Security group was successfully attached

<img width="1155" height="562" alt="image" src="https://github.com/user-attachments/assets/5ddc24d1-9c43-40e6-a6cb-c93fde57e278" />

To test the effect of the inbound rule created, The public IP address of the instance was again copied and pated in a browser. 
The website loaded successfuly this time around. With properly configured security group inbound rules, the site became accessible.

<img width="1360" height="480" alt="image" src="https://github.com/user-attachments/assets/b2ba2ef2-f3a7-4cf5-8899-569f19afd706" />


### Security Group are stateful

To confirm if security groups are stateful or not, the outbound tab was selected and the `edit outbound rule` button was clicked.

<img width="1133" height="546" alt="image" src="https://github.com/user-attachments/assets/be286429-6a89-4cc2-af0a-37b8a930e4c4" />

The `delete` button was clicked to delete the outbound rule and the changes were saved by clicking the `save rules` button.

<img width="1356" height="505" alt="image" src="https://github.com/user-attachments/assets/675858d4-82e4-4654-bef1-14978bbf8912" />

The outbound rule was successfully deleted.

<img width="1121" height="538" alt="image" src="https://github.com/user-attachments/assets/0471844e-663e-4fd7-ba30-6f6f96fffeff" />

Again, the public IP address of the instance was pasted in the browser. The website was accessible!

<img width="1308" height="295" alt="image" src="https://github.com/user-attachments/assets/68939704-9c5a-46c8-8892-198aabfb8584" />

Effectively, the outbound rule removal did not affect the instance accessibility. The scenario demonstrated that security groups are stateful, meaning that, they automatically allow return traffic initiated by the instances to which they are attached.

## Removal of both inbound and outbound rules

Deleting both the inbound and outbound rules means that no traffic can come into the instance and the instance can not send any traffic out.
The outbound rule was already deleted in the previous task. To delete the inbound rule therefore, the `inbound rules` tab was clicked, and thereafter the `edit inbound rule` button was clicked. 

<img width="1113" height="528" alt="image" src="https://github.com/user-attachments/assets/1ade4ee3-b885-46fa-a9d2-4de4432ad9c6" />

The rule was deleted by clicking the `delete` button and finally, the `save rules` button was clicked.

<img width="1315" height="513" alt="image" src="https://github.com/user-attachments/assets/9582d9be-478d-4c3a-ada7-88f22ce05a8a" />

Inbound rule was successfully deleted.

<img width="1096" height="525" alt="image" src="https://github.com/user-attachments/assets/f0c5ac22-27b9-45f1-8251-7ed1bf4d0cc2" />

An attempt to access the instance through its public IP address failed because there were no rules permiting traffic to reach the instance. Both the incoming and outgoing traffic were restricted.

<img width="1354" height="627" alt="image" src="https://github.com/user-attachments/assets/1ddae94c-8d33-4ce0-9371-9fd553bd19db" />


## Configuration of outbound rule for all traffic with no inbound rule

In this scenario, A rule was added to allow outbound HTTP traffic. This was to enable the instance to initiate outgoing connection over HTTP. To effect this, the outbound tab was selected and the `edit outbound rule` button was clicked.

<img width="1139" height="566" alt="image" src="https://github.com/user-attachments/assets/7b011f03-f37a-4c83-ac96-301853e4cec0" />

HTTP was selected under type, 0.0.0.0/0 was chosen as the CIDR block and the `save rule` button was clicked.

<img width="1353" height="484" alt="image" src="https://github.com/user-attachments/assets/6b26ecb3-51ad-4870-a985-62675d240399" />

Outboud rule successfully added.

<img width="1134" height="558" alt="image" src="https://github.com/user-attachments/assets/a4cdcf4c-4589-47f2-b479-79a3ef3f6974" />


An attepmt was made to access the instance using its IP address. But the attempt failed.

<img width="1283" height="648" alt="image" src="https://github.com/user-attachments/assets/731aa16a-b159-4c79-b4fc-64d2f7e195d7" />

To test the effectiveness of the outbound rule, the curl command was used from the instance to access a an external sites. 

```
curl https://github.com/f-oni/greenwood-liberary-website.git

curl https://www.google.com

```

This worked successfully. Outbound traffic was possible form the instance. 

<img width="822" height="374" alt="image" src="https://github.com/user-attachments/assets/de715b13-4df4-468d-aef3-f12e143da844" />


## Part Two: Network Access Control Lists use cases implementation

The following scenarios were demonstrated:

- Examining the effect of the default settings for both inbound and outbound rules for NACLs
- Modification of the inbound rules to permit traffic from any IPV4 CIDR on all ports
- Adjusting the outbound rules to allow traffic to all CIDRs. 

## Examining the effect of the default settings for both inbound and outbound rules for NACLs

On the VPC console, the `Network ACL` option was selected at the side bar and the `Create Network ACL` was clicked to begin the process. A name was provided for the Network ACL as `folu-acl-01`,  the VPC `folu-vpc-01` was selected and the `Create network ACL` button was clicked.

<img width="1363" height="563" alt="image" src="https://github.com/user-attachments/assets/6a99be08-1fad-4507-819f-cb0f2e10dee9" />

<img width="1355" height="565" alt="image" src="https://github.com/user-attachments/assets/a991ba44-199e-40ed-94e7-00bed8f99212" />


To examine the default settings, the newly created network ACL was selected and the `inbound rules` tab was chosen. By default, all traffic from all ports was denied.

<img width="1156" height="602" alt="image" src="https://github.com/user-attachments/assets/b0c60f3e-bce4-45bd-ba80-4c7857dd41a6" />

Similarly, the outbound rules was examined and it was also noticed that all traffic from all ports were denied. 

<img width="1138" height="557" alt="image" src="https://github.com/user-attachments/assets/dfbd31fb-3058-45df-b8f4-6bda53147e84" />


## Modification of the inbound rules to permit traffic from any IPV4 CIDR on all ports

The network ACL was selected and the `inbound rules` tab was chosen. The `Edit inbound rules` button was clicked.

<img width="1119" height="535" alt="image" src="https://github.com/user-attachments/assets/55c66af2-f6ee-40cb-86d7-d4f43176878f" />

On the next page, `Add new rule` button was clicked, a rule number `1` was assigned, `all traffic` was specified under `Type`, CIDR block 0.0.0.0/0 was selected as the source, `Allow` was selected and then the `save changes` button was clicked to effect the action. 

<img width="1336" height="455" alt="image" src="https://github.com/user-attachments/assets/5957343c-20f5-4292-88d3-98e7f66d1c0c" />


### NACL Association with a Subnet

The newly created network access control list had no subnet association yet. 

<img width="1136" height="532" alt="image" src="https://github.com/user-attachments/assets/15842023-b404-4772-933b-484f4aeeea3a" />

To associate it with a subnet, the Network ACL (folu-acl-01) was selected, the `action` button at the top right corner was dropped down and the `Edit subnet association` was chosen in the drop down menu list. 

<img width="1145" height="565" alt="image" src="https://github.com/user-attachments/assets/cce04904-853c-454c-80a4-10de4d219965" />

Then, the  public subnet `folu-public-subnet-1`(created in the previous project) was selected and the `Save changes` button was clicked. 

<img width="1366" height="527" alt="image" src="https://github.com/user-attachments/assets/2ddc1f53-5e30-4d23-868c-696f04965915" />

Subnet association was successful.

<img width="1147" height="527" alt="image" src="https://github.com/user-attachments/assets/03aaa6a2-627c-4729-adad-8f93015eb386" />


An attempt was made to access the instance through the public IP address but the attempt was not successful.

<img width="1283" height="648" alt="image" src="https://github.com/user-attachments/assets/7cb4af40-bc3f-4e33-ac90-4d2ba7dcc43a" />

The site hosted on the instance could not be reached despite the fact that the network ACL inbound rule had been configured to permit all inbound traffic because NACLs are stateless. Meaning that they don't automatically allow return traffic. Therefore, both inbound and outbound rules must be explicitely configured.

### Adjusting the outbound rules to allow traffic to all CIDRs

The network ACL was selected and the `outbound rules` tab was chosen. The `Edit outbound rules` button was clicked. 

<img width="1144" height="547" alt="image" src="https://github.com/user-attachments/assets/524c2528-e504-4379-a5ef-961feb491c1b" />

On the next page, `Add new rule` button was clicked, a rule number `1` was assigned, `all traffic` was specified under `Type`, CIDR block 0.0.0.0/0 was selected as the source, `Allow` was selected and then the `save changes` button was clicked to effect the action. 

<img width="1362" height="410" alt="image" src="https://github.com/user-attachments/assets/867f29fb-b705-4895-9276-2d30333d3da6" />

Outbound rule was successflly configured

<img width="1157" height="570" alt="image" src="https://github.com/user-attachments/assets/ae669a44-54ce-481f-b2ba-e0e35c2f1e64" />


Both inbound and outbound rules having been configured, the site was visited again, and it was successfuly accessed. 


<img width="1314" height="342" alt="image" src="https://github.com/user-attachments/assets/0dab5233-7b80-43d6-8a88-49244ca5ab7b" />



## Part Three: Allowing Security Group Inbound and Outbound Traffic but Disallowing NACL Inbound Traffic

First, the inbound rule of the security group was configured to allow HTTP (port 80) and SSH (port 22) traffic respectively.

<img width="1353" height="553" alt="image" src="https://github.com/user-attachments/assets/06d62475-1411-431e-ae12-139da37ad367" />

<img width="1092" height="467" alt="image" src="https://github.com/user-attachments/assets/bed2e398-1b51-4dda-b780-826309165ea7" />

The security group outbound rule was similarly configured to allow all traffic.
For the NACL, the inbound and outbound rules already configured were removed to deny all traffic.

<img width="1127" height="543" alt="image" src="https://github.com/user-attachments/assets/0853c3ae-5237-4658-b637-473133b0fffe" />

<img width="1145" height="553" alt="image" src="https://github.com/user-attachments/assets/5f476a97-d96f-4496-b154-806b1e8bc697" />


The EC2 instance was accessed as before but was not successful as the website could not load. The security group rules alllowed traffic into the instance but the network access control list rules denied access into the subnet. Thereby, effectively prevented access to the instance.

<img width="1294" height="598" alt="image" src="https://github.com/user-attachments/assets/8963ec92-66a1-4e73-b1c9-b89e0e846c5b" />


## Conclusion

The project thoroughly explored AWS security features for resource protection. Basically, Network security group and Network Access Control Lists were successfully configured to control inbound and outbound traffic. Various scenarios and use cases were demonstrated. The project implemetation highlighted the difference between security group and network access control list. Security groups rules are used at the resource level to control inbound and outbound traffic while network access control list is employed at the subnet level. 

