# BASH Scripting for Cloud Infrastructure
The aims at detailing the requirements and procedure for writing a BASH script that will automate the creation of EC2 instances and S3 buckets in the AWS cloud platform. The script will leverage on the following shell scripting concepts:

1. Functions
2. Arrays
3. Environment variables
4. Command Line Arguments
5. Error Handling

## Task One: Basic Prerequisite for EC2 Instances

**Amazon Machine Image (AMI) ID:** This launches the instance.<br>
**EC2 instance type:** Ensure that the selected instance type is compatible with the AMI ID.<br>
**VPC and subnet IDs:** The instance launches from these.<br>
**Security group ID:** Users must assign one to the instance. For newly created security groups, users should assign an ID before they launch the EC2 instance.<br>
**EC2 key pair name** Without it, users cannot use Secure Shell to connect to the EC2 instance or access it through Windows Remote Desktop.

DataWise solutions has been introduced as a company required to develop a script to automate the creation of EC2 instances and setup S3 buckets

### Environment variables
environment variables are used to store configuration details when creating an Amazon EC2 instance using the AWS Command Line Interface (CLI). This approach enhances script reusability and simplifies management of sensitive or frequently changing parameters.
The following will be declared for this implementation

AWS_REGION="<region>"<br>
AMI_ID="<AMI-ID>"<br>
INSTANCE_TYPE="<instance-type>"<br>
KEY_NAME="<ec2-keypair>"<br>
SECURITY_GROUP_IDS="<sg-ID>"<br>
SUBNET_ID="<subnet-ID>"<br>
INSTANCE_NAME="<Instance-name>"<br>

