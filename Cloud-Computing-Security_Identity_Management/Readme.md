# Cloud Computing-Security and Identity Management 

The project demonstrates how to configure security and identity management in a cloud environment. It uses AWS (IAM) as a case study. AWS Identity and Access Management (IAM) enables granular control and secure management of access to AWS resources and services. Users, User groups, Policies and enabling Multifactor Authentication (MFA) were utilized to successfully meet the project requirements. The scenario simulates a work environment by introducing a fin tech company called **Zappy e-Bank**.

## Zappy e-Bank Team

Zappy e-Bank is a hypothetical fintech startup company that has taken advatage of cloud technology to roll out its operations and services. Two teams would be utilizing AWS cloud services for their operations. The teams are: 

(1) The Developer-Team and <br>
(2) The Analyst-Team

The developers team comprise the back end developers that will be work with servers to test and spin up applications. For now, only one member of the team know as John is being introduced.The analyst team on the other hand, are the data analysts working for the company.

## Tasks

## Creating Policy for the Development Team

A policy is to be created to grant members of the development team access to all `EC2 instance` roles which include viewing running instances, creating instances, instance termination and other operations that partains EC2 instance. The following steps were taken to achieve the task:

Navigating to the Identity and access management (IAM) dashboard. The dashboard was visited in order to access the policy creation window.

<img width="1360" height="544" alt="image" src="https://github.com/user-attachments/assets/5850ce48-a867-4806-a72a-606710c2fa70" />


The `create policy` button at the top right conner of the policy pane was clicked. EC2 instance was searched for, in the `select a service` section. **All EC2 Actions** check box was checked. **All** was selected in the `Resources` section.


<img width="1363" height="518" alt="image" src="https://github.com/user-attachments/assets/f223cd95-b527-4e98-8558-6989286b0723" />


The policy was given the name `developers` and a description `policy for backend developers`. Finally, the `create policy` button was clicked to create the policy

<img width="1324" height="546" alt="image" src="https://github.com/user-attachments/assets/97bdaf13-ea38-4a94-9353-2c13c59ffad2" />

The customer managed policy named developers was successfully created.

<img width="1364" height="444" alt="image" src="https://github.com/user-attachments/assets/6b98d999-43c0-44c2-ada9-ba08d4cf290b" />



## Creating Policy for the Analyst Team

A similar policy is to be created to grant members of the analyst team access to all `S3 bucket` roles which include viewing S3 bucket dashboard, creating S3 buckets, uploading files and folders for storage, deleting files and folders as required, deleting S3 buckets that are no longer needed and performing other operations that partains S3buckets. The following steps were taken to achieve the task:

Navigating to the Identity and access management (IAM) dashboard. The dashboard was visited in order to access the policy pane.

<img width="1360" height="544" alt="image" src="https://github.com/user-attachments/assets/9795712f-f7ac-44c0-8405-30ac916de49a" />


The `create policy` button at the top right conner of the policy pane was clicked. S3 was searched for, in the `select a service` section. **All S3 Actions** check box was checked. The **All** radio box was selected in the `Resources` section.

<img width="1363" height="518" alt="image" src="https://github.com/user-attachments/assets/78c541b0-6fcc-4a6c-853a-aa1b79825be6" />

The policy was given the name `analyst` and a description `policy for data analysts`.  Finally, the `create policy` button was clicked to create the policy.

<img width="1137" height="505" alt="image" src="https://github.com/user-attachments/assets/b424ffb5-dea9-486c-a3fb-f6dfdc577e39" />


The customer managed policy named `analyst` was successfully created.

<img width="1366" height="446" alt="image" src="https://github.com/user-attachments/assets/91a7db74-9c1e-49c7-9da5-5b21f2eec404" />

## Creating the Development Team

In the IAM dashboard, at the left pane, `user group` was sellected to reveal the user group creation window. The user group name `Development-Team` was entered in the provided space. The `developer` policy that was created earlier was attached to the group being created. The policy ensures that members of the group is granted all EC2 privileges.

<img width="1077" height="524" alt="image" src="https://github.com/user-attachments/assets/876f84a2-546b-40d5-9627-630e9985de0d" />

<img width="1106" height="376" alt="image" src="https://github.com/user-attachments/assets/80a1892e-8447-4081-8cc7-1398a0b43719" />

## Creating the Analyst Team

In the IAM dashboard, at the left pane, `user group` was sellected to reveal the user group creation window. The user group name `Analyst-Team` was entered in the provided space. The `analyst` policy that was created earlier was attached to the group being created. The policy ensures that members of the group is granted all S3 privileges.

<img width="1075" height="472" alt="image" src="https://github.com/user-attachments/assets/2febfb11-19a6-4c95-9655-0669bf437937" />

<img width="1067" height="350" alt="image" src="https://github.com/user-attachments/assets/bec85b50-adf1-4630-b845-1462e9abb96d" />

## Creating IAM USERS

IAM users for both the development and analyst teams will be created. 

## Creating IAM User for John

John is a back end developer and needs access to EC2 privileges. Therefore he would be added to the development-team. So that he will automatically inherit all the privileges assigned to the group. In the IAM dashboard, `user` was selected at the left pane to bring up the user creation window. The user details were provided as follows:

- user name: John
- Provide user access to AWS management console check box was checked
- I want to create IAM yser radio button was selected
- User password was provided
- Set permissions: `Add user to group` radio botton was selected and John was added to the `Development-Team`
- The  `create user button was finally clicked and the user "John" was successfuly created. The `CSV file` for John's credential was downloaded.

<img width="1033" height="514" alt="image" src="https://github.com/user-attachments/assets/0d8157c7-0694-4a66-8803-9558cd365ce0" />


<img width="1032" height="494" alt="image" src="https://github.com/user-attachments/assets/c91136f9-ea62-4482-96f5-18f44323a286" />


<img width="1089" height="520" alt="image" src="https://github.com/user-attachments/assets/7f32ba78-5d62-4855-ad97-d525c5c07f32" />


<img width="808" height="463" alt="image" src="https://github.com/user-attachments/assets/d2245152-0d30-49bc-9116-d351a04398ac" />


<img width="1348" height="541" alt="image" src="https://github.com/user-attachments/assets/7344a4f7-6777-4b23-b4df-2ea53f0d4f86" />



## Creating IAM User for Mary

Mary has been introduced as a data analyst and should have S3 privileges. For her to automatically inherit all the privileges assigned to the Analyst-Team, she would be added to the group. In the IAM dashboard, `user` was selected at the left pane to bring up the user creation window. The user details were provided as follows:

- user name: Mary
- Provide user access to AWS management console check box was checked
- I want to create IAM yser radio button was selected
- User password was provided
- Set permissions: `Add user to group` radio botton was selected and Mary was added to the `Analyst-Team`
- The  `create user button was finally clicked and the user "Mary" was successfuly created. The `CSV file` for Mary's credential was downloaded.

<img width="1018" height="489" alt="image" src="https://github.com/user-attachments/assets/c0624627-0d70-4e9e-a6db-27f40c8760c8" />

<img width="1057" height="411" alt="image" src="https://github.com/user-attachments/assets/fbfcb432-b030-4474-b2ee-1eb14692ff24" />

<img width="1049" height="503" alt="image" src="https://github.com/user-attachments/assets/37503915-1123-4d3f-a92d-b3c276b23d02" />

<img width="775" height="433" alt="image" src="https://github.com/user-attachments/assets/9fd9d598-cc46-48f6-a252-0bbe78f45e14" />

<img width="1336" height="512" alt="image" src="https://github.com/user-attachments/assets/076254fb-b29a-4257-9d23-df3965574798" />


## Testing and Validation

## Testing and Validating John's Access and Permissions

The AWS management console was logged into using John's credentials. The action was successful as shown below:

<img width="1351" height="488" alt="image" src="https://github.com/user-attachments/assets/bf3cd27c-571b-41d3-84fc-215d0912aac5" />

The Ec2 dashbaoard was viewed to confirm if there are running instances. An EC2 instance t3.micro Ubuntu server named `dev_server was successfully launched.

<img width="1358" height="575" alt="image" src="https://github.com/user-attachments/assets/164ab762-cf3c-49c3-ad71-2404f7d71536" />

<img width="1361" height="564" alt="image" src="https://github.com/user-attachments/assets/e9a3937d-7180-490e-836b-cedcbd110671" />

The launched EC2  was eventually terminated successfully.

<img width="1097" height="482" alt="image" src="https://github.com/user-attachments/assets/322f06ba-f6ae-4bc9-bbf4-2235802c25f6" />

An attempt was made to create an S3 bucket with John's credential but access was denied. see screen shot below

<img width="1364" height="580" alt="image" src="https://github.com/user-attachments/assets/e4e5c9f1-2ca6-466b-bcbc-d655f5d1a7fb" />

Another attempt was made to view the storage lens dashbaord, again, an error was thrown which states: `You don't have permissions to view this storage lens dashboard`. The screen shot is shown below:

<img width="1324" height="378" alt="image" src="https://github.com/user-attachments/assets/18d99d4f-42e8-4406-963c-873ad376d713" />


## Testing and Validating Mary's Access and Permissions

The AWS management console was logged into using Mary's credentials. The action was successful as shown below:

<img width="1357" height="602" alt="image" src="https://github.com/user-attachments/assets/d94d535d-0e0a-4a3a-adc2-fe2c1fba1da2" />

S3 dashboard was successfully viewed. An S3 bucket named `bucket-analyst-team was created without any restriction.

<img width="1308" height="509" alt="image" src="https://github.com/user-attachments/assets/8846f60d-896b-4e03-bb39-497ca324372d" />

<img width="1319" height="505" alt="image" src="https://github.com/user-attachments/assets/75d57b03-4c29-4a69-bc69-671f80e17d38" />

Afile named `07.txt` was uploaded to the newly created S3 bucket

<img width="1355" height="549" alt="image" src="https://github.com/user-attachments/assets/13eb5603-ec4d-4b6d-a3d7-17274ef4bd31" />

The uploaded file was deleted 

<img width="1306" height="510" alt="image" src="https://github.com/user-attachments/assets/519e5b2b-c8fc-4fc2-bde0-53025bec43b0" />

The S3 bucket `bucket-analyst-team was deleted successfully as shown below:

<img width="1345" height="493" alt="image" src="https://github.com/user-attachments/assets/6f7f28f2-6592-49f6-8a17-fb7049e3a944" />

<img width="1333" height="428" alt="image" src="https://github.com/user-attachments/assets/9785ac25-11d2-4938-9842-8611e32bf74c" />

An attempt was made to view the Ec2 dashboard or launch an instance but the actions were denied with the error message `You are not authorized to perform this operation`

<img width="1149" height="428" alt="image" src="https://github.com/user-attachments/assets/df2fc6ef-e68d-4185-8730-d0a818efb13a" />

## Multi-Factor Authentication

Multi-factor authentication is a security feature that adds extra layer of AWS accounts and resources. 
The following steps were followed to set up multi-factor authentication for John.

- In the IAM dashboard, the user John was selected.
- Enable MFA was clicked
- Device name was provided in the box
- Authentication app was selected
- Microsoft authentication app was installed on a mobile phone
- Show QR Code was clicked which was scanned by the installed authentication app
- The first set of generated numbers from the app were entered in the first box and the second box was filled after 30 seconds by another set of generated numbers by the app.
- MFA was successfully set up for John

  <img width="1366" height="547" alt="image" src="https://github.com/user-attachments/assets/185eaaa9-8941-484b-b105-34bc9545b8d5" />

  <img width="1121" height="500" alt="image" src="https://github.com/user-attachments/assets/fa828ffc-a455-4311-96e9-8d21d5cced6a" />

  <img width="688" height="552" alt="image" src="https://github.com/user-attachments/assets/5a1454b8-efba-45ec-9e58-f67a5cf7996a" />

  <img width="1045" height="643" alt="image" src="https://github.com/user-attachments/assets/77228d5b-a268-4b90-bfc7-083a7fa536cd" />

  <img width="1366" height="542" alt="image" src="https://github.com/user-attachments/assets/6efa2ab8-3410-47e7-b82b-e19daed8e33c" />


  The following steps were followed to set up multi-factor authentication for Mary.

- In the IAM dashboard, the user Mary was selected.
- Enable MFA was clicked
- Device name was provided in the box
- Authentication app was selected
- Microsoft authentication app was installed on a mobile phone
- Show QR Code was clicked which was scanned by the installed authentication app
- The first set of generated numbers from the app were entered in the first box and the second box was filled after 30 seconds by another set of generated numbers by the app.
- MFA was successfully set up for Mary

  <img width="1086" height="530" alt="image" src="https://github.com/user-attachments/assets/2deace37-6417-4529-a162-c0956105172f" />

  <img width="926" height="476" alt="image" src="https://github.com/user-attachments/assets/9737c926-f8c4-4ce6-a505-8b9e897fb9c7" />

  <img width="1166" height="516" alt="image" src="https://github.com/user-attachments/assets/cfdccee7-8f06-40ba-b2f7-1290de083e5f" />

  ## Conclusion

The project provided insights into some security and access management features available in Amazon Web Servcices. Identity and access management (IAM) in AWS acts as a central point for managing users, security credentials, and permissions for accessing AWS resources. It helps to enforce security best practices by controlling access and enabling features like multi-factor authentication (MFA).
IAM simplifies administration by allowing the administrator to create users, group them together, and manage their permissions collectively. By limiting access to resources, IAM protects your AWS environment from unauthorized access and potential misuse










































