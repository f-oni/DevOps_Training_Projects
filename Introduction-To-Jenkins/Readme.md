# Introduction to Jenkins

Jenkins is an open-source automation server widely used in software development for continuous integration (CI) and continuous delivery (CD). It automates various tasks and manages and controls several stages of the software delivery process, including build, documentation, automated testing, packaging, and static code analysis. The project covers an introduction to jenkins which includes:
1. Installation and configuration
2. Getting started with Jenkins Dashboard
3. Jenkins Jobs
4. Connecting to Source code management
5. Build triggers


## Installation and configuration
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

Jenkins was install with the command `sudo apt install jenkins -y
