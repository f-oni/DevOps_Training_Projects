# Creating AWS Resources with Functions and Array

The project provides a step-by-step guide on how to develop an automation script for AWS cloud resources deployment. Two functions were written in the script for the creation of EC2 instances and S3 buckets. The following shell scripting concepts were utilized to achieve the desired result.

1. Functions
2. Arrays
3. Environment variables
4. Command Line Arguments
5. Error Handling


# Script Development Procedure

Braintrust solutions has been introduced as a company employed to develop a script that automates the creation of EC2 instances and setup S3 buckets for five departments, namely: Marketing, Sales, HR, Operations and Media. 

## Basic Prerequisite for EC2 Instances

**Amazon Machine Image (AMI) ID:** This launches the instance.<br>
**EC2 instance type:** Ensure that the selected instance type is compatible with the AMI ID.<br>
**VPC and subnet IDs:** The instance launches from these.<br>
**Security group ID:** Users must assign one to the instance. For newly created security groups, users should assign an ID before they launch the EC2 instance.<br>
**EC2 key pair name** Without it, users cannot use Secure Shell to connect to the EC2 instance or access it through Windows Remote Desktop.


### Functions

Two functions were created in the script. The first function creates EC3 instances while the second is meant to create S3 buckets for five department in the company. The procedure and CLI commands required were gotten from the EC2 AWS CLI Command reference <a href="https://docs.aws.amazon.com/cli/latest/reference/ec2/">AWS official documentation</a>.

<img width="1364" height="626" alt="image" src="https://github.com/user-attachments/assets/855f143f-f589-48bd-864e-40493e8dc298" />

Under the `Available Commands` section of the located, and `CTRL + F` on the keyboard was typed to bring up a search bar. `run-instances was typed in the search bar to be taken directly to the Ec2 instance run command.

<img width="1366" height="632" alt="image" src="https://github.com/user-attachments/assets/44a49b28-4376-4f27-bf77-93faed5ed7ba" />

The same process was followed to get the CLI command for S3 bucket. The two functions to be developed in the script are:

1. A function for provisioning EC2 instances
2. A function for Setting up S3 buckets

### Creating a Keypair

A key pair is require as part of the parameters for creating EC2 instances. A new key pair was created from the console. At the the EC2 instance dashboard, the `key pairs` option was selected in the side bar and a name was given to the key pair as `folu-key`.

<img width="1365" height="565" alt="image" src="https://github.com/user-attachments/assets/2252c2eb-1883-4793-bf6a-46ca6f1049ee" />


Under the `Private key file format` section, the `.pem` radio button was selected and the `create key pair` button was clicked.


<img width="1227" height="570" alt="image" src="https://github.com/user-attachments/assets/768c25fa-8c66-4ee4-890e-fef8bf16263e" />


The key pairs was successfully created.


<img width="1130" height="426" alt="image" src="https://github.com/user-attachments/assets/7d2e613a-0d68-4d69-a3a8-cfecfe777b81" />



### A function for Provisioning EC2 Instances

Some enviroment variables were set to store some configuration details. This approach enhances script reusability and simplifies management of sensitive or frequently changing parameters. The following were set for this implementation.

```
AWS_REGION="<region>"
AMI_ID="<AMI-ID>"
INSTANCE_TYPE="<instance-type>"
KEY_NAME="<ec2-keypair>"
COUNT="<number-of-instance>"

```

A sample script for creating EC2 instances is shown below

```
    aws ec2 run-instances \
        --image-id "ami-0cd59ecaf368e5ccf" \
        --instance-type "t2.micro" \
        --count 3 \
        --key-name folu-keypair \
        --region eu-north-1

```

Error handling was built into the function to check if the instances were created successfully. A logic to verify the deployment status and to handle error was incoporated. In this case, `$?`, a special variable, was used to hold the exit status of the last executed command. It checks if the `aws ec2 run-instances` was successful. Exit status that is equal to zro (0) is interpreted as successful.

When the pieces are brought together we have the following function to create EC2 instances.

```
#!/bin/bash

# Function to create EC2 instances

create_ec2_instances() {"\n\n    # Specify the parameters for the EC2 instances\n    instance_type=\"t2.micro\"\n    ami_id=\"ami-0cd59ecaf368e5ccf\"  \n    count=3  # Number of instances to create\n    region=\"eu-north-1\" # Region to create cloud resources\n    \n    # Create the EC2 instances\n    aws ec2 run-instances \\\n        --image-id \"$ami_id\" \\\n        --instance-type \"$instance_type\" \\\n        --count $count\n        --key-name folu-key\n        \n    # Check if the EC2 instances were created successfully\n    if [ $? -eq 0 ]; then\n        echo \"EC2 instances created successfully.\"\n    else\n        echo \"Failed to create EC2 instances.\"\n    fi\n"}

# Call the function to create EC2 instances
create_ec2_instances


``` 



#### A function to Setup S3 Buckets and Introducing Array

To meet up with the requirements of creating five distinct S3 buckets for five departments in the organization, an array is declared to hold the names of the departments. The departments are: Marketing, Sales, HR, Operations and Media respectively. A loop will iterate through the array to create S3 buckets for each of the derpartments with unique names assigned accordingly. 
The function began with a variable named company and a value: `braintrust` was assigned to it. The variable will serve as prefix to all the S3 bucket names, which will ensure uniqueness. 
An array named `department was then, declared. This, contains the names of the five departments for which S3 bucket were to be created. The array declaration is shown below:

```
departments=("Marketing" "Sales" "HR" "Operations" "Media")

```
To loop through the array, the syntax is:

```
for department in ${departments[@]};
do
......

```

A unique name to be assigned to each of the buckets to be created was built into the loop following a pattern described below: 
`companyName-departmentName-Data-Bucket`. It is constructed as follows:

```
bucket_name="${company}-${department}-Data-Bucket"

```
The AWS command for creating S3 bucket is shown below:

```
    # Create S3 bucket using AWS CLI
    aws s3api create-bucket --bucket "$bucket_name" --region my-region

```
A logic to verify the deployment status and to handle error was also incoporated in the function.

```
    if [ $? -eq 0 ]; then

```
`$?` checks the exit status of `aws s3api ` command. A value of 0 indicates success while a non-zero values indicate failure.

Combining the two functions and other fuuctions for background checks wil produce a script that is shown below:


```
#!/bin/bash

# Environment variables
ENVIRONMENT=$1

check_num_of_args() {"\n# Checking the number of arguments\nif [ \"$#\" -ne 0 ]; then\n    echo \"Usage: $0 <environment>\"\n    exit 1\nfi\n"}

activate_infra_environment() {"\n# Acting based on the argument value\nif [ \"$ENVIRONMENT\" == \"local\" ]; then\n  echo \"Running script for Local Environment...\"\nelif [ \"$ENVIRONMENT\" == \"testing\" ]; then\n  echo \"Running script for Testing Environment...\"\nelif [ \"$ENVIRONMENT\" == \"production\" ]; then\n  echo \"Running script for Production Environment...\"\nelse\n  echo \"Invalid environment specified. Please use 'local', 'testing', or 'production'.\"\n  exit 2\nfi\n"}

# Function to check if AWS CLI is installed
check_aws_cli() {"\n    if ! command -v aws &> /dev/null; then\n        echo \"AWS CLI is not installed. Please install it before proceeding.\"\n        return 1\n    fi\n"}

# Function to check if AWS profile is set
check_aws_profile() {"\n    if [ -z \"$AWS_PROFILE\" ]; then\n        echo \"AWS profile environment variable is not set.\"\n        return 1\n    fi\n"}

# Function to create EC2 Instances
create_ec2_instances() {"\n\n    # Specify the parameters for the EC2 instances\n    instance_type=\"t2.micro\"\n    ami_id=\"ami-0cd59ecaf368e5ccf\"  \n    count=3  # Number of instances to create\n    region=\"eu-north-1\" # Region to create cloud resources\n    \n    # Create the EC2 instances\n    aws ec2 run-instances \\\n        --image-id \"$ami_id\" \\\n        --instance-type \"$instance_type\" \\\n        --count $count\n        --key-name folu-key\n        \n    # Check if the EC2 instances were created successfully\n    if [ $? -eq 0 ]; then\n        echo \"EC2 instances created successfully.\"\n    else\n        echo \"Failed to create EC2 instances.\"\n    fi\n"}

# Function to create S3 buckets for different departments
create_s3_buckets() {"\n    # Define a company name as prefix\n    company=\"braintrust\"\n    # Array of department names\n    departments=(\"Marketing\" \"Sales\" \"HR\" \"Operations\" \"Media\")\n    \n    # Loop through the array and create S3 buckets for each department\n    for department in \"${departments[@]"}"; do
        bucket_name="${company}-${department}-Data-Bucket"
        # Create S3 bucket using AWS CLI
        aws s3api create-bucket --bucket "$bucket_name" --region eu-north-1
        if [ $? -eq 0 ]; then
            echo "S3 bucket '$bucket_name' created successfully."
        else
            echo "Failed to create S3 bucket '$bucket_name'."
        fi
    done
}

check_num_of_args
activate_infra_environment
check_aws_cli
check_aws_profile
create_ec2_instances
create_s3_buckets


```



## Conclusion

The project successfully achieved the requirements to craate a script that automates the deployments of AWS resources.

