# Jenkins Freestyle Jobs

A Jenkins Freestyle job is a project type within Jenkins, offering a flexible and straightforward approach to defining and executing build tasks. It is characterized by its graphical user interface (GUI) configuration, allowing users to define various aspects of a project without requiring scripting or coding knowledge. The project was implemented in three pahses as listed below

1. Creating  a Github repository
2. Freestyle job creation
3. Connection to Source code management
4. Build Trigger Addition.
5. Build Trigger Implimentation
   
## Creating  a Github repository

A github repository was created with the name `jenkins-scm` with a `Readme.md file

<img width="1217" height="648" alt="image" src="https://github.com/user-attachments/assets/7682cdae-2cee-4926-87d6-ee03a076e652" />

<img width="1320" height="648" alt="image" src="https://github.com/user-attachments/assets/766d8102-532b-48d4-a647-95deedd89110" />

The repository url is shown below

<img width="1267" height="678" alt="image" src="https://github.com/user-attachments/assets/75aeeca9-e3fa-41b6-a624-6b118e9be4f0" />


## Freestyle job creation

+ On the Jenkins server dashboard, the `New Item` on the right hand pane was selected.
+ A name `my-first-job` was given to the job, `freestyle project was selected and the `Ok` button was clicked to proceed to the configuration page.

<img width="1344" height="619" alt="image" src="https://github.com/user-attachments/assets/17d4bd40-3ea8-49b6-ba43-4f6c2430f8ec" />

+ On the `configuration page`, `Git` was selected as the Source Code Management and the Url of the jenkins-scm repository was provided.

  <img width="1362" height="645" alt="image" src="https://github.com/user-attachments/assets/03566a68-1cb4-441e-b10a-4bb6463524ae" />

+ `*/main` was provided in the branch specifier's box

  <img width="1359" height="661" alt="image" src="https://github.com/user-attachments/assets/1abf6eeb-4329-4863-9ae3-7ea97e24a4e0" />

+ All the selections were applied and saved.
+ The `build now` button was clicked to commence the build process. 
+ The project was successfully built as shown in the screen shot below

  <img width="1155" height="654" alt="image" src="https://github.com/user-attachments/assets/660dff31-190b-42dc-8c1d-aab0bf324658" />


## Connection to Source Code Management

### webserver Settings

An inbound rule was added on the ec2 instance used as the Jenkins sever to allow traffic from port 8080 in addition to port 22

### Webhook setup on GitHub

- A webhook was created on github for a build trigger connection in Jenkins
- On the repository dashboard, the settings button at the top right was clicked
- `webhook` located at the right plane of the page was selected to begin the webhook setup
- `Add webhook` button was clicked

<img width="1362" height="643" alt="image" src="https://github.com/user-attachments/assets/2bff3778-46ca-4ebf-b5c7-98c83832f0fa" />

- The payload url was provided as `http:16.171.55.48:8080/github-webhook`
- `SSL` verification was disabled because connection was not secure
- `Just the push event` was chosen as the event to trigger the webhook


<img width="1239" height="637" alt="image" src="https://github.com/user-attachments/assets/e508635e-759c-4f8a-9f0c-1cca041de813" />

- The webhook connection to the server was tested by clicking on `recent delivery`. The connection was successful with a status code of `200`

<img width="1365" height="633" alt="image" src="https://github.com/user-attachments/assets/9b9a94c1-b1f8-4269-a937-7fd1e9f9c622" />


## Build Trigger Addition

On the `my-first-job` dashboard of the jenkins server, the `configure` button on the left pane was selected to add a build trigger.
In the `Triggers` section, a checkbox next to `GitHub hook trigger for GITScm Polling` was checked.

<img width="1366" height="656" alt="image" src="https://github.com/user-attachments/assets/cd87d60e-d33c-4a67-ab79-71f9e166179b" />


## Build Trigger Implementation

+ The  `Readme.md` file in the github repository was updated and the changes were committed.

  <img width="1350" height="632" alt="image" src="https://github.com/user-attachments/assets/20927b10-15d3-4dbd-8560-8403ff8ee9fe" />
  

  <img width="1364" height="620" alt="image" src="https://github.com/user-attachments/assets/850c05a6-2e82-4d92-abc8-6126b80fb6d3" />


+ As soon as the change was committed, a build was automatically triggered on the jenkins server.

  <img width="1366" height="645" alt="image" src="https://github.com/user-attachments/assets/aeb775e1-aba2-4f65-9235-9e90976af543" />

+ The build was again, successful as expected.

  <img width="1366" height="640" alt="image" src="https://github.com/user-attachments/assets/360431b2-c080-4069-9ee7-6de89bc8d70c" />


## Conclusion

The project demonstrated freestyle project creation and to incoperate build triggers for automated build.




