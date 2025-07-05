# Working with Functions

A function is a block of code that performs some tasks and it can be called multiple times for performing tasks. It's a small chunk of code which may be called multiple times within a script. Functions can help with better code organization, maitaining clarity and efficiency.

## Creating a function
A basic syntax for creating a function is Bash scripting is shown below:

```
function_name() {"\n   #Funtion body\n
  #Code logic goes here...\n
  }

```

Where `function_name()` is the function name and the curly braces `{}` enclose the body of the function.

# Task
The project is meant to develop a script for DataWise Solutions' client. A script that automates the setup of EC2 instances and S3 buckets. Pieces of requirements will be encapsulated as code logics within functions. To achieve the task, the following requirements will be built into functions:

-  Check if script has an argument.
-  Check if AWS CLI is installed.
-  Check if environment variable exists to authenticate to AWS

## A function to check if script has an argument

The code logic to achieve the task is shown below:

```
   #!/bin/bash
	
	# Environment variables
	
	ENVIRONMENT=$1
	
	check_num_of_args() {"\n# Checking the number of arguments\n if [ \"$#\" -eq 0 ];
	 then\n   echo\"Usage: $0 <environment>\"\n  exit 1\n fi\n"}
	 
	 check_num_of_args()
	 
	 # Acting based on the argument value
	 
	 if ["$ENVIRONMENT" == "local"]; then
	     echo "Running script for local Environment..."
		 
	 elif [ "$ENVIRONMENT" == "testing" ]; then
	    echo "Running script for Testing Environment..."
	
	 elif [ "$ENVIRONMENT" == "production" ]; then
	    echo "Running script for production Environment..."
		
	 else 
	    echo "Invalid environment specified. Please, use 'local', 'testing', or 'production'."
	    exit 2
	fi

```
In this case, the function name is `check_num_of_args()`. The script will display an environment from either **local**, **testing** or **production**. If none of the conditions was met, then, the following message should be displayed: `Invalid environment specified. Please, use 'local', 'testing', or 'production'.

The above code was better refactored and encapsulated into functions as shown below. Another function named `activate_infra_environment()` was introduced and function calls were logically arranged. The environment variable is placed at the top.  

```
  #!/bin/bash
	
	# Environment variables
	
	ENVIRONMENT=$1
	
	check_num_of_args() {"\n# Checking the number of argumens\n if [ \"$#\" -eq 0 ];
	 then\n   echo\"Usage: $0 <environment>\"\n  exit 1\n fi\n"}
	 
	 activate_infra_environment() {"# Acting based on thr argument value\n if [ \"$ENVIRONMENT\" == \"local\" ]; then\n echo \"Running script for local Environment...\"\n elif [ \"$ENVIRONMENT\" == \"testing\" ]; then\n echo \"Running script for Testing Environment...\"\n elif [ \"$ENVIRONMENT\" == \"production\" ]; then\n echo \"Running script for production Environment...\"\n else\n echo \"Invalid environment specified. Please, use 'local', 'testing', or 'production'.\"\n exit 2\nfi\n"}
	 
	 check_num_of_args
	 activate_infra_environment

```

## A function to Check if AWS CLI is installed

A function to meet the need is shown below:

```
# Function to check if AWS CLI is installed

   #!/bin/bash

   check_aws_cli() {"\n if ! command -v aws &> /dev/null; then\n   echo \"AWS CLI is not installed.
   Please install it before proceeding.\"\n exit 3\n   fi\n" }

   check_aws_cli

```
The function name for this task is `check_aws_cli()`. The function will check if AWS CLI is installed on the server on not. If not installed, the following message is displayed: ""AWS CLI is not installed.Please install it before proceeding". It utilizes the `-v aws` to verify if the availability of aws command which effectively works like **which aws** command. It returns the path to the aws executable if it exists or nothing if it doesn't. The logical operator `!` means "if not". `&> /dev/null` redirects both standard output(stdout) and standard error(stderr) to **/dev/null**. 

## A function to Check if environment variable exists to authenticate to AWS

In order to create resources in AWS, authentication has to be configured using various means such as environment variables, configuration files or the I AM role.
The commonly used files to store AWS credentials and configuration settings are: **~/.aws/credentials** and **~/.aws/config**  respectively.
A profile will enable one to easily switch between different AWS configurations. The **AWS_PROFILE** environment variable allows users to specify which profile to use from their AWS config and credentials files.If the AWS_PROFILE is not set, then the default profile is used.
A function for the task is shown below:

```
 ## Function to check if AWS profile is set
  
   #!/bin/bash

   check_aws_profile() {"\n  if [ -z \"$AWS_PROFILE\" ]; then\n   echo \"AWS profile
   environment variable is not set.\"\n     exit 4\n  fi\n"}

   check_aws_profile

```
The function is named `check_aws_profile()`. The function verifies if AWS profile is set. if not, the following message is displayed: "AWS profile
environment variable is not set". The `-z` flag is used to test if the value of the string variable ("$AWS_PROFILE") is empty or null.

## Conclusion

The combined functions for the requirments is shown below. The function calls have been logically arranged as well.

```
  #!/bin/bash
	
	# Environment variables
	
	ENVIRONMENT=$1
	
	check_num_of_args() {"\n# Checking the number of argumens\n if [ \"$#\" -eq 0 ];
	 then\n   echo\"Usage: $0 <environment>\"\n  exit 1\n fi\n"}
	 
	activate_infra_environment() {"# Acting based on thr argument value\n if [ \"$ENVIRONMENT\" == \"local\" ]; then\n echo \"Running script for local Environment...\"\n elif [ \"$ENVIRONMENT\" == \"testing\" ]; then\n echo \"Running script for Testing Environment...\"\n elif [ \"$ENVIRONMENT\" == \"production\" ]; then\n echo \"Running script for production Environment...\"\n else\n echo \"Invalid environment specified. Please, use 'local', 'testing', or 'production'.\"\n exit 2\nfi\n"}
	 
	# Function to check if AWS CLI is installed

    check_aws_cli() {"\n if ! command -v aws &> /dev/null; then\n   echo \"AWS CLI is not installed. Please install it before proceeding.\"\n exit 3\n   fi\n" }


    # Function to check if AWS profile is set
 
    check_aws_profile() {"\n  if [ -z \"$AWS_PROFILE\" ]; then\n echo \"AWS profile
    environment variable is not set.\"\n     exit 4\n  fi\n"}
   
   
	 
	 check_num_of_args
	 activate_infra_environment
	 check_aws_cli
         check_aws_profile

```







