# Introduction To CICD With GitHub Action

## Introduction

CI/CD, stands for continuous integration and continuous delivery/deployment, is to streamline, automate and accelerate the software development lifecycle
The project is an introduction to continuous integration and continuous delivery/deployment using GitHub Actions. A node js application with a functionality to serve a static web page was used for the implementation. The following must be understood for a successful project implementation

+ **Continuous integration (CI)** is the practice of integrating source code changes frequently into a shared source code repository and ensuring that the integrated codebase is in a workable state.
+ **Continuous delivery (CD)** is a software development practice where code changes are automatically built, tested, and prepared for release to production at any time. in other words, Continuous delivery automatically deploys releases to a testing or staging environment. It builds on continuous integration (CI) by automating the final stages of the deployment pipeline to ensure that new code is always in a releasable state.
+ **Continuous Deployment (CD)** is a software release process that uses automated testing to validate if changes to a codebase are correct and stable for immediate autonomous deployment to a production environment. It can also be described as the automated process of delivering code changes to production once they pass all required tests.
+ **CI/CD pipeline** is a framework for automating the processes involved in software development. It includes a series of stages that the code needs to pass through before it is ready for deployment. It is an automated software delivery process that streamlines the building, testing, and deployment of code changes to production, improving software quality, reliability, and speed.
+ **GitHub Actions** is a continuous integration and continuous delivery (CI/CD) platform integrated within GitHub, enabling the automation of software development workflows directly within your repository. It allows task automation such as building, testing, and deploying code, as well as managing issues, pull requests, and other repository events. When a defined event occurs in a repository, GitHub Actions triggers the corresponding workflow. This workflow then executes its jobs on a chosen runner, with each job performing a series of steps.
+ **Workflows:** They are automated, configurable processes defined by YAML files `(.github/workflows/ directory)` within a GitHub repository, enabling the automation of software development life cycle tasks such as continuous integration (CI), continuous delivery (CD), and other event-driven automations. Automated The YAML files specify the sequence of jobs and steps to be executed.
+ **Events:** Triggers that initiate a workflow, such as pushing code, opening a pull request, creating an issue, or even manual workflow_dispatch.
+ **Jobs:** A set of steps that execute on a runner. Jobs can run in parallel or sequentially.
+ **Runners:** They are the machines that execute jobs in a GitHub Actions workflow. They can either be GitHub-Hosted Virtual machines (Linux, Windows, macOS) or self-hosted machines where jobs are executed.
+ **Steps:** Individual tasks within a job, which can be pre-built actions from the GitHub Marketplace or custom shell scripts.
+ **Actions:** Reusable units of code that encapsulate a specific task, simplifying workflow creation.


## Project Implementation

To project requires a CICD setup that utilizes GitHub actions with a simple Node.js application that serves a static web page.The project involves the following steps.

1. Initializing a GitHub Repository
2. Creating a simple Node.js application
3. Writing GitHub Actions Workflows
4. Testing and Deployment


### Initializing a GitHub Repository

- A GitHub repository was created with the name `lifeline`

  <img width="1278" height="627" alt="image" src="https://github.com/user-attachments/assets/4c32b870-5fa4-4dee-96d8-ea69e0ece441" />

- The repository was cloned to a local development machine with the command `git clone https://github.com/f-oni/lifeline.git`

  <img width="764" height="334" alt="image" src="https://github.com/user-attachments/assets/ef4fd6d5-7091-489a-9c0e-6067fdfefe8c" />

- A `gitignore` file was created with the command `touch .gitignore`


### Creating a simple Node.js application

+ To begin the process of creating a Node.Js application the directory was initialized with the command `nmp init -y`.
  
  <img width="702" height="364" alt="image" src="https://github.com/user-attachments/assets/3faf13cf-61b0-4e96-876a-7cb96846ba82" />

+ A `package.json` file was created by default after initialization.
+ Express was install with `npm install express`

  <img width="691" height="285" alt="image" src="https://github.com/user-attachments/assets/78dc5cf9-b6ab-44e6-ab4a-0c7227fd09fa" />

+ `jest`, that will be used to test the application was installed with the command `npm install --save-dev jest`

  <img width="1122" height="360" alt="image" src="https://github.com/user-attachments/assets/8a077be3-e954-4542-835a-25278714c727" />

+ Using VS Code, an `index.js` file with simple code that builds a Web server that runs on `port 3000` was created.
  
  <img width="1015" height="411" alt="image" src="https://github.com/user-attachments/assets/e6acc77a-e314-4643-885c-7d8a8d8bedea" />

+ The scripts section of the `package.json` file was updated to include a "start script" and "jest" test as shwon.

  <img width="1175" height="571" alt="image" src="https://github.com/user-attachments/assets/19993fe5-055e-4cd3-9e51-a02940e4099f" />

+ The application was started locally by running the command: `npm start`. The output is shown below:
  
  <img width="854" height="258" alt="image" src="https://github.com/user-attachments/assets/6feb652f-a953-4b75-a9df-36490dcf5b69" />

+ The application server was tested by entering `http://localhost:3000/` to the browser's address bar. The browser displayed the expected content of the index.Js file

  <img width="648" height="431" alt="image" src="https://github.com/user-attachments/assets/b2d69cf5-9eb8-4ed3-87a1-044604fd25c2" />


### Writing GitHub Actions Workflows

- Workflows directory was first created with the command `mkdir -p .github/workflows`
- A YAML file was created in the directory with the command `touch .github/workflows/pipeline.yml`

  <img width="828" height="357" alt="image" src="https://github.com/user-attachments/assets/3b75266e-e097-4d13-a4db-6c7b33836957" />

- The following lines of code were added to the workflows file:
  
    ```
    name: Node.js CI

    on: [push]

   jobs:
   build:

    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      - name: Use Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20.x'
      - run: npm ci
      - run: npm run build --if-present
      - run: npm test
      
    ```
    
- The workflow contains steps to build and test the application under one job named `build`

  <img width="1137" height="592" alt="image" src="https://github.com/user-attachments/assets/9545f6da-7e90-45dc-bf29-1ea118e79291" />

  
- The folowing terminologies are common workflow syntax

    + **name:** Node.js CI Name of the workflow
    + **on:** Specifies when the workflow should be triggered
    + **push branches: [ main]:**  Triggers the workflow on 'push' events to the 'main' branch     
    + **jobs:** Defines the jobs that the workflow will execute. It's 'build' in this case
    + **runs-on: ubuntu-latest**  Specifies the type of virtual host environment (runner) to use
    + **strategy:** Strategy for running the jobs - this section is useful for testing across multiple environments
    + **matrix: node-version: [18.x, 20.x]** A matrix build strategy to test against multiple versions of Node.js
    + **steps:** Steps represent a sequence of tasks that will be executed as part of the job
    + **uses: actions/checkout@v2** Checks-out your repository under $GITHUB_WORKSPACE, so the job can access it
    + **name: Use Node.js ${{" matrix.node-version "}}** Sets up the specified version of Node.js
    + **run: npm ci** Installs node modules as specified in the project's package-lock.json
    + **run: npm run build --if-present**  This command will only run if a build script is defined in the package.json
    + **run: npm test** Runs tests as defined in the project's package.json


  ### Testing and Deployment

  #### Testing

- To run a test, two files were creted. Those were `mul.js` and `mul.test.js`
- The content of `mul.js` is shown below

    ```
    function mul(a, b) {
    return a * b;
     }
     module.exports = mul;

    ```

- The content of `mul.test.js` is displayed as shown.

    ```
    const mul = require('./mul');

    test('mutiplies 2 * 3 to equal 6', () => {
    expect(mul(2, 3)).toBe(6);
     });

    ```
    
- The `.gitignore` file was updated to ignore `node_modules` as this are very large files.
- All the changes were staged with the command `git add .` and commited with the command `git commit -m "initial file addition"

  <img width="732" height="376" alt="image" src="https://github.com/user-attachments/assets/98860a7e-8943-4f1c-aeea-dc5e005054ac" />

- The work was pushed to the remote reposirory with the command `git push origin main`.
- As soon as the changes were pushed, Github Actions began the `build job` as defined in the workflows.
- The job was successfully built and all the tests were passed.

  <img width="1339" height="500" alt="image" src="https://github.com/user-attachments/assets/1e834428-8053-4171-8bba-9a3961ee1888" />


  <img width="1365" height="643" alt="image" src="https://github.com/user-attachments/assets/2291c2c8-7672-4af0-8972-d3eea6e7fe61" />



#### Deployment

+ after a successful build job, the application was deployed to AWS EC2 instance cloud server.
+ To acheive this, the workflows was updated with a second job named `deploy`
+ An EC2 instance was created on AWS with the name `lifeline-server`. The inbound rule of the security group was configured to allow traffic from ports `22 and 3000`

  <img width="1365" height="558" alt="image" src="https://github.com/user-attachments/assets/36235adc-4efb-4134-bb92-05849f09246e" />

+ Environment secrets were set in the repository to allow connection to the server. The **USERNAME**, **HOST_NAME** and **PRIVATE_KEY** were set.

  <img width="1275" height="668" alt="image" src="https://github.com/user-attachments/assets/d5737387-7336-4ef0-8afb-4895765adb20" />

+ The `deploy` job in the YAML file was updated with the following script

    ```
    name: Node.js CI

    on: [push]

   jobs:
   build:

    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4
      - name: Use Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20.x'
      - run: npm ci
      - run: npm run build --if-present
      - run: npm test

  deploy:
    runs-on: ubuntu-latest
    needs: build # This job runs after 'build'
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      - name: Deploy to server
        uses: appleboy/ssh-action@v1.0.3 
        with:
          host: ${{ secrets.EC2_HOST }}
          username: ${{ secrets.EC2_USERNAME }}
          key: ${{ secrets.EC2_PRIVATE_KEY }}
          script: |
            sudo mkdir -p /var/www/
            sudo chown -R $USER /var/www
            sudo chmod -R +rwx /var/www
            cd /var/www/
          
            git clone https://github.com/f-oni/lifeline.git 

            # rsync -a --delete /var/www/tmp/ /var/www/
            
            cd /var/www/lifeline/

            sudo apt update
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

            export NVM_DIR="$HOME/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
            [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

            nvm install 22
            npm install -g pm2
            
            npm install express
            pm2 restart index.js || pm2 start index.js
            
    ```
+ The script will create a work directory (/var/www/) and provide the necessary permissions on the directory
+ Connect to the remote repository through ssh using the Environment secrets
+ Clone the repository into the work directory
+ Install `nvm` and node.js 
+ install PM2 with the command `npm install -g pm2`
+ Start the application using PM2.

### Verification

- The deployment was verified by typing the public ip address of the server with the port number of the application server into a browser address bar as shown : `http:13.60.227.168:3000`
- The content of the `index.js` file was successfully rendered as expected.
  
  <img width="991" height="399" alt="image" src="https://github.com/user-attachments/assets/b50638cb-ce20-421c-819e-4e17645db012" />

- To further verify automation and CICD, the content of the `index.js` file was edited on the developement machine and the changes were commited and pushed to the remote repository.

  <img width="791" height="357" alt="image" src="https://github.com/user-attachments/assets/7d5bc403-b123-4338-bfa9-b94aafb1708b" />
  

- The build and deployment were again successful.

  <img width="1324" height="514" alt="image" src="https://github.com/user-attachments/assets/ad8da46d-88b0-4399-8ebf-a75752cb9108" />
  

- As soon as the opened browser was refreshed, the new or updated content of the `index.js file was rendered.

  <img width="1097" height="490" alt="image" src="https://github.com/user-attachments/assets/c71c4ff2-27d0-4291-9622-6d1d5310ee12" />


## Coclusion

The project helped to conceptualise Continuous integration and continuous delivery/deployment as core DevOps practice. A practical demonstration of the power of GitHub actions as an automation and CICD tool was implemented. The project also brought to the fore, the importance of version control system in software development.






