# AWS Virtual Private Cloud (VPC)

AWS VPC is an isolated virtual network within AWS. It is a service that allows one to provision a logically isolated section of the AWS Cloud where AWS resources can be launched in a virtual network that has been defined. The project focuses on how to design, implement and manage solated networks in AWS. To control the flow of traffic to and from the private network, subnets, route tables and security groups will be created. NAT gateways, VPC peering and VPN connections will be provisioned to enhance connectivity. The project proceeds as follows:

1. Setting up a Virtual Private Cloud (VPC)
2. Configuring subnets within the VPC
3. Creating internet gateway and attaching it to VPC
4. Enabling internet connectivity with Internet Gateway by setting up Routing table
5. Provisioning NAT Gateway to enable outbound internet access.
6. Establishing VPC peering connections


 # Task 1: Setting up a Virtual Private Cloud (VPC)

 VPC was entered into the search bar in order to bring up the VPC page.
 
 <img width="956" height="621" alt="image" src="https://github.com/user-attachments/assets/852070a3-d9ac-4c2c-b2de-23d557f3b088" />

 `Create VPC` button was clicked to beging the process of VPC creation.
 
 <img width="1366" height="637" alt="image" src="https://github.com/user-attachments/assets/e9cf264e-8d4a-403b-946c-9d504f93d576" />

 Under `VPC Settings`, `VPC only` was selected.
 `IPV4 CIDR manual input` was selected and the following IPV4 CIDR was iputed as the ip adrress block `10.0.0.0/16`
 
 <img width="1175" height="642" alt="image" src="https://github.com/user-attachments/assets/c81d4d36-40c1-4f3a-9155-371e164d540c" />

 The `Create VPC` button was finally clicked.
 
 <img width="1359" height="606" alt="image" src="https://github.com/user-attachments/assets/d9c01498-7c3e-4f4c-8eb0-ee601dbbad85" />

 VPC was successfully created.
 
 <img width="1366" height="647" alt="image" src="https://github.com/user-attachments/assets/150117e4-6012-4568-b869-0944ee5fb4fd" />


 # Task 2: Configuring Subnets within the VPC

 The subnet option on the side bar of the VPC page was clicked to open up the subnet page.
 `Create subnet` button was clicked to start the process creating a subnet.
 
 <img width="1366" height="549" alt="image" src="https://github.com/user-attachments/assets/f743e9a8-173c-41a6-848e-acd9f0d13d4e" />

 The `VPC ID` of the VPC created in task one was selected so that the subnet will be created in the selected VPC.
 
 <img width="1366" height="410" alt="image" src="https://github.com/user-attachments/assets/47d86c12-0237-48f2-971b-ada234730c39" />

 A subnet name `my-public-subnet-1` was provided and an availability zone was chosen.
 The subnet's `IPV4 CIDR` block provided was `10.0.3.0/24` 
 
 <img width="1183" height="520" alt="image" src="https://github.com/user-attachments/assets/ddbeecab-2763-46c6-b9c4-255b8c0cb3b7" />

 `Add subnet` button was clicked to create a second subnet
 The second subnet was given the name `my-private-subnet-1`. The same availability zone was chosen as the first subnet.
 The subnet's `IPV4 CIDR` block for the second subnet was `10.0.4.0/24`
 
 <img width="1355" height="610" alt="image" src="https://github.com/user-attachments/assets/dfd6e192-284e-44c0-9848-d00fc2e0e1c1" />

 The `Create subnet` button was clicked to validate the entries and create the two subnets.
 The subnets were successfully created
 
 <img width="1366" height="519" alt="image" src="https://github.com/user-attachments/assets/999aa7e8-ee06-489a-b0b1-e411697781bd" />


 # Task 3: Creating Internet Gateway and Attaching it to VPC

 Navigating to the sidebar of the VPC page, the Internet Gateway option was selected
 The `create internet gateway` button was clicked for the process to start.
 
 <img width="1366" height="528" alt="image" src="https://github.com/user-attachments/assets/4bfd46a6-589a-4cf8-8178-26defffc73a3" />
 
 The name: `my-internet-gw1` was entered in the space provided for name
 `create internet gateway` button was clicked to effect its creation.
 
 <img width="1358" height="571" alt="image" src="https://github.com/user-attachments/assets/08105bab-3931-4f64-b8e0-ed35fb25bd86" />

The internet gateway was created successfully.

<img width="1363" height="544" alt="image" src="https://github.com/user-attachments/assets/df7924b0-79c5-4a9d-a145-5681cd26c778" />

In order to enable internet connectivity, the internet gateway created must be attached to the VPC. 
At the top right corner of the page, the `Actions` tab was dropped down and `Attach to VPC` option was clicked.

<img width="1366" height="541" alt="image" src="https://github.com/user-attachments/assets/4366401e-733b-47f6-b0ec-b21dd32232d5" />

The VPC created in part 1 was selected.
`Attach internet gateway` button was clicked to complete the process

<img width="1362" height="463" alt="image" src="https://github.com/user-attachments/assets/58ae8bc0-6181-4ad4-951a-e69ae4e06f4a" />

The internet gatway was successfully attached to the VPC

<img width="1366" height="582" alt="image" src="https://github.com/user-attachments/assets/637ecfbf-0194-4cd4-a8ac-e555722a686d" />


# Task 4: Enabling Internet Connectivity with Internet Gateway by setting up Routing Table

The `Route table` option was selected and the `Create route table` button was clicked.

<img width="1366" height="575" alt="image" src="https://github.com/user-attachments/assets/30c6171d-2151-44d4-ab10-2bf11230c069" />

The name, `my-route-table-1` was provided in the space for name and the VPC to use was selected
`create route table` button was clicked.

<img width="1366" height="617" alt="image" src="https://github.com/user-attachments/assets/dda5d17b-8b38-4d71-828e-5fd3288b9111" />

The route table was successfully created.

<img width="1366" height="566" alt="image" src="https://github.com/user-attachments/assets/7ed07591-f21b-46e8-a750-adc2d6d270d2" />


## Public Subnet Association

To associte the public subnet with the internet gateway, the `Subnet association` tab was clicked and the `Edit subnet associations` button was clicked.

<img width="1361" height="586" alt="image" src="https://github.com/user-attachments/assets/98d7437a-cb45-4114-8c23-d8e273d4eaed" />

The `my-public-subnet-1` subnet was selected and the `save associations` button was clicked.

<img width="1366" height="612" alt="image" src="https://github.com/user-attachments/assets/07832e0e-acdc-4b99-8691-45950db48cda" />

The subnet association was successful. The internet gateway was successfully associated with the public subnet.

<img width="1366" height="614" alt="image" src="https://github.com/user-attachments/assets/0d9d3827-8cf0-4f49-811f-9d6e362c361a" />


## Updating the Route Table for the Public Subnet

In order to add route, the `route` tab was selected and `Edit route` button was clicked.
In the `Destination` section, `0.0,0,0/0` was selected, which effectively means that every IPV4 address can access this subnet.
`Internet Gateway` was selected in the `Target field` and the internet gateway already created (my-internet-gw1) was selected.
The `save changes` button was finally selected.

<img width="1339" height="573" alt="image" src="https://github.com/user-attachments/assets/7fc52672-2d4f-4cd8-b0c1-7400ac3781b9" />

With this, only resources in the subnet named `my-public-subnet-1` can access the internet.

<img width="1337" height="530" alt="image" src="https://github.com/user-attachments/assets/3f7a4066-282b-439d-8609-abaf14198d5d" />

<img width="1366" height="604" alt="image" src="https://github.com/user-attachments/assets/95e3ef77-6bd7-460e-ac4b-2d609858e396" />



# Task 5: Provisioning NAT Gateway to Enable Outbound Internet Access

The `NAT gateway` option was selected and the create `NAT gateway` button was clicked.

<img width="1366" height="584" alt="image" src="https://github.com/user-attachments/assets/f3261806-a27c-4756-a3d1-32213afcd148" />

The name `my-NAT-gw1` was entered in the box provided for name.
The subnet `my-private-subnet-1` was selected.
In the connectivity type section, `private` was selected.

<img width="1366" height="608" alt="image" src="https://github.com/user-attachments/assets/423a42d5-c49f-4723-8143-986b0f5b7ac4" />

`Create NAT gateway` button was clicked and the NAT gateway was successfully created.

<img width="1366" height="609" alt="image" src="https://github.com/user-attachments/assets/23fabdf5-17f7-43eb-ab4f-e005a5466d66" />


## Updating the Route Table for the Private Subnet

On the NAT gateway page, the `Details` tab selected and the `subnet ID` was clicked to open the subnet page.

<img width="1366" height="604" alt="image" src="https://github.com/user-attachments/assets/c4dfe4cc-74cb-48ab-97be-9c19f2464aa4" />

On the subnet page, the `Route table` tab was selected. The `route table ID` was clicked.

<img width="1366" height="596" alt="image" src="https://github.com/user-attachments/assets/e710e4fe-0716-4f02-aad7-b3ec6b918cb4" />

In the `Routes` section, `Edit routes` was clicked, then, `Add routes`.

<img width="1366" height="599" alt="image" src="https://github.com/user-attachments/assets/13c03a39-d930-4ab2-8064-a28085b0fdf0" />

In the `Destination` section, `0.0,0,0/0` was selected. While NAT gateway was selected in the `Target` section. The NAT gateway named `my-NAT-gw1` was chosen as the target gateway.

<img width="1366" height="542" alt="image" src="https://github.com/user-attachments/assets/03286df7-dbd1-425d-8ca2-224419680291" />

The `save changes` button was finally selected to effect the changes.

<img width="1366" height="604" alt="image" src="https://github.com/user-attachments/assets/5ca2d2fd-e110-4f97-b3a6-f0aa488cc0ff" />


## Private Subnet Association

The `Edit subnet associations` button was clicked under the `Subnet associations` tab.

<img width="1366" height="590" alt="image" src="https://github.com/user-attachments/assets/db156ae2-ed4e-4cd2-87fa-01fdf8e9b2ab" />

The private subnet with the name `my-private-subnet-1` was selected.
`save association` button was clicked. The private subnet was succesfully attached to the route table

<img width="1366" height="525" alt="image" src="https://github.com/user-attachments/assets/90bc9cfc-ca30-45b4-8ff9-26ac8bccaf14" />


# Establishing VPC Peering Connections

Two VPCs were first created in the same region. The first was named `requester VPC` with IPV4 CIDR address block 192.168.0.0/16. While the second was named `accepter VPC` with the IPV4 CIDR address block `172.16.0.0/16.

<img width="1349" height="564" alt="image" src="https://github.com/user-attachments/assets/df7250a6-9767-4b61-872d-d50af171ed88" />

<img width="1366" height="592" alt="image" src="https://github.com/user-attachments/assets/6fa8402b-b154-4812-877c-b28363ddaeb0" />

<img width="1340" height="598" alt="image" src="https://github.com/user-attachments/assets/15c55874-a6e7-4689-bd2f-3bb6ed5a102f" />

<img width="1366" height="593" alt="image" src="https://github.com/user-attachments/assets/339de34f-4884-4d3e-a431-64533208de31" />


On the left side bar, `Peering Connections` option was selected and `Create peering` button was clicked.

<img width="1366" height="607" alt="image" src="https://github.com/user-attachments/assets/778e4fae-86d3-4472-8500-cafeffca1612" />

The name `my-first-VPC-peering` was provided in the space for name.
In the `Select a local VPC to peer with` section, `requeter VPC` was selected

<img width="973" height="608" alt="image" src="https://github.com/user-attachments/assets/a3f318b9-adf6-4a15-bf26-d56af3aae9bb" />

Under the `select another VPC to peer with` section, `My account`, `This Region` and `accepter VPC` were selected respectively.
`Create peering connection` button was clicked.

<img width="1224" height="604" alt="image" src="https://github.com/user-attachments/assets/3124f72c-d3d7-4e5b-ae03-0397a5a46ab3" />

At the top right corner of the peering connection page, the `Action` button was dropped down, and `Accept request` option was selected
The `Accept request` button was clicked.

<img width="1354" height="546" alt="image" src="https://github.com/user-attachments/assets/bf09296b-0f65-4c41-8c9e-7d8d6a577f2a" />


<img width="1354" height="546" alt="image" src="https://github.com/user-attachments/assets/46a65ef0-4df2-4e83-8c71-a8a4bf008486" />

on the `accepter VPC` page, the `main Route table ID` was clicked.

<img width="1358" height="612" alt="image" src="https://github.com/user-attachments/assets/c77f21f7-5e6d-4e92-921e-4a8734ab3ef3" />

The route table was chosen and route tab was selcted. The `Edit route` was clicked.

<img width="1361" height="594" alt="image" src="https://github.com/user-attachments/assets/5c0354e5-eb1a-4cd2-9b10-9e9a6af6a6d8" />

`Add route` was clicked. In the `Destination` section, `192.168.0.0/16` was chosen. `Peering connection` was selected in the `Target` section and the connection name `my-first-VPC-peering` was chosen.
`save changes` button was clicked.

<img width="1366" height="580" alt="image" src="https://github.com/user-attachments/assets/18261f5d-e745-44d4-ab71-f2523c29e885" />


 The `main Route table ID` of the requester VPC was clicked.
 The route table was chosen and route tab was selcted. The `Edit route` was clicked.
`Add route` was clicked. In the `Destination` section, `172.16.0.0/16` was chosen. `Peering connection` was selected in the `Target` section and the connection name `my-first-VPC-peering` was chosen.

<img width="1366" height="549" alt="image" src="https://github.com/user-attachments/assets/1be701ca-6adf-4984-9926-f7472fc39ee3" />

`save changes` button was clicked.

<img width="1366" height="526" alt="image" src="https://github.com/user-attachments/assets/9dd79ddc-d6c3-4518-b933-f5eff2a48d88" />

The connection between the two VPCs was successfully established.

## Conclusion

The project demonstrated AWS virtual private cloud design, implementation and configuration. major networking concepts with respect to AWS VPC were thoroughly simulated. Networking and cloud security best practices were also given serious consideration during the project design and implementation. Internet gateway and NAT gateway use cases were equally demonstrated.











 
 

 
