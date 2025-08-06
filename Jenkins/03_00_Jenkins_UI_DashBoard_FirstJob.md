# Jenkins UI / Dashboard / Creating Your First Job

## What is a Job in Jenkins?
In Jenkins, a Job (also called a Project) is **any task** you want Jenkins **to do automatically**.

Examples of Jenkins jobs:

- Cloning code from GitHub

- Running a Python script

- Building a Docker image

- Automating CI/CD pipelines

📌 Think of a job as **a command you're giving to the Jenkins butler** (that’s why the Jenkins logo is a butler — waiting for your instructions).

<br>

## Create Your First Jenkins Job
On the Jenkins dashboard, click on “**New Item**” or “**Create a job**”.

Give your job a name — anything you like.

Choose the type of project (also called item).
Each type is used for different purposes:

<br>

| Type                            | Use Case (When to Use)                                                                                     |
| ------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **Freestyle Project**           | Most common. Use for simple tasks like cloning a repo, running a script, Docker commands, automation, etc. |
| **Pipeline**                    | For writing advanced CI/CD workflows using code (Jenkinsfile). Supports stages, conditions, etc.           |
| **Multi-configuration Project** | Used for testing across multiple OS, JDKs, browsers, etc. (like matrix testing).                           |
| **Folder**                      | Used to organize your jobs. You can group jobs into folders.                                               |
| **Multibranch Pipeline**        | For automating builds for **every branch** in a Git repository.                                            |
| **Organization Folder**         | For managing multiple repos under one GitHub org — auto-discovers all projects.                            |

<br>

## Let’s Start with a Freestyle Project
Once selected, you’ll see different configuration tabs on the left sidebar:

- General

- Source Code Management (SCM)

- Build Triggers

- Build Environment

- Build Steps

- Post-build Actions

<br>

### 1. GENERAL Tab
This is where you **configure the basic settings for the job**.

Options include:

- **Description**: Write a short note about what this job does.

- **Discard old builds**:
    - Useful to free up storage. You can:

    - Set how many days to keep builds.

    - Set the max number of builds to keep.

**Other options (optional)**:

- GitHub Project

- This Project is Parameterized

- Throttle builds

- Execute concurrent builds if needed

<br>

### 2. SCM (Source Code Management)
- This section is used if your code is hosted on GitHub or GitLab.

- Choose Git and paste the repo URL.

- If you’re not using any source code, just select None.

<br>

### 3. Build Triggers
> 🟡 **What are Build Triggers?**
Build triggers define when or how your job should run automatically.

Examples:

- **Trigger builds remotely**: Run the job using a script or webhook.

- **Build after other projects are built**: Useful for chaining jobs.

- **Build periodically**: Like CRON – e.g., run every day at 9 AM.

- **GitHub hook trigger for GITScm polling**: Auto-run job when there’s a push to GitHub.

- **Poll SCM**: Jenkins checks Git for changes at regular intervals.

<br>

### 4. Build Environment
> 🟡 **What is Build Environment?**
This section defines the **environment or conditions before the actual build starts**.

Example:
- Set environment variables

- Clean workspace before build

- Inject secrets

<br>

### 5. Build Steps
> 🟡 **What is a Build Step?**
This is where you define what Jenkins should do in this job.

Click on:
```bash
Add build step → Execute Shell
```

Then write your shell commands. Example:
```bash
echo "Hello, I am Prashant Gohel"
mkdir -p devops     # -p creates folder only if it doesn't exist
```

<br>

### 6. Save and Run the Job
- Click Save

- Click Build Now

- Jenkins will now run the job.

- You can see logs and output in Console Output.

If you created a folder using mkdir, it will be created inside:
```swift
/var/lib/jenkins/workspace/<JobName>
```

For example:

```swift
/var/lib/jenkins/workspace/FirstJob
```

<br>

### Summary
- A Job is an automation task in Jenkins.

- Freestyle Project is best for beginners and simple jobs.

- Jenkins provides a GUI to configure jobs using tabs like SCM, Build Triggers, Steps, etc.

- You can write shell commands and run them automatically.

- Jenkins stores job data in /var/lib/jenkins/workspace.