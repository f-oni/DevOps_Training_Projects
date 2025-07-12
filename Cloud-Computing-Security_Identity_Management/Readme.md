# Cloud Computing-Security and Identity Management 

The project demonstrates how to configure security and identity management in a cloud environment. It uses AWS (IAM) as a case study. AWS Identity and Access Management (IAM) enables granular control and secure management of access to AWS resources and services. Users, User groups, Policies and enabling Multifactor Authentication (MFA) were utilized to successfully meet the project requirements. The scenario simulates a work environment by introducing a fin tech company called **Zappy e-Bank**.

## Zappy e-Bank Team

Zappy e-Bank is a hypothetical fintech startup company that has taken advatage of cloud technology to roll out its operations and services. Two teams would be utilizing AWS cloud services for their operations. The teams are: 

(1) The Developers Team and
(2) Tha Analysts Team

The developers team comprise the back end developers that will be work with servers to test and spin up applications. For now, only one member of the team know as John is being introduced.The analyst team on the other hand, are the data analysts working for the company.

## Tasks

## Creating Policy for the Development Team

A policy is to be created to grant members of the development team access to all `EC2 instance` roles which include viewing running instances, creating instances, instance termination and other operations that partains EC2 instance. The following steps were taken to achieve the task:

Navigating to the Identity and access management (IAM) dashboard. The dashboard was visited in order to access the policy pane.

<img width="1360" height="544" alt="image" src="https://github.com/user-attachments/assets/5850ce48-a867-4806-a72a-606710c2fa70" />

The create policy button at the top right conner of the policy pane clicked

<img width="1363" height="518" alt="image" src="https://github.com/user-attachments/assets/f223cd95-b527-4e98-8558-6989286b0723" />

The policy was given the name `developers` and a description `policy for backend developers`.

<img width="1324" height="546" alt="image" src="https://github.com/user-attachments/assets/97bdaf13-ea38-4a94-9353-2c13c59ffad2" />


The customer managed policy named developers was successfully created.

<img width="1364" height="444" alt="image" src="https://github.com/user-attachments/assets/6b98d999-43c0-44c2-ada9-ba08d4cf290b" />



## Creating Policy for the Analyst Team

A similar policy is to be created to grant members of the analyst team access to all `S3 bucket` roles which include viewing S3 bucket dashboard, creating S3 buckets, uploading files and folders for storage, deleting files and folders as required, deleting S3 buckets that are no longer needed and performing other operations that partains S3buckets. The following steps were taken to achieve the task:

Navigating to the Identity and access management (IAM) dashboard. The dashboard was visited in order to access the policy pane.

<img width="1360" height="544" alt="image" src="https://github.com/user-attachments/assets/9795712f-f7ac-44c0-8405-30ac916de49a" />


The create policy button at the top right conner of the policy pane clicked

<img width="1363" height="518" alt="image" src="https://github.com/user-attachments/assets/78c541b0-6fcc-4a6c-853a-aa1b79825be6" />

The policy was given the name `analyst` and a description `policy for data analysts`.

<img width="1137" height="505" alt="image" src="https://github.com/user-attachments/assets/b424ffb5-dea9-486c-a3fb-f6dfdc577e39" />


The customer managed policy named `analyst` was successfully created.

<img width="1366" height="446" alt="image" src="https://github.com/user-attachments/assets/91a7db74-9c1e-49c7-9da5-5b21f2eec404" />





