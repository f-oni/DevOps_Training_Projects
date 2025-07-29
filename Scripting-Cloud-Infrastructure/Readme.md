# BASH Scripting for Cloud Infrastructure
The aims at detailing the requirements and procedure for writing a BASH script that will automate the creation of EC2 instances and S3 buckets in the AWS cloud platform. The script will leverage on the following shell scripting concepts:

1. Functions
2. Arrays
3. Environment variables
4. Command Line Arguments
5. Error Handling

## Task One: Basic Prerequisite for EC2 Instances

**Amazon Machine Image (AMI) ID:** This launches the instance.
**EC2 instance type:** Ensure that the selected instance type is compatible with the AMI ID.
**VPC and subnet IDs:** The instance launches from these.
**Security group ID:** Users must assign one to the instance. For newly created security groups, users should assign an ID before they launch the EC2 instance.
**EC2 key pair name** Without it, users cannot use Secure Shell to connect to the EC2 instance or access it through Windows Remote Desktop.

DataWise solutions has been introduced as a company required to develop a script to automate the EC2  instances setup and S3   
