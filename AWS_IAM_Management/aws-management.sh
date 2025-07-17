  #!/bin/bash

  # AWS IAM Manager Script for CloudOps Solutions
  # This script automates the creation of of IAM users, groups and permissions

 # Verify AWS CLI is installed and configured

 # A function to verify AWS CLI installation verification

 aws_cli_installation_verification() { if [ ! command -v aws &> /dev/null ];
 then 
        echo "Error: AWS CLI is not installed. Please install and configure it
        first."
        exit 1
 fi

 }
 

 # A function to create IAM users

  IAM_USER_NAMES=("John" "Mary" "Eric" "Jack" "Ade")

  create_iam_users() { echo "Starting IAM user creation process......."

  echo "----------------------------------------"

 for n in ${IAM_USER_NAMES[@]}
 do
         aws iam create-user --user-name $n

done

  echo "----------------------------------------"

  echo "IAM account creation completed"
 }

 # Function to create admin group and attache policy

 create_admin_group() {  # Creating admin group and attaching policy

 echo "Creating admin group and attachcing policy"

 echo "----------------------------------------"

 # Check if group already exists

 aws iam get-group --group-name "admin" > /dev/null 2>&1

 aws iam create-group --group-name admin

 # Attaching administrative policy

 echo "Attaching administrative policy......"

 aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess  --group-name admin

 if [ $? -eq 0 ];
 then
         echo "Success: AdministratorAccess policy attached"
 else
         echo "Error: Failed to attach AdministratorAccess policy"

 fi

 echo "----------------------------------------"

 }


 # A function to add user to admin group

 add_users_to_admin_group() {  # Add Users to admin group

 echo "Adding users to admin group....."

 echo "----------------------------------------"

 for g in ${IAM_USER_NAMES[@]}

 do
         aws iam add-user-to-group --user-name $g --group-name admin

 done

 echo "----------------------------------------"

 echo "User group assignment process completed"

}

# Main execution function

 main() { echo "====================================="
	 
	 echo "AWS Management Script"

	 echo "====================================="

	 aws_cli_installation_verification

	 create_iam_users

	 create_admin_group

	 add_users_to_admin_group

	 echo "====================================="

	 echo "AWS IAM Management Completed"

	 echo "====================================="

 }
 
 # Execute the main function

 main

 exit 0

