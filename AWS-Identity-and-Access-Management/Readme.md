# AWS Identity and Access Management

The project demonstrates how to effectively and efficiently work with AWS Identity and Access Management (IAM). It explores its core components with attention to best practices. The AWS IAM to be demonstrated are:

1. User
2. User Group
3. Policy and
4. Role

To simulate a real life scenario, the project introduces a fictitious growth marketing consultancy company named `GatoGrowFast.com`. Three employees of the company would be granted access to their AWS cloud platform. Each of them will be granted fine grained access to the resources and services they need for their work. The names of the employees are: Eric, Jack, and Ade. To accomplish the tasks, The following steps will be followed:

- A policy will be created
- A user named Eric will be created
- The Policy with the name `policy_for_eric` will be attached to the user Eric
- A group with the name `Development-Team` will be created 
- Users `Jack` and `Ade` will be created
- Jack and Ade will be added to the `Development-Team` group
- A second policy with the name `development-policy` will be created and the policy will be attached to the Development-Team.

  ## Part One

  ## Creating a Policy

 -  In the IAM dashboard, at the left pane, `policies` was clicked to initiate the policy creation process.
 -  EC2 was searched and `AmazonEC2FullAccess` was selected

   <img width="1365" height="601" alt="image" src="https://github.com/user-attachments/assets/a3d0ccb3-f9d1-466c-90e8-866d0c2320a2" />

 - `All EC2 action` was chosen

   <img width="1332" height="531" alt="image" src="https://github.com/user-attachments/assets/6e7cfd3a-665a-40f2-8f6a-3d15329bd3f9" />

 - Under `Resources, the `All Resources` radio button was selected
 - The policy was named: `policy_for_eric` and a description `EC2 full access for Eric` was given to the policy

   <img width="1166" height="496" alt="image" src="https://github.com/user-attachments/assets/f86b8eb0-1aac-4d29-9349-f0cc8f615717" />

 - The `create policy` button was clicked to finally create the policy.
 - The policy was successfully created.

   <img width="1083" height="278" alt="image" src="https://github.com/user-attachments/assets/04400046-dfad-4aad-8770-2bff37f27165" />


   ## Creating a User

   To create a user named `Eric`, the following steps will be followed:

   - In the IAM dashboard, at the left pane, `Users` was clicked to initiate the user creation process
   - The name `Eric` was provided in the `User name` box
   - The check box `Provide user access to the AWS management console` was checked
   - `I want to create an IAM user` radio button was selected

     <img width="1341" height="545" alt="image" src="https://github.com/user-attachments/assets/500a9470-213d-4fa5-98b9-eb2505c00178" />

   - A custom password was provided and the `next` button was clicked
   - In the `Set Permissions` section, `Attach policies directly` was selected.

     <img width="1355" height="519" alt="image" src="https://github.com/user-attachments/assets/ae75d8f0-8843-4364-a7bd-c03b7377affb" />

   - The customer-managed policy named `policy_for_eric` that was previously created was attached to the user Eric
   - The `Create User` button was clicked to create the user.
   - The user `Eric` was successfully created with an attached policy that grants him full access to EC2.

     <img width="1330" height="254" alt="image" src="https://github.com/user-attachments/assets/df4ca759-ceb7-407f-9e80-93fc3c873bfe" />

   - Eric's credentials was downloaded in CSV format for future reference.


   ## Part Two

   ## Creating a Group

  - In the IAM dashboard, at the left pane, `User groups` was clicked to initiate the group creation process.
  - User group name was provided as `Development-Team in the box for it.

    <img width="1361" height="431" alt="image" src="https://github.com/user-attachments/assets/19df3d83-8325-4e74-a269-b61eed26bb08" />

  - The `Create Group` button was clicked to create the `Development-Team` group
  - The group was created successfully

 ## Creating  Other users

 Two users with the names Jack and Ade are to be created. These users would be added to the developement-team. The user creation process was again followed for each of the users.

 ## The User-Jack

 - In the `Users` section of the IAM dashboard, at the left pane, `Users` was clicked to initiate the user creation process
 - The name `Jack` was provided in the `User name` box.
 - The check box `Provide user access to the AWS management console` was checked
 - `I want to create an IAM user` radio button was selected
   
   <img width="1366" height="556" alt="image" src="https://github.com/user-attachments/assets/8a15eb0b-f349-4713-9b6d-2fb3ee6507e4" />

 - A custom password was provided and the `next` button was clicked
 - In the `Set Permissions` section, `Add user to group` was selected
 - Under the `user groups` section, `Development-Team` was selected. This is to ensure that the user `Jack` is added to the group.

   <img width="1359" height="532" alt="image" src="https://github.com/user-attachments/assets/50b3ecc5-bd32-4e6f-b276-ec59bfbef514" />

 - The `Create User` button was clicked to create the user.
 - The user `Jack` belonging to the `Development-Team` was successfully created.

   <img width="1357" height="306" alt="image" src="https://github.com/user-attachments/assets/1a2e34f3-3bfa-4828-b665-ed55d3a4baa6" />

   

 ## The User-Ade

 - In the `Users` section of the IAM dashboard, at the left pane, `Users` was clicked to initiate the user creation process
 - The name `Ade` was provided in the `User name` box
 - The check box `Provide user access to the AWS management console` was checked

   <img width="1354" height="563" alt="image" src="https://github.com/user-attachments/assets/6479347d-1c06-4215-8acc-2f90262e766b" />

 - `I want to create an IAM user` radio button was selected
 - A custom password was provided and the `next` button was clicked

   <img width="1281" height="558" alt="image" src="https://github.com/user-attachments/assets/f7778620-2b00-415f-bb13-0b3a90837910" />

 - In the `Set Permissions` section, `Add user to group` was selected

 - Under the `user groups` section, `Development-Team` was selected. This is to ensure that the user `Ade` is added to the group.

   <img width="1360" height="519" alt="image" src="https://github.com/user-attachments/assets/f61766dd-9ee2-4890-aeee-1bc100bc0487" />

 - The `Create User` button was clicked to create the user.
 - The user `Ade` belonging to the `Development-Team` was successfully created.

<img width="1363" height="288" alt="image" src="https://github.com/user-attachments/assets/626ae6a6-4027-44f4-bf09-2f420fbe0914" />



 ## Creating a Policy for the Development Team

 -  In the IAM dashboard, at the left pane, policies was clicked to initiate the policy creation process.

   <img width="1366" height="531" alt="image" src="https://github.com/user-attachments/assets/baa4700a-1213-4e37-b5a1-d1d479f71457" />

 -  Under `Specify Permissions`, `EC2` and `S3` were selected from the available options

   <img width="1347" height="525" alt="image" src="https://github.com/user-attachments/assets/3cd7b9ca-41cd-4601-b635-40e5ab3af48c" />

 - `All EC2 actions`and `All S3 actions` were chosen
 - Under `Resources, the `All Resources` radio button was selected both Ec2 and S3
 - The policy was named: `development-policy` and a description `EC2 and S3 full access for the development team` was given to the policy

  <img width="1321" height="553" alt="image" src="https://github.com/user-attachments/assets/f68a4940-7685-4dbd-a03f-a149e0132a81" />

 - The `create policy` button was clicked to finally create the policy.
 - The policy was successfully created.

   <img width="1089" height="307" alt="image" src="https://github.com/user-attachments/assets/c7013c5c-5ea7-4528-a4d1-cef0c12a867c" />


## Policy Attachment to Group

- In the User groups section, the development-group was selected
- In the `Permissions section` The `Add permissions` tab was dropped down to select `attach policies`

  <img width="1362" height="563" alt="image" src="https://github.com/user-attachments/assets/8bfd91d2-127c-4399-bb56-85f671f7c02a" />

- The customer managed policy named: development-policy created earlier was selected.

  <img width="1366" height="535" alt="image" src="https://github.com/user-attachments/assets/8e99d8b5-50a0-4327-94dd-698bae610870" />

- The `Attach Policy` button was clicked to finally attach the policy to the group.
- The development-policy was successfully attached to the development-team.

  <img width="1119" height="540" alt="image" src="https://github.com/user-attachments/assets/d72c6f62-a4a2-4c1d-bb8d-1c957344d815" />


  ## Conclusion

  The project explored the core elements of the AWS IAM. The elements demonstrated in the project included: Users, groups and policies. 

 


 


   

   
   
  
