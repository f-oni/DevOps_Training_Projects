# Implementing Continuous Integration with GitHub Actions

## Introduction

The project provides a deep dive into implementing Continuous Integration using some GitHub Actions advanced features. Build matrices configuration and code quality check integration will be demonstrated. The project was organized and implemented as listed below:

1. Project Setup
2. Build Matrices configuration and Dependencies management
3. Integrating code quality checks
4. Project Implementation and Verification
5. Project Challenge
6. Conclusion


## Project Setup

### Project Prerequisite

+ A repository named `chain-saw` was created on Github

  <img width="1366" height="562" alt="image" src="https://github.com/user-attachments/assets/997f4959-bea5-4d11-a45d-e26307f7354b" />

+ The repository was cloned to a local repository with the command `git clone https://github.com/f-oni/chain-saw.git`
+ A `.gitignore` file was created and workflows directory was created with the command `mkdir -p .github/workflows`
+ The workflow file was created with the command `touch .github/workflows/ci.yml`
+ The projec's root directory was opened in VS Code. A node.js application was setup by creating `index.js` file.
+ The content of the `index.js` file is shown below:
  
   ```
         // Example: index.js
      const express = require('express');
      const app = express();
      const port = process.env.PORT || 3000;
      
      app.get('/', (req, res) => {  
           res.send('Hello World! we made it');});
      
      app.listen(port, () => {
        console.log(`App listening at http://localhost:${port}`);
      });
   ```
+ `mul.js` and `mul.test.js` were created to run test with `jest`

### Project Initialization

-  To initialize a new package.json file in the project's root directory, the command `npm init -y` was used
-  To install the Express.js framework,the command `npm install express` was used.
- `npm install --save-dev jest` was used to install jest testing framework as a development dependency 
- `npm install --save-dev supertest` was used to install the supertest package as a development dependency.


## Build Matrices configuration and Dependencies management

- The GitHub Actions build matrix, also known as the matrix strategy, is a powerful feature that allows one to run a single job definition multiple times with different configurations.   This is achieved by defining a set of variables and their possible values, and GitHub Actions will automatically create and execute a separate job for each combination of these values.  It is very useful for testing applications in different versions of runtime environments or dependencies.
- Build matrix feature was implemented by defining a strategy to run a build on three different versions of node.js in the `ci.yml` file. The snippet is shown below:
  
  ```
  
      strategy:
        matrix:
          node-version: ['18.x', '20.x', '21.x']
  
      steps:
        
        - uses: actions/checkout@v4
        - name: Use Node.js ${{ matrix.node-version }}
          uses: actions/setup-node@v4 
          with:
            node-version: ${{ matrix.node-version }}
  ```

### Dependencies management

Dependencies management in GitHub Actions involves several strategies to ensure security, efficiency, and maintainability of the workflows and the projects they build. Dependency Caching was used in the project to manage dependencies.
**Dependency Caching:** Utilizes the `actions/cache` action to store and retrieve project dependencies (e.g., node_modules, vendor/bundle). This significantly reduces workflow run times by avoiding repeated downloads and installations in subsequent runs. A step was added to the build job in the `ci.yml` file to implement dependency caching. 
The step is shown in the snippet below:

```
  - name: Cache Node Modules
        uses: actions/cache@v4
        with:
          path: ~/.npm
          key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock-json') }}
          restore-keys: |
            ${{ runner.os }}-node-

```

+ The above step caches the installed node modules based on the hash of the 'package-lock.json' file.

## Integrating Code Quality Checks

- Code quality checks in Node.js GitHub Actions refer to the automated processes integrated into a GitHub Actions workflow to ensure the quality, maintainability, and security of Node.js codebases. 
- Tools like ESLint are used to analyze code without executing it, identifying potential issues like syntax errors, stylistic inconsistencies, and common anti-patterns. This helps enforce coding standards and improve readability. Hence, ESLint was used for the project. 

- A step to for code analysis was added to the workflow.The step is shown below

  ```
    - name: Run Linter
          run: npx eslint .
  
  ```

'npx eslint .' runs the ESLint tool on all the files in the repository.

### Configuring linters and static code analyzers

+ Configuring linters and static code analyzers involves defining rules and settings to enforce coding standards, identify potential errors, and improve code quality. 
+ `npm install eslint --save-dev` was the command utilized to install `ESLint`
+ `npm install --save-dev eslint-plugin-jest` was used to install the ESLint plugin for Jest as a development dependency.
+ `The npx eslint --init` command was used to initialize and configure ESLint.
+ The `eslint.config.mjs` file was the configuration file produced by the initialization step above.
+ The `globals` section of the file was editted to include some variables that might be read as undefined by ESLinter.

  <img width="1147" height="541" alt="image" src="https://github.com/user-attachments/assets/781c1847-4c27-4fd2-a7e3-e128d2a02ec0" />


## Project Implementation and Verification

- The content of the `ci.yml` file is shown below:

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
            node-version: ['18.x', '20.x', '21.x']
    
        steps:
          
          - uses: actions/checkout@v4
          - name: Use Node.js ${{ matrix.node-version }}
            uses: actions/setup-node@v4 
            with:
              node-version: ${{ matrix.node-version }}
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

  ```
  
- The `script` section of the `package.json file was edited to include lint, jest and start index.js respectively. The script section is shown below:

  <img width="1162" height="680" alt="image" src="https://github.com/user-attachments/assets/be750761-c7d5-47c5-980b-d930b93bbc60" />

- The `.gitignore` file was edited to ignore `node_modules`
- The linter test was run locally using the command `npx eslint`
- The changes were added to the local repository with the command `git add .` and committed with the command `git commit -m "All application file added"`
- All the changes were pushed to the remote repository with the command: `git push origin main`
  
**Observations:** 

+ All the three builds were successful. Which satisfied the build matrices configuration
  
  <img width="1366" height="549" alt="image" src="https://github.com/user-attachments/assets/c4a17009-15cd-4536-904b-d74a4feedd98" />

+ The linter checked for code quality and caught the function 'expect` used in the `mul.test.js` file as an error because it could not find a definition for the function.
  
  <img width="1366" height="653" alt="image" src="https://github.com/user-attachments/assets/7da11e8f-faaa-4269-97ec-e0d3e484196c" />

+  The function name was then added to the globals section of the configuration file and the change was pushed to the remote remote repository. The builds successful ran with no linter code errors at this time.

  <img width="1365" height="632" alt="image" src="https://github.com/user-attachments/assets/ee994c79-a054-4d56-b35f-1cd4b848311b" />

+   This also satified that all the scripts in the code base were analyzed by ESLinter.
+ To verify the dependencies management feature, the `Readme.md` file was edited and the changes were pushed to the remote repository. The outcome of the cache step showed `Cache restored successfully`.

  <img width="1342" height="652" alt="image" src="https://github.com/user-attachments/assets/2e496f62-5ff7-4894-b915-7f01346b96bc" />

+ That was an indication that all the dependencies were cached and restored.

## Project Challenge

The configuration file for ESLint introduced in the project insruction was `.eslintrc file ` but it is now deprecated and replaced with `eslint.config.mjs`

## Conclusion

The project provided good insights into using some advanced features of gitHub Actions to implement continuous integration. Those advanced features can be very handy and valuable for DevOps engineers as those will significantly streamline the workflows and grately improve the quality of software development process. 






 

