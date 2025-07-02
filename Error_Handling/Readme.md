# Error Handling in Shell Scripting

Error handling involves anticipating and managing errors that may occur during script execution.
It prevents script failure and ensures graceful execution. The following methods can be employed to handle errors effectively:

1. Identify potential errors: Anticipate sources of error such as input validation, command execution, and file operations. Potential impact of each of the sources should be understood.
2. Use conditional statement: Conditional statements (if,elif,else) should be employed to check for error conditions and respond accordingly. checking the exit status ($?) of the most recently executed command and taking appropriate actions is essential.
3. Informative Messages: Descriptive error messages should be provided. The messages should clearly state what went wrong and how the issues could be resolved.

Effectively handling errors in shell scripting is a vital skill for system administrators.

# Task

A script to create aws S3 bucket with error handling. The following script was created to check if the bucket exist before it is created. The **aws s3api head-bucket** was used to achieve this. Blocks of if-else and exit status ($?) were introduce in the code to check the condition and provide appropriate message accordingly. If the bucket exists, the message should be "S3 bucket already exists". If it does not exist, the bucket will be created and display the message "S3 bucket created successfully.
See code below:
            #  Function to create s3 buckets for different departments

              create_s3_buckets() {"\n  company=\"datawise\"\n  
              departments=(\"Marketing\" \"Sales\" \"HR\" \"Operations\" \"Media\")\n    \n
               for department in \"${departments[@]"}"; do
	                  bucket_name="${company}-${department}-Data-Bucket"
	
	      # Check if the bucket already exists
	        if aws s3api head-bucket --bucket "$bucket_name" &>/dev/null; then
	                echo "S3 bucket '$bucket_name' already exists."
	        else
	    # Create S3 bucket using AWS CLI
		     aws s3api create-bucket --bucket "$bucket_name" --region your-region
		
		       if [$? -eq 0]; then
		            echo "S3 bucket '$bucket_name' created successfully."
		      else
		             echo "Failed to create S3 bucket '$bucket_name'."
		      fi
	     fi
	
        done 
	
	     }

   




