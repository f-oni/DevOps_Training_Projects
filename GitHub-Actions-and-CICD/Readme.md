# GitHub Actions And CI/CD

The project focuses on how to use GitHub actions to automate software development process. Particular attention will be given to its rich advanced features and various implementation scenarios. The steps for the project implementation are listed below:

1. Project Setup
2. Developing Workflows
3. Implementing Continuous integration
4. Running Tests in the workflows
5. Additional Concepts in GitHub Actions
6. Build Matrices Configuration and parallel Jobs


## Project Setup

- A GitHub repository named `hostel` was created and cloned to the local development machine with the command: `git clone`
- A `.gitignore file was created
- Workflows directory was created with the command `mkdir -p .github/workflows`
- GitHub Actions workflows file was created using the command `touch .github/workflows/main.yml`

## Developing Workflows

The workflows file was incrementally developed by stricly following the YAML syntax and adhering to GitHub actions workflows structure. A basic structure of the GitHub Actions workflows is briefly described below:

+ **name:** The name of the workflow, displayed in the "Actions" tab of the repository.
+ **run-name:** The name for individual workflow runs, displayed in the list of workflow runs. 
+ **on:** Defines the events that trigger the workflow, such as push, pull_request, workflow_dispatch (for manual triggers), schedule, etc.
+ **jobs:** A collection of one or more jobs that run in the workflow.
   - **<job_id>:** A unique identifier for each job.
   - **name:** The name of the job.
   - **runs-on:** Specifies the type of runner machine (e.g., ubuntu-latest, windows-latest, macos-latest) where the job will execute.
   - **steps:** A sequence of tasks to be executed within a job. Each step can either run a script using run or execute a pre-defined action using `uses` (e.g., uses: actions/checkout@v4).
       + **name:** An optional name for the step.
       + **id:** An optional unique identifier for the step, used to reference its outputs.
       + **if:** An optional conditional expression that determines whether the step runs.
       + **env:** Environment variables specific to the step.


The content of the `main.yml` file that contains a build job, steps to install dependecies and run test is shwon below:

```
name: cicd

on: 
  push:
    branches: [ main ]

env:
  BUILD_CONFIGURATION: Production

jobs:
  

  build:
  
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: ['18.x', '20.x']

    steps:
      
      - uses: actions/checkout@v4
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v4 
        with:
          node-version: ${{ matrix.node-version }}

      - name: Install dependencies
        run: npm ci
      - name: build
        run: npm run build --if-present
      - name: Run tests
        run: npm test

```


## Implementing Continuous integration

- A node.js application was setup by creating `app.js` and `index.js` files. The `app.js` file contains the main component or the core logic of the entire application while the `index.js` file  acts as the primary entry point for the application.

<img width="1027" height="487" alt="image" src="https://github.com/user-attachments/assets/47fe5e0e-998b-4981-9743-99cc808758ec" />

- the content of the `index.js` file is shown below:
  
   ```
   const { app } = require('./app');

    const PORT = 3000;
    app.listen(PORT, () => {
    console.log(`Running on http://localhost:${PORT}`);
    });
   
   ```
- The content of the `app.js` file is shown below:

  ```
  'use strict';
   const express = require('express');

   // App
   const app = express();
   app.get('/hello', (req, res) => {
       res.status(200).json({
        message: "Hello World!"
     });
      res.send('Hello world!');
   });

    module.exports = { app };
  
  ```
- `npm init -y` command was used to create a new Node.js project by initializing a new package.json file in the project's root directory.
- To install the Express.js framework,the command `npm install express` was used.
- `npm install --save-dev jest` was used to install jest testing framework as a development dependency
- `npm install --save-dev supertest` was used to install the supertest package as a development dependency.

## Running Tests in the workflows

+ A file named index.test.js was created in the project's root directory. Supertest framework was used for the test.
Supertest is a JavaScript library for testing HTTP servers and APIs in Node.js applications. It is commonly used for integration and end-to-end testing, allowing developers to simulate HTTP requests to their application's endpoints and make assertions about the responses
+ The content of the index.test.js is shown below:

  ```
        const request = require('supertest');
       const { app } = require('./app');

      describe('/hello', () => {
        it('returns `Hello World!`', async () => {
          const data = await request(app).get('/hello');
          expect(data.statusCode).toBe(200);
          expect(data.body.message).toBe('Hello World!');
        });
      });
  ```
  
+ The test was first implemented locally using `npm test`. The output is shown below:

  <img width="729" height="353" alt="image" src="https://github.com/user-attachments/assets/0e9abd8b-c6e0-4fd5-9f5f-af9dd8a5ce48" />


+ The .gitignore file was editted to exlude `node_modules`.
+ The changes to the local repository were added with `git add .`
+ `git commit -m "initial file addition"` was used to commit the files to the local repository
+ `git push origin main` was used to push the chenges to the remote repository.
+ The workflows was immidiately fired as soon as the changes were pushed to the remote repository.
+ The build ran successfully and the tests passed.

  <img width="1366" height="611" alt="image" src="https://github.com/user-attachments/assets/460d2c59-fd6a-4398-bff8-7b18c04467eb" />
  

  <img width="1366" height="655" alt="image" src="https://github.com/user-attachments/assets/231dd65a-f198-47b9-9db4-a13d925cedb0" />


## Additional Concepts in GitHub Actions
To enhance the usage of GihHub Actions, some advanced features were implemented. Each of the feature is described with implementation as shown below:

### Using Environment Variables

GitHub Actions environment variables are dynamic named values that can be used to pass configuration data into workflows and actions. They allow for the creation of dynamic and reusable workflows by providing a way to store and access values that can change based on different contexts, such as the operating system, specific job, or sensitive information. There are two types of environment variables. The default environment variables and the custom environment variables

**Default Environment Variables:**
GitHub automatically sets a variety of default environment variables that provide information about the workflow run, such as GITHUB_REF (the branch or tag that triggered the workflow), GITHUB_SHA (the commit SHA), GITHUB_REPOSITORY (the owner and repository name), and RUNNER_OS (the operating system of the runner).

**Custom Environment Variables:**
Users can define their own custom environment variables at different scopes:
(i) Workflow Level: Defined using the env key at the root level of the workflow file, making them available to all jobs and steps within that workflow.
(ii) Job Level: Defined using the env key within a specific job, making them available only to the steps within that job.
(iii) Step Level: Defined using the env key within a specific step, making them available only to that particular step.
Configuration Variables: Defined at the organization, repository, or environment level, allowing for centralized management and reuse across multiple workflows. These can be accessed using the vars context.

#### Environment Variables Implementation
- Environment variable was introduced  by adding a step to the build job in the main.yml file.
- The environment variable was declared with `env:BUILD_CONFIGURATION: Production` and was referenced in a step added to the build job.

<img width="1172" height="685" alt="image" src="https://github.com/user-attachments/assets/2850e175-3f7a-461c-953c-c0a8eb843456" />

- The step is shown below:

```
 - name: Job environment
        run: echo $BUILD_CONFIGURATION

```

- The workflow ran as expected. The output is shown below:

<img width="1366" height="695" alt="image" src="https://github.com/user-attachments/assets/dd941838-f537-4767-b15e-b2c6103145bb" />


### Working with Secret

GitHub Actions secrets are encrypted environment variables used within GitHub Actions workflows to securely store sensitive information. This sensitive information can include API keys, access tokens, database credentials, or any other confidential data that should not be directly exposed in the workflow's code.

#### Github Actions Secrets Implementation

+ In the repository setting, `secrets and variables` was dropped down in the left hand side bar. 
+ The `actions` button was clicked and `New repository secret` respectively
+ The secret was given  a name `ACCESS_TOKEN` and a value was given to it.

  <img width="1290" height="666" alt="image" src="https://github.com/user-attachments/assets/802676da-a48c-47a7-93f1-4a9764f97e78" />

+ The step below was provided in the main.yml file in order to make use of the secret
  
  ```
   - name: Use secret
        run: |
          echo "Access Token: ${{ secrets.ACCESS_TOKEN }}"
  
  ```
+ The changes were again pushed to the remote repository with the command 'git push origin main`

  <img width="955" height="493" alt="image" src="https://github.com/user-attachments/assets/f2653dba-815e-4df2-ab83-58878c4e51ca" />

+ The uotput showed a successful implementation as displayed below:

  <img width="1366" height="608" alt="image" src="https://github.com/user-attachments/assets/8e6884ff-5baa-4d2d-9322-979ee0fde8e4" />


### Coditional Execution

GitHub Actions workflows support conditional execution of jobs and steps using the `if` conditional keyword. This allows for flexible control over workflows flow based on various conditions and expressions.

#### Coditional Execution Implementation

- Coditional execution was implemented by adding the following step to the workflow
  
  ```
    - name: Conditional step
        if: github.event_name == 'pull_request' && github.ref == 'refs/heads/main'
        run: echo "This step runs only for pull requests."
  ```
- The job will run based on pull request and merge to the main branch and a push to the main branch.
- The changes were pushed to the remote repository and the workflow ran.
  
  <img width="869" height="650" alt="image" src="https://github.com/user-attachments/assets/0c1a6179-4404-457c-a13e-7741eda76748" />

- To implement the `pull request` part of the condition, a new branch named `development` was created using the command `git checkout -b development`
- The `Readme.md` file was editted, changes were committed and pushed to the development branch with the command `git push origin development`
- On the remote repository, a pull request was created and merged to the main branch as there were no conflicts.

  <img width="1366" height="652" alt="image" src="https://github.com/user-attachments/assets/8eaeddcd-e6b9-4f04-babd-409c5f8d8be9" />

  <img width="1366" height="646" alt="image" src="https://github.com/user-attachments/assets/34ab43b0-5499-4584-9558-dce8791ee0f3" />


- As soon as the merge was successfull, the workflows ran automatically. The successfull implementation is shown below:

  <img width="1366" height="653" alt="image" src="https://github.com/user-attachments/assets/8f8eef3b-b3fe-4883-9593-6ecc0a125722" />

- **Observation:** The workflow did not run when there was a push to the development branch because the conditions set in the workflows were not met.

### Using Ouputs and Inputs Between Steps

+ In GitHub Actions, outputs and inputs facilitate communication between steps within a job and between different jobs in a workflow.
+ To share data from one step to another within the same job, an id would be defined for the step producing the output. This ID allows subsequent steps to reference its outputs.
+ This can be set using echo "::set-output name=value::$(echo hello) 
+ To access the output in a subsequent step,  Use the syntax `${{ steps.step_id.outputs.output_name }}` to retrieve the value.

#### Ouputs and Inputs Between Steps Implementation

- Another step, based on the syntax described above was added to the workflow in order to implement `Ouputs and Inputs between Steps` feature. The step is shown below:

  ```
    - name: Set Output
        id: data_generator
        run: echo "::set-output name=data_gen::$(echo data consumption)"

      - name: Use Output
        id: data_consumer
        run: |
          echo "Received value from previous step: ${{ steps.data_generator.outputs.data_gen }}"
  
  ```
  
- The changes were again commited to the development branch and pushed to the remote repository. 
- A pull request was created and a merged to the main branch.
  
  <img width="1363" height="631" alt="image" src="https://github.com/user-attachments/assets/77887339-c4a2-48ee-bb6b-2e6c44a24e63" />

- The workflow was again triggered after the pull request creation and merging with the main branch.
- The feature was successfully implemented as the step with the name `Use Output` (second step)  made use of the output of the previous step named `Set Output`.The output is shown below

  <img width="1361" height="645" alt="image" src="https://github.com/user-attachments/assets/8a8465ba-cfff-4d17-b4c5-1739ebf83c39" />


### Build Matrices Configuration and parallel Jobs

The GitHub Actions build matrix, also known as the matrix strategy, is a powerful feature that allows one to run a single job definition multiple times with different configurations. This is achieved by defining a set of variables and their possible values, and GitHub Actions will automatically create and execute a separate job for each combination of these values.

#### Build Matrices Configuration Implementation

+ This was implemented by defining a strategy to run a build on two different versions of node.js.
+ The following lines were added to the main.yml file in order to acheive it.
  
  ```
    strategy:
      matrix:
        node-version: ['18.x', '20.x']
  
  =====================================

   - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v4 
        with:
          node-version: ${{ matrix.node-version }}
  
  ```
+ The output showed that the build were run on node.js `18.x and 20.x` respectively.
+ Parallel job execution on means that multiple jobs defined in a single workflow file can run concurrently, significantly reducing overall workflow execution time for tasks that are independent of each other. By default, jobs defined at the same level in the workflow will run in parallel unless explicit dependencies are set using the `needs:` keyword.
+ This was implemeted by adding another job to the workflows named `lint`.

## Conclusion:

The project clearly demonstrated how GitHub Actions can be utilized to automate continous integration process by leveraging on its versatility and rich advanced features. The project built enhanced appreciation for GitHub Actions as an extremely powerful tool for automating software development processes. 






