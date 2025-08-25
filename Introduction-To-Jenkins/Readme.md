# Introduction to Jenkins

Jenkins is an open-source automation server widely used in software development for continuous integration (CI) and continuous delivery (CD). It automates various tasks and manages and controls several stages of the software delivery process, including build, documentation, automated testing, packaging, and static code analysis. The project covers an introduction to jenkins which includes:
1. Installation and configuration
2. Getting started with Jenkins Dashboard
3. Creating Jenkins Jobs
4. Connecting to Source code management
5. Build triggers


## Installation and configuration

### Jenkins Installation

The installation was done on an Ubuntu server. The first step was to update the package repository with the command `sudo apt update -y`
**JDK** was installed with the command `sudo apt install fontconfig openjdk-21-jre -y`
The next step was to import the Jenkins GPG key for package verification and adding the Jenkins repository to the system sources. The following lines of code was used to achieve that.

```
 sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

```
The package list was updated with the command `sudo apt update`

Jenkins was install with the command `sudo apt install jenkins -y`

Jenkins service was started with the command `sudo systemctl start jenkins`

The installation was verified with the command `sudo systemctl status jenkins` The screen shot below shows that Jenkins was successfully installed and started

### Jenkins configuration
The Jenkins dashboard was accessed through a browser by entering the url `http://localhost:8080` into the address bar. But for an ec2 instance, it would be: `http://publicIP:8088`. An inbound rule must be added to allow traffic from port `8080 `. 

The Jenkins `Getting started page` was displayed in the browser for the configuration to commence.
The `initial admin password` was revealed with the `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`. The output of which was copied and pasted in space for `Administrator password`. The continue button was clicked to move to the next page
In the `Customize Jenkins` page, the `install suggested plugins` box was selected and those plugins wer installed.
`Create First Admin User` was the next page. On this page, username, password and email address information was proviveded as required.
The `instance configuration url` information was saved
The `Jenkins is ready!` page was displayed. An indication that Jenkins was successfully configured
Finally, `welcome to Jenkins` page

## Creating Jenkins Jobs
The first job was created by selecting `New Item` on the left pane of the dashboard
Item name was given as `app-job-one` and  "freestyle project" was selected
In the job configuration page, add build step, build triggers, and post-build actions are to be selected.
Under  `add build step` section, `execute shell` was chosen and  `echo "Hellow, I am learning Jenkins" ` was provided in the plane text box.
The jenkins job settings were applied and saved.
The `build now` button on the left pane of the page was clicked to trigger a manual build.
The build was successful as shown below
The console output showed that the job `finished successfully`.




