<details>
<summary>
<strong>
Q. Difference between Freestyle project and Pipeline in Jenkins?
</strong>
</summary>
<br>

Freestyle is a simple project configuration with limited flexibility, while Pipeline allows defining complex workflows as code, supporting better automation.

</details>

<br>
<details>
<summary>
<strong>
Q. What is the role of plugins in Jenkins?
</strong>
</summary>
<br>

Plugins extend Jenkins’ functionality, for example, integrating with Git, Docker, Kubernetes, or notification tools like Slack.

</details>

<br>

<details>
<summary> <strong> Q. How do you integrate Jenkins with Git? </strong> </summary>

<br>

Install the Git plugin, configure the repository URL in the project, add credentials if needed, and Jenkins will pull code from Git for builds.

</details>

<br>

<details>

<summary><strong>Q. How do you trigger a Jenkins job automatically?
</strong></summary>

<br>

You can use webhooks (e.g., GitHub webhook) to trigger jobs on code push, or use polling/cron syntax in Jenkins to schedule builds.
</details>

<br>

<details>
<summary>
<strong>
Q. How do you define a simple pipeline in Jenkins?

</strong>
</summary>
<br>
By writing a Jenkinsfile with stages such as Build, Test, and Deploy. Example:

```bash
pipeline {
    agent any
    stages {
        stage('Build') { steps { echo 'Building...' } }
        stage('Test') { steps { echo 'Testing...' } }
        stage('Deploy') { steps { echo 'Deploying...' } }
    }
}
```

</details>

<br>

<details>
<summary> <strong>Q: In Jenkins Pipeline, how can you pull code from GitHub, and where is the pulled code stored when Jenkins is running inside a Docker container? </strong></summary>

<br>

In a Jenkins pipeline, code can be pulled from GitHub using the git step inside a Jenkinsfile. For example:
```bash
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/your-username/your-repo.git'
            }
        }
        stage('Build') {
            steps {
                echo "Code pulled successfully!"
            }
        }
    }
}
```

Here, the git step tells Jenkins to clone the repo. If your repo is private, you need to add credentials in Jenkins and reference them in the pipeline like:

```bash
git branch: 'main',
    credentialsId: 'your-cred-id',
    url: 'https://github.com/your-username/your-repo.git'
```

<br>

### Where is the Code Stored?

When Jenkins runs inside a Docker container, the pulled code is stored in the workspace directory of that job, located at:

```bash
/var/jenkins_home/workspace/<job-name>/
```

Here, **`<job-name>`** refers to the Jenkins job or pipeline name.

</details>
