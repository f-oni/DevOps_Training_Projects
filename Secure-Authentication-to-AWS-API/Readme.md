# Setting up Secure Authentication to AWS API

The project provides guidelines to create secure access to AWS API. An AWS API, or Amazon Web Services Application Programming Interface, is the mechanisms and services provided by AWS that allow applications to interact with AWS services and resources. IAM roles, policies and users were utilized to achieve the project's objectives.The following steps were followed for the project implementation:

1. Creating an IAM Policy
2. Creating an IAM Role
3. Creating an IAM User
4. Creating Programmatic Access Credentials
5. Assigning User to the IAM Role
6. Attaching the IAM Policy to the User
7. AWS CLI Intallation and Configuration.
8. Testing the AWS CLI Configuration
   

## Creating an IAM Policy

The `Policies` option was selected in the side bar of the `IAM` dashboard and the `Create policy` button was clicked to beging the process of policy creation.

<img width="1307" height="587" alt="image" src="https://github.com/user-attachments/assets/607f799c-83e4-4dee-a93e-ae2beeb74907" />

In the `Specify Permissions` section, S3 was chosen and followed by checking the `Allow S3 actions`.

<img width="1326" height="519" alt="image" src="https://github.com/user-attachments/assets/cba7f05d-b222-4193-a6a9-06514c50211d" />

`All resources` radio button was selected.

<img width="1342" height="508" alt="image" src="https://github.com/user-attachments/assets/b8d3ea7f-1e68-4d87-91a5-6db47459a0fa" />

`Add more permissions` button was clicked to add permissions for EC2 as required.
EC2 was chosen, the `all EC2 actions` check box was checked and `All resources` radio button was also selected.

<img width="1310" height="511" alt="image" src="https://github.com/user-attachments/assets/d01884ee-78bd-4e8d-bd03-34545d6c2773" />

<img width="1310" height="525" alt="image" src="https://github.com/user-attachments/assets/155f4fe9-a77b-4d48-9364-1c53b838c717" />


The policy was given the name `Policy-for-S3-EC2` and the `Create Policy` button was clicked to create the policy

<img width="1320" height="512" alt="image" src="https://github.com/user-attachments/assets/694adb6c-c3b0-4367-8321-945dfd72e8be" />

The policy created ensures that full access is granted for S3 and EC2 services.

<img width="1319" height="513" alt="image" src="https://github.com/user-attachments/assets/9040881a-b5ee-4365-952d-60a5efbf6cdb" />



## Creating an IAM Role

The `Roles` option was selected in the side bar of the `IAM` dashboard and the `Create role` button was clicked to beging the process of role creation.

<img width="1357" height="507" alt="image" src="https://github.com/user-attachments/assets/a9e5af15-bb62-4e3d-b750-c53cfd845604" />

`AWS account` was selected in the `Trusted entity type` section.

<img width="1361" height="570" alt="image" src="https://github.com/user-attachments/assets/cae1e804-ecd5-439a-9e85-be902d0dec78" />

`This account` was selected in the `an AWS account section`, followed by the `next` button.

<img width="1363" height="553" alt="image" src="https://github.com/user-attachments/assets/63d57fb5-1bed-4317-9ea6-d733a529cded" />

A customer-managed policy named `Policy-for-S3-EC2` that was created earlier was selected.

<img width="1359" height="565" alt="image" src="https://github.com/user-attachments/assets/fc8642fa-5214-40bb-bdff-13a52324e100" />

Role name `S3-EC2-Role` was provided as well as a description for the role.

<img width="1366" height="573" alt="image" src="https://github.com/user-attachments/assets/8bdeda93-2bc6-45ef-97f5-c75c518e4bf7" />


## Creating an IAM User

The `Users` option was selected in the side bar of the `IAM` dashboard and the `Create user` button was clicked to beging the process of user creation.

<img width="1364" height="556" alt="image" src="https://github.com/user-attachments/assets/06030946-f12e-4f6b-ab46-0e5d8c4c4d74" />

A user name `automation_user` was provided for the user. The option `Provide user access to the AWS management console` was left unchecked as the user is to be provided with programmatic access credentials. 

<img width="1365" height="572" alt="image" src="https://github.com/user-attachments/assets/a61c6b67-b375-4113-be73-cdf3d09df670" />

The `create user` button was clicked to create the user.

## Creating Programmatic Access Credentials
The `Security Credentials` tab of the automation_user page was selected to create access key. The `create access key` button was clicked.

<img width="1366" height="565" alt="image" src="https://github.com/user-attachments/assets/0e34809c-db05-4808-bb03-32123377db2d" />

<img width="1351" height="512" alt="image" src="https://github.com/user-attachments/assets/d4c578da-decb-45f3-b488-46b83ea44c37" />


In the `Use case` section, `Command Line Interface (CLI)` was selected.

<img width="1212" height="475" alt="image" src="https://github.com/user-attachments/assets/775c4995-5225-4187-8238-29d7b672607a" />

A description was given to the key on the next page and the `create access key` button was clicked.

<img width="1318" height="535" alt="image" src="https://github.com/user-attachments/assets/23eb89a1-0731-40e2-958d-692c7022e418" />


The CSV file was downloaded for future use.

## Assigning User to the IAM Role

The role created in the previous section named `S3-EC2-Role` was selected and the `Trust relationships` tab was then clicked. 

<img width="1366" height="600" alt="image" src="https://github.com/user-attachments/assets/fa7601c6-0ffb-468b-99ed-ef2f953f8e49" />

The `Edit trust policy` button was clicked to edit the `Principal element` within the Statement of the JSON file.

<img width="1364" height="574" alt="image" src="https://github.com/user-attachments/assets/e7a85987-b081-4af1-936f-bf7050e0fb9f" />

The ARN of the automation_user was copied and pasted to the `Principal element` section as shown below:

<img width="1073" height="527" alt="image" src="https://github.com/user-attachments/assets/3172b2b3-a883-4d08-8061-f29187bdbe5d" />

The policy was then updated to effect the change.

## Attaching the IAM Policy to the User

The `automation_user` page was opened for policy attachement. The `add permissions` button was clicked to add the policy.

<img width="1362" height="558" alt="image" src="https://github.com/user-attachments/assets/8aff3947-c296-4a08-a076-11af6581cc70" />

`attache policies directly` was selected and customer-managed policy with the name `Policy-for-S3-EC2` was selected.

<img width="1352" height="568" alt="image" src="https://github.com/user-attachments/assets/4731cbf0-0ee8-41a6-823f-de48e7160f79" />

<img width="1299" height="598" alt="image" src="https://github.com/user-attachments/assets/0231e305-56df-44d3-9739-f1387d744720" />


Finally, the `Add Permissions` button was clicked.

<img width="1364" height="528" alt="image" src="https://github.com/user-attachments/assets/253bebab-7dbf-462c-abfa-9d9352513606" />


## AWS CLI Intallation and Configuration on Ubuntu

The AWS CLI was downloaded and installed using the following commands:

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

sudo ./aws/install

```
The installation was verified with the command:

```
aws --version

```

<img width="750" height="351" alt="image" src="https://github.com/user-attachments/assets/6c8b3313-5735-449b-be16-c8d34ba5ff1c" />


AWS CLI was configured using the command:

```
aws configure

```

The following credentials were provided to complete the configuration:
The access key ID, secret access key, default region name and default output format.

<img width="731" height="290" alt="image" src="https://github.com/user-attachments/assets/35cd3049-91cd-48a0-9029-7fa5a3127f38" />


## Testing the AWS CLI Configuration

The following command was used to test the configuration:

```
aws ec2 describe-regions --output table

```
The ouput was successful as shown below. 

<img width="996" height="615" alt="image" src="https://github.com/user-attachments/assets/3bf0df96-6830-401e-8fb7-a19d4775738a" />


## Conclusion

The project helped to consolidate the the realationship between IAM roles, policies and users.
