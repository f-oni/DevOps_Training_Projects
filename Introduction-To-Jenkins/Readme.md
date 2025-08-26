# Introduction to Jenkins

Jenkins is an open-source automation server widely used in software development for continuous integration (CI) and continuous delivery (CD). It automates various tasks and manages and controls several stages of the software delivery process, including build, documentation, automated testing, packaging, and static code analysis. The project covers an introduction to jenkins which includes:

1. Installation and configuration
2. Getting started with Jenkins Dashboard
3. Creating Jenkins Jobs
4. Connecting to source code management
5. Creating Jenkins Pipeline jobs
6. CI/CD with docker and Jenkins
   


## Installation and configuration

### Jenkins Installation

- The installation was done on an Ubuntu server.
- The first step was to update the package repository with the command `sudo apt update -y`
- **JDK** was installed with the command `sudo apt install fontconfig openjdk-21-jre -y`

  <img width="740" height="438" alt="image" src="https://github.com/user-attachments/assets/33f20880-69c9-43d0-a6b6-865577815d11" />

  <img width="735" height="307" alt="image" src="https://github.com/user-attachments/assets/a631dbd4-c475-491c-97ec-3b7e4847f18a" />


  
- The next step was to import the Jenkins GPG key for package verification and adding the Jenkins repository to the system sources.
- The following lines of code was used to achieve that.
 

```
 sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

```
  <img width="1263" height="410" alt="image" src="https://github.com/user-attachments/assets/b56ffdb3-829a-4265-b295-adf7d0c1059c" />


+ The package list was updated with the command `sudo apt update`

  <img width="952" height="401" alt="image" src="https://github.com/user-attachments/assets/9f467e20-ff4e-4817-8653-b5460d23092b" />

  
+ Jenkins was install with the command `sudo apt install jenkins -y`

  <img width="751" height="456" alt="image" src="https://github.com/user-attachments/assets/3cd4cb94-153d-4ab7-825a-5b923ada51cd" />

+ Jenkins service was started with the command `sudo systemctl start jenkins`
+ The installation was verified with the command `sudo systemctl status jenkins`
+ The screen shot below shows that Jenkins was successfully installed and started

  <img width="734" height="452" alt="image" src="https://github.com/user-attachments/assets/8de8adc1-292f-4592-b66f-706520d5c553" />



### Jenkins configuration

The Jenkins dashboard was accessed through a web browser by entering the url `http://localhost:8080` into the address bar. But for an ec2 instance, it would be: `http://publicIP:8088`. An inbound rule must be added to allow traffic from port `8080 `. 

- The Jenkins `Getting started page` was displayed in the browser for the configuration to commence.

  <img width="955" height="617" alt="image" src="https://github.com/user-attachments/assets/2b5887ac-fdcb-42d2-a4ff-101ba7ce70b5" />

- The `initial admin password` was revealed with the `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`.

  <img width="732" height="148" alt="image" src="https://github.com/user-attachments/assets/b88aa02b-a7fc-4be3-812c-99e0389b05e0" />
   
- The output of which was copied and pasted in space for `Administrator password`.
- The continue button was clicked to move to the next page.
- In the `Customize Jenkins` page, the `install suggested plugins` box was selected and those plugins wer installed.

   <img width="941" height="604" alt="image" src="https://github.com/user-attachments/assets/f9254d4f-8dcc-4d6e-b9fd-d76755f51736" />

  
- `Create First Admin User` was the next page. On this page, username, password and email address information was proviveded as required.

   <img width="871" height="500" alt="image" src="https://github.com/user-attachments/assets/c1180522-00a5-4cc3-8710-1136ae42fc73" />

  
- The `instance configuration url` information was saved

  <img width="875" height="499" alt="image" src="https://github.com/user-attachments/assets/b09dede0-46d3-491f-85e2-b51420d9cfe3" />

- The `Jenkins is ready!` page was displayed. An indication that Jenkins was successfully configured

  <img width="875" height="464" alt="image" src="https://github.com/user-attachments/assets/c2bb54f5-2718-4b8e-acc0-1e736b0faae5" />

- Finally, `welcome to Jenkins` page

  <img width="970" height="636" alt="image" src="https://github.com/user-attachments/assets/ad5fc90c-5cff-41b4-adf9-199b1573a32c" />


## Creating Jenkins Jobs

+ The first job was created by selecting `New Item` on the left pane of the dashboard

  <img width="960" height="590" alt="image" src="https://github.com/user-attachments/assets/4fd953c5-c477-4902-a3b4-792b14625e24" />

+ Item name was given as `app-job-one` and  "freestyle project" was selected

  <img width="943" height="539" alt="image" src="https://github.com/user-attachments/assets/0296e8eb-1054-41c8-8b35-c41a52691a01" />

+ In the job configuration page, add build step, build triggers, and post-build actions are to be selected.
+ Under  `add build step` section, `Execute shell` was chosen and  `echo "Hello,welcome to Jenkins learning environment" ` was provided in the plane text box.

  <img width="978" height="570" alt="image" src="https://github.com/user-attachments/assets/f4bf871f-cbc1-4c9b-a8cc-259b120262ce" />


  <img width="970" height="541" alt="image" src="https://github.com/user-attachments/assets/11f2e813-0366-4fcc-8f8c-f3b3b53a201b" />

+ The jenkins job settings were applied and saved.
+ The `build now` button on the left pane of the page was clicked to trigger a manual build.

  <img width="952" height="530" alt="image" src="https://github.com/user-attachments/assets/caf3ddf6-3e3c-4cc9-a58a-f0571b2f84ef" />

+ The build was successful as shown below.

  <img width="973" height="502" alt="image" src="https://github.com/user-attachments/assets/09b00ffc-79f9-49a1-9984-12167b281dea" />

+ The console output showed that the job `finished successfully`.

  <img width="973" height="502" alt="image" src="https://github.com/user-attachments/assets/919d037b-3143-4add-8820-8dee225cfcba" />


## Connecting Jenkins to Source Code Management

Source code management (SCM) is the practice of tracking, organizing, and controlling changes to a software project's source code, primarily through version control systems (VCS). Source code management (SCM) systems are tools that help teams collaborate on and modify the source code repository of their projects. These tools work by tracking changes to a code repository over time. Examples of SCM tools are Git, Subversion and Mercurial. Git, the most popular,  is an open-source source code management tool designed for distributed version control and collaboration. GitHub is a popular web-based platform that provides a hosting service for Git repositories. It builds upon Git's functionality by offering a centralized, cloud-based environment. This part of the project focused on connecting github to Jenkins for automated builds. The steps listed below were followed:

### Creating Personal Access Token (PAT) on Github 

On GitHub, the `developer settings` of the GitHub settings was selected.
`Tokens(classic)` was chosen and followed by `generate new token`.
A name was given to the PAT as `jenkins-github`, an expiration date was set and the scope was equally set.
The token was generated and copied to be used in Jenkins

### Adding Credential to Jenkins and connecting it to GitHub

On the Jenkins dashboard, `manage Jenkins` was selected and `Credentials` button was clicked.
Under `stores scoped to Jenkins` section, global(domain) was chosen.
The `add credential` button was clicked to open the next page for filling the PAT details.
The username, password and other details were filled out and the create button was clicked to complete the process.
Jenkins and GitHub are now connected with PAT

### Pulling Code from SCM using a Build Trigger

A repository with the name `DigitalBoost` is to be cloned into a project in jenkins.
The `Git plugin` was first confirmed to have been installed under the installed plugins.
A `freestyle project` was selected and  the project was given a name `digi-app`.
On the configuration page, under source code management section, `Git` was selected, the repository url `https://github.com/f-oni/DigitalBoost.git` was supplied and the credential added in the previous step was selected.
`*/main` was chosen as the branch to build.
Poll SCM was chosen as the build trigger and the schedule provided was `H/3 * * * *`. which translates to polling being done every 3 minutes.
The selections for the project were applied and saved

### Testing SCM connection with Jenkins and Build trigger

The `Readme.md` file of the DigitalBoost` repository on GitHub updated and the changes were committed. 
The committed change on github automatically triggered a build process on jenkins.
The build was succefull as shown on console output
The `html` file was updated after some minutes. As soon as the change was committed, a second build process got triggered on Jenkins. Again, the second build was successfull. 
The two succesful builds showed that the connection between Github and Jenkins was successful. It also helped to validate that the build trigger worked as expected.

## Creating a Pipeline job and script








## Project Challenges

1. The reocmmended JDK in the project was version 11 which is no noger compatible with the latest version of Jenkins. The installation failed as a result.

   <img width="737" height="436" alt="image" src="https://github.com/user-attachments/assets/44ac1070-e751-4bad-814f-d729a670e679" />


  **Remediation:** JDK version 21.0.8 was installed instead as recommended in the official Jenkins documentation page. The command for the installation was 
  
  `sudo apt install fontconfig openjdk-21-jre -y`

  <img width="735" height="307" alt="image" src="https://github.com/user-attachments/assets/9f4cb32d-4f70-4801-9415-79ef3c6aa4b3" />

  
2. The line of code provided in the project documentation to import the Jenkins GPG key for package verification and adding the Jenkins repository to the system sources as shown below did not work for the installation because the `apt-key` command is deprecated in Debian and Ubuntu-based systems due to security concerns.

   ```
   wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt-get install jenkins

   ```

**Remediation:** The following lines of code gotten from the official Jenkins documentation page was used to achieve the task.

```
 sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```




## Conclusion
The project introduced Jenkins as a DevOps tool. Installation and configuration of jenkins were successfully performed as required




