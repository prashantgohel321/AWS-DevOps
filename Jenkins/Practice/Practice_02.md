# Jenkins Pipeline Practice 02: Build, Test & Deploy

This README documents **Practice 02** of Jenkins, where we use a **Pipeline Job** to perform **staging steps**: **Clone → Build → Test → Deploy**.  
This will help you understand how Jenkins automates the complete CI/CD workflow.  

---

## 📌 What is a Jenkins Pipeline?

A **Jenkins Pipeline** is a way to define your build process as **code** using a file called `Jenkinsfile`.  
It describes each stage (like build, test, deploy) in a **declarative script**.  

👉 Think of it as a **recipe** for Jenkins to follow step by step.

---

## 🛠️ Pipeline Flow in this Practice

1. **Clone** → Pull code from GitHub Repository.  
2. **Build** → Compile or prepare the application. (For demo, just use echo commands)  
3. **Test** → Run test scripts (dummy test using echo).  
4. **Deploy** → Simulate deployment (just a message for now).  

---

## 📂 Jenkinsfile Code

Here’s the Jenkinsfile used in this practice:

```groovy
pipeline {
    agent any   // Run on any available Jenkins agent

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/prashantgohil117355/19th-august-branch-practice.git'
            }
        }

        stage('Build') {
            steps {
                echo '🔨 Building the project...'
                // Example: For Java -> sh 'mvn clean install'
                // Example: For Node.js -> sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                // Example: sh 'mvn test'
                // Example: sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                echo '🚀 Deploying application...'
                // Example: Copy files, run docker build & run
                // Example: Deploy to server
            }
        }
    }
}
```

## 🔍 Explanation of Each Part

- **`agent any`** → Jenkins will run this pipeline on any available worker/agent.

- **`stage('Clone')`** → Pulls code from your GitHub repo.

- **`stage('Build')`** → Builds or compiles your project.

- **`stage('Test')`** → Runs automated tests.

- **`stage('Deploy')`** → Simulates deployment (in real projects, deploys to server).

## 🖥️ Console Output (Example)

When you run this job, you’ll see output like:
```bash
[Pipeline] Start
[Pipeline] stage
[Pipeline] { (Clone)
Cloning repository https://github.com/....
[Pipeline] }
[Pipeline] stage
[Pipeline] { (Build)
🔨 Building the project...
[Pipeline] }
[Pipeline] stage
[Pipeline] { (Test)
🧪 Running tests...
[Pipeline] }
[Pipeline] stage
[Pipeline] { (Deploy)
🚀 Deploying application...
[Pipeline] }
Finished: SUCCESS
```

## 🌍 Real-World Example

- **Clone** → Like downloading code from GitHub to your laptop.

- **Build** → Like compiling your Java/Node project before running.

- **Test** → Like running unit tests before you push code live.

- **Deploy** → Like copying your project to production (server/Docker/AWS).

