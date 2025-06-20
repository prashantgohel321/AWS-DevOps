# Day 04: Git & GitHub Concepts

## What is DevOps?

DevOps is a combination of Development & Operations. It is a way of working where developers and operations teams work together to build, test, and release software faster and more reliably.

It focuses on automation, collaboration, and continuous delivery.

## Why is there a need for DevOps?

There is a need for DevOps to speed up software development, improve collaboration between teams, and reduce errors through automation. It helps in delivering updates fastest, fixing bugs quickly, and maintaining high-quality software.

DevOps ensures smooth and continuous delivery, making the development process more efficient and stable.

### What if there is no DevOps?

Then Dev & Ops teams work separately, leading to poor communication and delays. Software updates become slow, bugs take longest to fix, and manual processes cause more errors. Without automation and collaboration, the overall software quality drops, and it becomes harder to deliver reliable products quickly.

## What are the roles of the Developers and Operations team, and how does DevOps bring them together?

* **Developers:** Write code, build new features, and fix bugs in the application.
* **Operations team:** Handles the deployment, server management, monitoring, and ensures the system runs smoothly.

DevOps combines both roles by encouraging collaboration and using automation tools to build, test, and deploy software faster and more reliably. It bridges the gap between development and operations, making the whole process seamless.

## What is the meaning of DevOps core practices? And what are the core practices of DevOps?

DevOps core practices are the key methods and tools used to make software development and delivery faster, automated, reliable, and secure.

The core practices are:

1.  **Continuous Integration (CI):**
    * Devs regularly add (integrate) their code to a shared repository. The code is automatically tested to catch issues early.
    * *Examples:* Jenkins, GitHub Actions, GitLab CI/CD.

2.  **Continuous Delivery (CD):**
    * After CI, the tested code is automatically prepared for release so it can be deployed at any time without manual steps.
    * *Examples:* GitLab CI/CD.

3.  **Infrastructure as Code (IaC):**
    * Servers, networks, and infrastructure are managed using code instead of manual setup. This makes it faster, repeatable, and less error-prone.
    * *Examples:* Terraform, CloudFormation, Ansible.

4.  **Containerization and Orchestration:**
    * Apps are packaged in containers (like boxes) so they run the same on any system. (Docker)
    * Orchestration (Kubernetes) manages many containers automatically.

5.  **Monitoring and Logging:**
    * Systems are continuously monitored to track issues, performance, and ensure everything runs well.
    * *Examples:* Prometheus, ELK stack.

6.  **Security & DevSecOps:** (Implicitly part of the process, ensuring security throughout).

7.  **Site Reliability Engineering (SRE):**
    * Focuses on keeping services reliable and available. It uses software tools to automate operations and solve problems before users face them.

## What is Version Control System (VCS)?

A Version Control System is a tool that tracks changes in code over time. It helps developers manage, save, and go back to earlier versions of the code, especially when working in teams.

## What is GitHub?

GitHub is a cloud-based platform where developers can store their Git repositories online. It allows code sharing, collaboration, and version tracking with others using Git.

## What is Git?

Git is a popular version control tool used to manage code locally. It lets you track changes, switch between versions, and collaborate with others.

* Git is used on your system (local).
* GitHub is where you can upload and share your Git-managed code (online).

## Why should we use Git and GitHub?

* **Git** is used to track changes, manage versions, and work safely on code without losing progress.
* **GitHub** is used to store that code online, making it easy to collaborate with others, share projects, and back up our work.

## What is GitHub and how is it different from GitLab?

GitHub is a web-based platform for hosting Git repositories, similar to GitLab. It also supports version control, collaboration, and CI/CD.

The main difference is that **GitLab** offers a built-in CI/CD system and can be fully hosted on your own servers (self-hosted), giving more control. **GitHub** also supports CI/CD but often needs third-party tools or GitHub Actions. GitLab focuses more on an all-in-one DevOps solution.

## What are GitHub Actions?

GitHub Actions are automation tools built into GitHub that let you automate tasks automatically when something happens in your repository — like pushing code, creating a pull request, etc.

They help us to automate things like testing, building, or deploying our code, so we don't have to do it manually every time.

* **Examples:**
    * Run tests automatically when pushing code.
    * Deploy app to servers/cloud.
    * Build & package our code on every commit.

### How to set up GitHub Actions?

1.  Go to your GitHub Repo -> Actions tab.
2.  It will suggest workflows, or you can click on "New workflow".
3.  Create a new file in the `.github/workflows/` folder (e.g., `main.yml`).
4.  Write a workflow in YAML format to define when & how it should run.
5.  Commit the File. GitHub Actions will run automatically based on the rules you set.

### Example For Running on Push:

```yaml
name: ci

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: My script
        run: echo "Hello"
```
This runs whenever you push code to the repo.

## What is YAML?

YAML (YAML Ain't Markup Language) is a simple, human-readable format used to write configuration files. It uses indentation to show structure and is easy to read and write.

In DevOps, YAML is commonly used in tools like GitHub Actions, Kubernetes, and CI/CD pipelines to define settings & workflows.

## Why does Android Studio ask for the GitHub URL when connecting a project for the first time?

Main Reason: Android Studio needs the repository URL so it knows where to push our code on GitHub.

* If the repository is private, it will ask us to log in or give a token.
* If the repository is public, it still checks that you are allowed to push.
* So, giving the URL also starts the authentication process.

## What is Token Authentication?

Token authentication is a secure way to log in to GitHub without using a password. It's a long, secret code that proves our identity to GitHub when pushing code.

### Why is it used?

* More secure.
* Required for private repositories.
* GitHub stopped allowing password logins for pushing code.

You can find Personal Access Tokens under Profile Settings -> Developer Settings -> Personal Access Tokens -> Generate new token -> (classic).
Remember to set token name, expiration date, permissions (check `repo` (private)), and workflow (if using GitHub Actions).

## What are the simple steps to create a GitHub Repository?

1.  Go to `github.com/` and log in.
2.  Click the `+` icon on the top right, then select "New Repository".
3.  Enter Repository name and optional description.
4.  Choose public or private visibility.
5.  (Optional) Tick "Initialize this repository with a README".
6.  Click "Create Repository".

## What are the additional options like License and .gitignore while creating a GitHub Repository?

* **License:** Choose a license (e.g., MIT, Apache) to define how others can use, modify, and share your code.
* **.gitignore:** This file tells Git which files or folders to ignore (like temp files, build folders, etc.) so they are not pushed to the repository.

## How to commit and push code using the GitHub web platform (without using Git or an IDE)?

1.  Go to your repository on `github.com`.
2.  Click on the file you want to edit, or click "Add File" -> "Create New File" to add a new file.
3.  Make changes or write new code.
4.  Enter a commit message.
5.  Scroll down to the "Commit changes" section.
6.  Choose:
    * "Commit directly to the `main` branch" - if you want to save it directly.
    * "Create a new branch" - if you want to do it safely for bigger changes.
7.  Click "Commit Changes" button.

## What is the concept of a branch in Git? Explain with an example.

A branch in Git is like a separate line of work where you can make changes without affecting the main project.

## How to commit and push code to a GitHub repo using Android Studio?

1.  Open Project in Android Studio.
2.  Go to `VCS` -> `Enable Version Control Integration`, and choose Git.
3.  Then go to `VCS` -> `Commit` (or use the commit button).
    * Select Files to commit.
    * Add a message.
    * Click Commit.
4.  Now, go to `Git` -> `Manage Remotes`.
    * Click `+` and add GitHub repo (usually named `origin`).
5.  Finally, go to `Git` -> `Push`.
    * Select branch.
    * Click Push.

## What is the meaning of Fork & Star?

* **Fork:** A fork is your own copy of someone else's GitHub repository. It lets you freely make changes, and add new features without affecting the original project. You can also send a pull request later if you want to suggest your changes to the original repository.
    * Use it when you want to contribute to open-source or use someone's project as a base.

* **Star:** A star is like a bookmark or a "like". It shows appreciation for the project and helps you easily find it later in your GitHub profile under "Starred repositories."
