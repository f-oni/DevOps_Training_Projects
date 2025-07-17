# AWS IAM Management

The project aims to automate AWS Identity and Access Management (IAM) resources. A script is to be created to simulates a streamlined onboarding process for new DevOps employees at CloudOps solutions by automating user creation, group management and permission assigment for new hires.

## Task

The script was created with the name `aws-iam-management.sh`. The script creation process followed the steps listed below:

1. A function to check if AWS CLI was installed and configured was first created.
2. An array named `IAM_USER_NAMES` was defined in the script. The array contains the names of the five new hires.
3. A function to create new IAM users was next crafted by introducing a `for-loop` to iterate through the array.
4. A Function to create `admin` group and attach a policy. The function first checks if the "admin" group exits before it proceeds to creating it.
5. A function to add user to admin group. A second `for-loop` was introduced to iterate through the names in the array in order to add them to the group.
6. Main execution function. This function enbodies all the other functions. The first four functions were called sequentially in the main function, such that, at the end of the day, only the main function was called.

## The Script

The script is shown below:

```

 #!/bin/bash

  # AWS IAM Manager Script for CloudOps Solutions
  # This script automates the creation of of IAM users, groups and permissions

 # Verify AWS CLI is installed and configured

 # A function to verify AWS CLI installation verification

 aws_cli_installation_verification() {"\n  if [ ! command -v aws &> /dev/null ]; then\n   echo "Error: AWS CLI is not installed. Please install and configure it first."\n  exit 1\n  fi\n  echo \"\"\n"

 }
 

 # A function to create IAM users

  IAM_USER_NAMES=("John" "Mary" "Eric" "Jack" "Ade")

  create_iam_users() { "\n echo "Starting IAM user creation process......."\n  
echo "----------------------------------------"\n  for n in ${IAM_USER_NAMES[@]}\n  do\n  aws iam create-user --user-name $n\n  done\n  echo "----------------------------------------"\n  echo "IAM account creation completed"\n  
echo \"\"\n"
 }

 # Function to create admin group and attache policy

 create_admin_group() {"\n  # Creating admin group and attaching policy\n  
echo "Creating admin group and attachcing policy"\n  echo "----------------------------------------"\n  # Check if group already exists\n  
aws iam get-group --group-name "admin" > /dev/null 2>&1\n  aws iam create-group --group-name admin\n  # Attaching administrative policy\n  echo "Attaching administrative policy......"\n  aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess  --group-name admin\n  if [ $? -eq 0 ];\n  
 then\n  echo "Success: AdministratorAccess policy attached"\n  else\\n    echo "Error: Failed to attach AdministratorAccess policy"\n   fi\n  echo "----------------------------------------"\n  echo \"\"\n"

 }


 # A function to add user to admin group

 add_users_to_admin_group() {"\n  # Add Users to admin group\n  
echo "Adding users to admin group....."\n  echo "----------------------------------------"\n  for g in ${IAM_USER_NAMES[@]}\n  
 do\n  aws iam add-user-to-group --user-name $g --group-name admin\n  done\n  
echo "----------------------------------------"\n  echo "User group assignment process completed"\n  echo \"\"\n"

}

# Main execution function

 main() { "\n echo "====================================="\n   echo "AWS Management Script"\n  echo "====================================="\n aws_cli_installation_verification\n  create_iam_users\n  create_admin_group\n  add_users_to_admin_group\n  echo "====================================="\n  
echo "AWS IAM Management Completed"\n  echo "====================================="  echo \"\"\n" }
 
 # Execute the main function

 main

 exit 0

```

## Execution

The scritpt was successfully executed with the expected outcome.

<img width="738" height="449" alt="image" src="https://github.com/user-attachments/assets/ab2cc396-cc08-4e2b-ace5-ff0ea66c32d6" />


- Five users with the names: "John" "Mary" "Eric" "Jack" and "Ade" were created.
  

<img width="1352" height="465" alt="image" src="https://github.com/user-attachments/assets/b949e2c6-926f-4249-87e8-06d05252038c" />


- A group named `admin` was created with `AdministratorAccess` policy attached.
  

<img width="1366" height="516" alt="image" src="https://github.com/user-attachments/assets/70fb04b9-07d9-41df-a62c-46d157dd11f1" />


<img width="1093" height="525" alt="image" src="https://github.com/user-attachments/assets/bf5e35ac-d5bb-4692-8784-e441ebcdce0c" />


- All the five users were added to the admin group.
  

<img width="1366" height="573" alt="image" src="https://github.com/user-attachments/assets/41661968-5d1c-4ff5-b589-90d2e790f6e3" />

- AWS Management script completed successfully.


  # Conclusion
  
  The script successfully demonstrated the automation of AWS IAM resource management and deployment.



