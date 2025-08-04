# Environment Variables and Infrastructure Environment

The project provides a well grounded understanding of two basic scripting concepts. The environment variables and infrastructure environment. Some insights into the differences and use cases were given thorough consideration.

## Environment Variables

Environment variables in Bash scripts are special variables that hold information accessible by the shell and any child processes it spawns. They are very important for creating flexible and adaptable scripts, as they allow for dynamic configuration and data sharing without hardcoding values directly into the script. They are key-value pair used in scripts or computer codes to manage configuration values and control software behaviour dynamically. Some use cases of environment variable set up could include:

+ DB_URL=localhost
+ DB_USER=test_user
+ DB_PASS=test_pass


## Infrastructure Environment

The infrastructure environment encompasses the underlying hardware, software, and networking resources that support the development, testing, deployment, and operation of applications. It makes it possible for software to be efficiently built, tested, and delivered to users. The use case of infrastructure environment could include the following:

+ Development environment
+ Testing environment
+ Production environment

## Relationship Between Infrastructure Environment and Environment Variables

Similar infrastructure could be set up for different purposes. Some set up could be for development, testing or production. In each of the environments, however, environment variables could be set to hold configuration values for the application. 

## Task

A starter script to demonstrate the implementation of both concepts was incrementally developed <br>
A script named `aws_cloud_manager.sh` was created with the command:

```
vim aws_cloud_manager.sh

```

The following code was added to the script:

```
#!/bin/bash

# Checking and acting on the environment variable
if [ "$ENVIRONMENT" == "local" ]; then
echo "Running script for Local Environment..."
# Commands for local environment
elif [ "$ENVIRONMENT" == "testing" ]; then
echo "Running script for Testing Environment..."
# Commands for testing environment
elif [ "$ENVIRONMENT" == "production" ]; then
echo "Running script for Production Environment..."
# Commands for production environment
else
echo "No environment specified or recognized."
exit 2
fi

```

<img width="750" height="489" alt="image" src="https://github.com/user-attachments/assets/d2c291ba-7078-419f-9362-2ea559afed50" />


The script contains logics to check for different environments. The environments in the script are: 

1. local
2. Testing
3. Production

For the script to be directly executed, the `execute` permission was set with the command below:

```
sudo chmod +x aws_cloud_manager.sh

```

At this point, no environment had been set as seen in the output of the execution below:<br>
The output was: `No environment specified or recognized`

<img width="738" height="416" alt="image" src="https://github.com/user-attachments/assets/5304e6ab-24d0-4de2-ac52-fbbb502eafdd" />


To set an environment variable for the current shell session, the following was used

```
export ENVIRONMENT=production

```
The script was executed with the command

```
./aws_cloud_manager.sh

```
The output of the first execution is shown below

<img width="739" height="389" alt="image" src="https://github.com/user-attachments/assets/50e65314-5baf-4f5f-96fb-afd858bd86cc" />


## Introducing Positional Parameter

Positional parameters in shell scripts are special variables used to access the command-line arguments passed to a script when it is executed or at run time. They are identified by numbers, with each number corresponding to the position of an argument on the command line. For example,

```
$0: This parameter holds the name of the script itself.
$1: This parameter holds the first argument passed to the script.
$2: This parameter holds the second argument passed to the script.

```
A direct application of positional parameters is to include coditions to check the number of arguments passed. The block of code below illustrates this

```
# Checking the number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

```

`$#` is a special variable that holds the number of arguments passed to the script
`-ne` stands for `not equal to`
`$0` is the positional parameter for the script as previously stated. 

Therefore the above code will check if the number of arguments passed is not equal to 1

The updated code is shown below:

```
#!/bin/bash

# Checking the number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

# Accessing the first argument
ENVIRONMENT=$1

# Acting based on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
  echo "Running script for Local Environment..."
elif [ "$ENVIRONMENT" == "testing" ]; then
  echo "Running script for Testing Environment..."
elif [ "$ENVIRONMENT" == "production" ]; then
  echo "Running script for Production Environment..."
else
  echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
  exit 2
fi

```

<img width="1298" height="562" alt="image" src="https://github.com/user-attachments/assets/df56513b-2a23-41ac-af69-9399a6ded0c4" />


The script was again executed and tested against each of the environment
+ First execution: `testing` was passed as an argument
+ Second execution: `Production` was passed as an argument
+ Third execution: `local` was passed as an argument
+ Fourth execution:  no argument was passed
+ Fifth execution: `stagging` was passed as an argument. Stagging was not included as an environment in the script. Hence, the output was: `Invalid environment specified. Please use 'local', 'testing', or 'production'.`

<img width="742" height="399" alt="image" src="https://github.com/user-attachments/assets/946b6b89-7e75-41ee-b923-2392baf8ef2c" />


## Conclusion

The project helped to solidify some basic understanding of environmental variables and infrastructure environment as part of the core concept in shell scripting.


