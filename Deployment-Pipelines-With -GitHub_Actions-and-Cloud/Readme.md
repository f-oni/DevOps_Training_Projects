# Deployment Pipelines With GitHub Actions And Cloud
## Introduction
The project provides a guideline for implementing deployment pipelines using GitHub actions and a cloud platform. The project was implemented as listed below:

1. Introduction to Deployment Pipelines
2. Automated Releases and Versoning
3. Deployment to cloud Platform


## Introduction To Deployment Pipelines

A Deployment Pipeline is an automated workflow that takes code changes from development through to production. It consists of stages, such as building, testing, and deploying, to ensure the software is correctly integrated, verified, and ready for release.There are five main stages of a deployment pipeline:

1. **Development:** Writing and testing codes in a local environment
2. **Integration:** Merging code changes to a shared branch
3. **Testing:** Running automated test to ensure code quality
4. **Staging:** Deploying code to a production-like environment for final testing
5. **Production:** Releasing the final version of code to the end-users.

### Deployment strategies

Deployment strategies are techniques used to roll out changes to an application or system while minimizing downtime and risk. There are several deployment strategies, each with its unique benefits and use cases.

**Blue-Green Deployment**

Blue-Green Deployment involves running two identical environments — one is the “Blue” (currently live) version, and the other is the “Green” (new) version. It can be described as running two production environments but only one serves the end-users at a time.

**Canary Release**

Canary release is a phased rollout strategy where a new version is released to a subset of users or servers before being made available to everyone. This approach allows early detection of potential issues and mitigates risks by limiting the blast radius of the deployment.

**Rolling Deployment**

Rolling Updates involve gradually replacing instances of the old version with instances of the new version. This strategy ensures that a portion of your application is always running during the deployment process, minimizing downtime.

## Automated Releases and Versoning

Automating versioning and releases is essential for maintaining a smooth and consistent development workflow. By combining **Semantic Versioning** (SemVer) with **GitHub Actions**, developers can automatically manage version bumps, changelogs, and releases whenever changes are pushed to the repository.

**Semantic Versioning:**

Semantic versioning (often abbreviated as SemVer) is a versioning scheme that aims to make it clear whether changes in your project are backward compatible, introduce breaking changes, or simply fix bugs. A typical SemVer version number looks like this: MAJOR.MINOR.PATCH

### Automated Versoning with GitHub Actions

+ This part of the project focuses on the practical demonstration of how to automate versioning using GiHub Actions.
+ A `Node.Js` project was setup by initializing the project and adding the necessary application files.
+ Workflow files with the name `versioning.yml` and `release.yml` respectively were developed.
+ The content of `versioning.yml` is shown below:
+ The content of `release.yml` is shown below:
+ All the changes were committed and pushed to the remote repository with the command `git push origin maain`
+ The workflow ran completeed successfully and a tag `0.0.1` was automatically assigned but no release yet. 
+ To initiate a release, the commit was tagged with the command `git tag 1.0.1`.
+ The tag was pushed to generate a release job in the remote repository with the command `git push origin 1.0.1`
+ The release was successful as shown below


### Creating and Managing Releases

- A workflow file with the name `release.yml` was added to the project such that a new release will be created whenever a new tag is pushed to the repository.
- The content of `release.yml` is shown below:
- After pushing all the changes to the remote repository, the release job was successfuly created as shown below:

## Deployment To cloud Platform

The cloud platform chosen for the deployment was AWS and the service was `Elastic Beanstalk`

### Elastic Beanstalk Configuration

+ An `IAM` user named `cicd-user` was created with programmatic access
  <img width="1366" height="572" alt="image" src="https://github.com/user-attachments/assets/9e0ef12d-1980-4666-ab75-c892fdc28889" />

+ `Access key ID` and a `secret access key` were generated for the user

  <img width="1362" height="562" alt="image" src="https://github.com/user-attachments/assets/331ac0e5-ba41-422b-8561-0cc434c1fc52" />

+ Elastic Beanstalk was searched for on the dashboard and the `Create Elastic Beanstalk` button was clicked to begin the creation process.
+ In the environment configuration section, `web server environment` was selected and the name `blackpen` was given as the application name

  <img width="1362" height="545" alt="image" src="https://github.com/user-attachments/assets/ca4187be-ec82-4eac-823a-9b27ecc8e0ce" />

+ `Blackpen-env` was given as the environment name

  <img width="1365" height="551" alt="image" src="https://github.com/user-attachments/assets/062dc424-3c09-485f-9e2a-2824a11041cb" />

+ `Node.js` was selected as the platform and `sample application code` was chosen

  <img width="1353" height="558" alt="image" src="https://github.com/user-attachments/assets/6442fb9d-4d81-4af6-b4e1-8408cd467bbc" />

+ A service role name `aws-elasticbeanstalk-service-role` was created with necessary permissions to manage the environment
+ `Ec2 instance profile` with managed policy that allows the ec2 instance to perform the required operation was created.
  
  <img width="1365" height="567" alt="image" src="https://github.com/user-attachments/assets/829da41d-cda7-4f82-b320-8d3348849553" />

+ Two availability zones were chosen in the default VPC.
  
  <img width="1351" height="533" alt="image" src="https://github.com/user-attachments/assets/9d52512e-f715-4a07-a01e-5cffffc8dbbb" />

+ All the selections were reviewed and the `Create Elastic Beanstalk` button was clicked  to complete the process.
+ The environment was successfully created as shown below.

  <img width="1356" height="578" alt="image" src="https://github.com/user-attachments/assets/32ae51fd-8d40-4e40-8a95-d0bdd96c8347" />
  

  <img width="1366" height="683" alt="image" src="https://github.com/user-attachments/assets/1b9a54c5-056a-4017-a32f-e7fcfebf2295" />




### Repository Secrets Configuration

- In the blackpen repository on github, seetings was selected, Secrets and variable was dropped down in the side bar.
- The two secrets with the name: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` were created.
- The `Access key ID` and a `secret access key` that were generated on aws were provided as values respectively to the secrets.

  <img width="1230" height="445" alt="image" src="https://github.com/user-attachments/assets/defac4ac-7d59-4b3a-9e07-bd85a95633ee" />


### The Repository files

- All the tests and application files were commited to the repository
- A workflow file was created with the name: `cicd.yml`
    + The workflow was configured to be triggered by any commit pushed to the main branch
    + Dependency caching was used in the workflow to help speed up the time it takes to recreate files like dependencies.

      ```
       - name: Cache Node Modules
            uses: actions/cache@v4
            with:
              path: ~/.npm
              key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock-json') }}
              restore-keys: |
                ${{ runner.os }}-node-
      ```
    + `ESLint` was used to ensure code quality
    + `jest` was included to run a test.
    + aws credentials were configured with the saved secrets

      ```
        uses: aws-actions/configure-aws-credentials@v4
            with:
              aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
              aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
              aws-region: eu-north-1
      ```
    + The deploymet packages were generated
    + The package was deployed to AWS.

      ```
      - name: Deploy to AWS
          run: |
            pip install awsebcli
            eb init blackpen --region eu-north-1 --platform "Node.js"
            eb use Blackpen-env 
            eb deploy
      ```
- The content of the `cicd.yml` file is shown below:

  ```
      name: cicd
    
    on: 
      push:
        branches: [ main ]
    
    
    jobs:
      
        build:
      
          runs-on: ubuntu-latest
    
          steps:
          
            - uses: actions/checkout@v4
            - name: Use Node.js 
              uses: actions/setup-node@v4 
              with:
                node-version: '21.x'
            - name: Cache Node Modules
              uses: actions/cache@v4
              with:
                path: ~/.npm
                key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock-json') }}
                restore-keys: |
                  ${{ runner.os }}-node-
    
            - name: Install dependencies
              run: npm ci
            - name: Run Linter
              run: npx eslint .
            - name: build
              run: npm run build --if-present
            - name: Run tests
              run: npm test
            - name: Set aws credentials
              uses: aws-actions/configure-aws-credentials@v4
              with:
                aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
                aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
                aws-region: eu-north-1
            - name: Generarte Deployment package
              run: zip -r deploy.zip . 
            - name: Deploy to AWS
              run: |
                pip install awsebcli
                eb init blackpen --region eu-north-1 --platform "Node.js"
                eb use Blackpen-env 
                eb deploy
  ```
  
- All the changes were commited and pushed to the remote repository with the command `git push remote origin`
- The workflow was triggered and the jobs were built successfully.

  <img width="1366" height="619" alt="image" src="https://github.com/user-attachments/assets/fc25c40d-b0c6-4bc3-9716-706f9bcb93e0" />


### Testing and verification

+ The elastic beanstalk domain: `blackpen-eu-north-1-elasticbeanstalk.com` was copied and pasted in a browser.
+ The content of the `index.js` file was successfully rendered as shown below:

  <img width="1121" height="418" alt="image" src="https://github.com/user-attachments/assets/74aea57f-9117-4218-9c08-1550bebc264e" />

+ In order to simulate continuous integration and continuous deployment, the content of the index.js file was edited and the changes were committed to the local repository and pushed to the remote repository on Github.

  <img width="1113" height="479" alt="image" src="https://github.com/user-attachments/assets/6474f7e0-9b83-4567-af05-0e3cde86e60d" />

+ As soon as the workflow jobs were successfully completed, the elastic beanstalk domain that was opened in a browser was refreshed.
+ The updated content was successfully rendered in the browser. Thus, automated cicd was successful

  <img width="1087" height="505" alt="image" src="https://github.com/user-attachments/assets/0cc4e0f6-e9f0-4c47-b791-60cf4ac6cff5" />


## Conclusion
The provided basic understanding of versioning and release as it relates to software development. Deployment pipeline was successfully implemented using GitHub Actions and AWS Elastic Beanstalk. 






