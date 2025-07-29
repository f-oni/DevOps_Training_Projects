# BASH Scripting for Cloud Infrastructure
The project aims at detailing the requirements and procedure for writing a BASH script that will automate the creation of EC2 instances and S3 buckets in the AWS cloud platform. The script will leverage on the following shell scripting concepts:

1. Functions
2. Arrays
3. Environment variables
4. Command Line Arguments
5. Error Handling


# Script Development Procedure
DataWise solutions has been introduced as a company employed to develop a script that automates the creation of EC2 instances and setup S3 buckets

## Basic Prerequisite for EC2 Instances

**Amazon Machine Image (AMI) ID:** This launches the instance.<br>
**EC2 instance type:** Ensure that the selected instance type is compatible with the AMI ID.<br>
**VPC and subnet IDs:** The instance launches from these.<br>
**Security group ID:** Users must assign one to the instance. For newly created security groups, users should assign an ID before they launch the EC2 instance.<br>
**EC2 key pair name** Without it, users cannot use Secure Shell to connect to the EC2 instance or access it through Windows Remote Desktop.

### Environment variables

environment variables are used to store configuration details when creating an Amazon EC2 instance using the AWS Command Line Interface (CLI). This approach enhances script reusability and simplifies management of sensitive or frequently changing parameters.
The following will be declared for this implementation

```
AWS_REGION="<region>"
AMI_ID="<AMI-ID>"
INSTANCE_TYPE="<instance-type>"
KEY_NAME="<ec2-keypair>"
SECURITY_GROUP_IDS="<sg-ID>"
SUBNET_ID="<subnet-ID>"
INSTANCE_NAME="<Instance-name>"

```
### Functions

Functions will be created to create EC2 instances and S3 bucket. The functions should be modular and dynamic. These will incoperate the following:

#### A function to Setup EC2 Instances

1. Error handling to include logic to check if an instance name exits and instance count
2. AWS CLI command to create security group `aws ec2 create-security-group`
3. AWS CLI command to authorize SSH in group `aws ec2 authorize-security-group-ingress`
4. AWS CLI command to create key pair `aws ec2 create-key-pair`
5. AWS CLI command to create EC2 instances `aws ec2 run-instances`
6. argument to request instance type
7. A logic to verify deployment status and to handle error
8. Viewing the Instance


#### A function to Setup S3 Bucket

1. Error handling to include logic to check if a bucket's name exits.
2. Argument to request bucket name
3. AWS CLI command to create S3 bucket `aws s3api  create-bucket`
4. A logic to verify deployment status and to handle error

### Command Line Arguments

Including command line arguments in the script will make the implementation customizable. Deployment will also be dynamic and flexible.
The EC2 instance type and bucket name can be specified buy the user.

### Error Handling

The script should include mechanisms to handle error and exit gracefully. Exit status of each of the programs in the functions should be properly handled. Deployment status should also be handled.

### Script Arrangement

The script would be sequentially arranged according to program execution plan
1. Environment Variable declaration
2. Function to create EC2 instance
3. Function to create S3 bucket
4. Main execution
5. Function calls
6. Exit

## Conclusion

The projects helped to coceptualize the requirements and procedure for automating script development for cloud deployments.


   
