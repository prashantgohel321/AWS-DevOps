# Jenkins Practice 01: Freestyle Project - Clone GitHub Repo

This practice demonstrates how to **clone a GitHub repository using Jenkins Freestyle Project**.  
It’s the first step before moving on to Pipelines, Stages (Build, Test, Deploy), and full CI/CD.

---

## What is a Freestyle Project in Jenkins?

A **Freestyle Project** is the simplest job type in Jenkins.  
It allows you to quickly automate basic tasks like pulling code, running scripts, or deploying applications.  

---

## Prerequisites
Before starting, make sure you have:

- Jenkins running (example: via Docker on `http://localhost:8080`)  
- Git installed on the Jenkins server (Docker container already has it in most cases)  
- A GitHub repository (public or private)  
- Jenkins unlocked and admin access  

---

## Step 1: Create a Freestyle Project
1. Open Jenkins → Dashboard → Click on **New Item**.  
2. Enter a project name: `Practice-01-Clone-Repo`.  
3. Select **Freestyle project** → Click **OK**.  

---

## Step 2: Configure GitHub Repo
1. Inside project configuration → scroll to **Source Code Management**.  
2. Select **Git**.  
3. Enter your GitHub repository URL (e.g., `https://github.com/your-username/your-repo.git`).  
4. If your repo is **private**, provide GitHub credentials (username/token).  
5. Save the project.  

---

## Step 3: Build and Verify
1. Click **Build Now**.  
2. Jenkins will clone your repo into its workspace:

```bash
/var/jenkins_home/workspace/Practice-01-Clone-Repo
```

3. Check the logs:  
- Go to **Build History → Console Output**.  
- You should see `Cloning into ...` messages.  

---

## How to Verify Locally
If you are running Jenkins in Docker:
```bash
# Enter the Jenkins container
docker exec -it <container_id> bash

# Navigate to Jenkins workspace
cd /var/jenkins_home/workspace/Practice-01-Clone-Repo

# List files
ls
```

> You should see your repo files inside. 

## Real World Example

Imagine you work in a team:

- Developers push their code to GitHub.

- Jenkins automatically clones the repo.

- Later, you’ll add steps to build, test, and deploy that code.

This Freestyle Project is like your foundation—getting code into Jenkins.



<br>
<br>
<br>

## Where does Jenkins store the repo?

Inside the container, Jenkins stores jobs under:
```bash
/var/jenkins_home/workspace/<Job-Name>
```

So in your case:
```bash
/var/jenkins_home/workspace/Clone-GitHub-Repo
```

<br>

## How to check files from your PC

<details>
<summary>
<strong>
Option 1: Go Inside Jenkins Container
</strong>
</summary>
<br>

Run:
```bash
docker ps
```

Find your Jenkins container ID or name (something like jenkins/jenkins).

Then:
```bash
docker exec -it <container_id> bash
```

Now inside the container:
```bash
cd /var/jenkins_home/workspace/Clone-GitHub-Repo
ls
```

</details>

<br>

<details>
<summary>
<strong>
Option 2: Copy files from container to your PC
</strong>
</summary>
<br>

If you want to bring the cloned files to your PC:
```bash
docker cp <container_id>:/var/jenkins_home/workspace/Clone-GitHub-Repo ./jenkins-clone
```

This will copy the repo to a new folder jenkins-clone in your current directory on your PC.

</details>

<br>

<details>
<summary>
<strong>
Option 3: Mount a volume (permanent solution)
</strong>
</summary>
<br>

If you want Jenkins files to be directly visible on your PC without copying every time:

When you run Jenkins container, add a volume mapping:

```bash
docker run -d -p 8080:8080 -p 50000:50000 \
  -v /home/prashant/jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts
```

Now everything Jenkins does (including repo clones) will be visible on your PC under:

```bash
/home/prashant/jenkins_home/workspace/Clone-GitHub-Repo
```

</details>