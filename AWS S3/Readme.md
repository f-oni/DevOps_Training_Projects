# AWS S3

Amazon S3 (Simple Storage Service) is a cloud-based object storage service provided by Amazon Web Services for storing and accessing data. it's a highly scalable, durable, and secure storage solution for various use cases.
The project focuses on the creation and management of S3 buckets for better data access control and storage. The implementation of file upload, versioning, permissions, Access Control List and lifecycle policies were thotoughly explored. The project scope includes the following:

1. S3 bucket creation
2. Objects upload
3. Enabling versioning
4. Setting Permissions for public access
5. Creating Bucket Policy
6. Implementing lifecycle policies


   ##  Creating S3 Bucket
   
At the AWS management console, s3 was entered in the search bar to bring up the S3 management console.

<img width="1333" height="641" alt="image" src="https://github.com/user-attachments/assets/df0f5cd2-a892-4005-9a8c-306d1a16dc45" />

`Create bucket` button was clicked on the S3 page.

 <img width="1302" height="538" alt="image" src="https://github.com/user-attachments/assets/f4eef5d5-a0b5-4464-93ae-bc370310afa2" />

 The name `folu-storage` was provided in the box for `Bucket name`
 
 <img width="1364" height="560" alt="image" src="https://github.com/user-attachments/assets/082ccea4-7340-4971-a683-d2d586a6d1a1" />

 Under `Object Ownership`, `The ACLs disabled` box was selected
   
The `Block all public access` check box was checked

<img width="1340" height="546" alt="image" src="https://github.com/user-attachments/assets/2d2fc3a8-456f-4a9f-9f0a-65279e192c84" />

The disabled radio button was selected in the `Bucket Versioning` section.

Other default settings were left and the `Create bucket` was clicked to create the new bucket

Bucket created successfully.

<img width="1363" height="561" alt="image" src="https://github.com/user-attachments/assets/abb72e55-6251-4cee-862e-9491ff20a3ed" />


   ## Object Upload
   
   A text file with the content "Welcome to the AWS world" was creted and uploaded to the bucket created previously.

   <img width="721" height="339" alt="image" src="https://github.com/user-attachments/assets/bf1febc2-4ae6-4ae7-b5a3-eace7ddf7cd2" />

   File uploaded successfully:

   <img width="1344" height="561" alt="image" src="https://github.com/user-attachments/assets/a091266c-4f9d-447e-b009-cc7b2d852f04" />




   ## Enabling Versioning
   
   In order to enable versioning, The `property` tab of the bucket was click and the `Edit` button of the `Bucket Versioning` section was subsequently clicked.

   <img width="1353" height="517" alt="image" src="https://github.com/user-attachments/assets/365a7b19-47ee-486e-b608-9555c9bfa28c" />

   The `Enable` radio button was selected and the `save changes` button was clicked.

   <img width="1366" height="566" alt="image" src="https://github.com/user-attachments/assets/c33cec32-ff75-4547-8ed9-d14020076d03" />

   <img width="1364" height="448" alt="image" src="https://github.com/user-attachments/assets/4c200538-7481-4274-8b66-f37b3d26593d" />


   The text file was edited and uploaded with the same name to create another version of the file.
   
   <img width="704" height="202" alt="image" src="https://github.com/user-attachments/assets/92e09c85-3341-48cb-bf9c-001d810dc280" />

   Selecting the `Versions` tab shows the different versions of the file.

   <img width="1095" height="457" alt="image" src="https://github.com/user-attachments/assets/dc7d8070-3ab1-4900-927b-9faf58cfbcd7" />


   ## Setting Permissions for Public Access

   The Permissions tab of the bucket was clicked and the check box that preceeds `Block all public access` was unchecked.

   <img width="1083" height="522" alt="image" src="https://github.com/user-attachments/assets/73f9a75c-b215-4e37-8717-74a165eb5452" />

   A confirmation dialog box poped up to comfirm the action was intended by typing `confirm` in a box provided.

   <img width="1107" height="522" alt="image" src="https://github.com/user-attachments/assets/40935def-c28c-4574-9e46-178dc5ce0bac" />

   The `save changes` button was clicked to save the changes made to the permissions section.

   <img width="1138" height="562" alt="image" src="https://github.com/user-attachments/assets/cb4e0b59-1204-4514-b745-da8d0aaf1bf7" />


   ## Creating Bucket Policy

   The `Bucket Plicy` section under the Permissions tab was navigated to.
   The `Edit` button was clicked to create a policy.
   `Policy generator` tab was selected in order to generate the required `JSON` file.

   <img width="1357" height="586" alt="image" src="https://github.com/user-attachments/assets/bb8ab4f9-aa64-4d6e-b78f-ef1c0b5334e2" />

   Type of policy selected was `S3 Bucket Policy`<br>
    "Effect" was set to `"Allow"`<br>
    "Principal" set to: `"*"`, meaning that all users will be allowed.<br>
    "Action": `s3:GetObject` and `s3:GetObjectVersion` were selected.<br>
    The object's `arn` (Amazon Resource Name) was provided for the `Resource`<br>
   Add statement was clicked and a summary of the selections was shown.

   <img width="1000" height="640" alt="image" src="https://github.com/user-attachments/assets/41d68ac6-89bc-49fa-be6d-e3e02e292348" />

   Finaly, `generate policy` button was clicked and a JSON file for the policy was displayed. The content of the file was copied and pasted in the `policy Bucket` section.

   <img width="799" height="615" alt="image" src="https://github.com/user-attachments/assets/68c5d379-6e91-4d69-b682-6c186839e27c" />

   <img width="1130" height="553" alt="image" src="https://github.com/user-attachments/assets/8b5499ff-db0d-45e2-a706-fcf17306c678" />


   The changes were saved

   see the generated bucket policy below:

   ```
   {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::folu-storage/my-first-s3-bucket-090.txt"
        }
    ]
}

   ```

Policy was successfully added

<img width="1139" height="563" alt="image" src="https://github.com/user-attachments/assets/39009269-f481-4e3a-8b46-aa43854812c4" />



## Pucblic Access Validation

The object url for the different versions of the uploaded file was clicked and the file contents were displayed in the browser.

The first version of the file is shown below:

<img width="945" height="295" alt="image" src="https://github.com/user-attachments/assets/776e3cea-03cb-4c72-9830-45fc61a11ece" />

A second version of the uploaded file is displayed below:

<img width="929" height="385" alt="image" src="https://github.com/user-attachments/assets/d84bf91e-ef16-4abe-b0de-6556114797dc" />




## Setting Lifecycle Policies

In the management section of the bucket, `Create lifecycle rule` was clicked.
A name my-lifecycle-rule was provided in the box for lifecycle name

<img width="1210" height="514" alt="image" src="https://github.com/user-attachments/assets/1c2c56d0-ffad-4b2d-a35a-87b4cb7af13c" />

Minimum object size of 2GB was entered while 10GB was entered for the maximum object size.

<img width="1210" height="514" alt="image" src="https://github.com/user-attachments/assets/c5ed3f90-243f-4e0b-b199-63d3cdf756e8" />

Under the `Lifecycle actions`, `Transition current versions of objects between storage classes` was selected

<img width="1083" height="508" alt="image" src="https://github.com/user-attachments/assets/59490a0f-18ea-428c-99fe-613ead701041" />

The storage class choosen was the `Standard IA` and the number of days was 30 days. This will automatically move files from the standard storage tier to the standard infrequently accessed (IA) storage tier after 30 days. The policy will effectively save some cost since the `Standard IA` is cheaper than the regular storage tier.

<img width="1330" height="609" alt="image" src="https://github.com/user-attachments/assets/8700025e-79ec-4ef1-a2ae-86562cf67079" />

Lifecycle rule successfuly created

<img width="1361" height="599" alt="image" src="https://github.com/user-attachments/assets/b062233a-24ba-4941-8224-e21453765bd0" />



## Conlusion

The project provided general overview of the AWS S3. Basic concept of the S3 bucket creation, management and security were propely simulated. Object permissions and policy creation and lifecycle management were also given attention to.  





   
   

