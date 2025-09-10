# Deployment Pipelines With GitHub Actions And Cloud
## Introduction
The project provides a guideline for implementing deployment pipeline using GitHub actions and a cloud platform.

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
This part of the project is a pratical demonstration of how to automate versioning using GiHub Actions.
A Node.Js project was setup by initializing the project and adding the necessary application files.
A workflow file with the name `tagging.yml` was developed with the following contents:
All the changes were committed and pushed to the remote repository with the command `git push origin maain`
As soon as the job completeed successfully, a tag `0.0.1` was automatically generated.

### Creating and Managing Releases
A workflow file with the name `release.yml` was added to the project such that a new release will be created whenever a new tag is pushed to the repository.
The content of `release.yml` is shown below:
A tag was 
After pushing all the changes to the remote repository, 





