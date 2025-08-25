# Declarative Pipeline in Jenkins

When I started learning Jenkins pipelines, I found it useful to think of a simple analogy. 

Imagine there is **a tap** (the source of water) and **a garden** (the destination where water needs to go). To get the water from the tap to the garden, I use **a pipe**. If I want the water to spread evenly across the garden, I add **a sprinkler**. If I want the water to be clean, I add **a filter** in between.

This is similar to how **a pipeline works** in Jenkins.
A pipeline **takes something from a source and passes it through different stages before reaching the final destination**. Each stage in the pipeline has a specific purpose. For example:

- Cloning the code

- Building the application

- Running tests

- Deploying the code

Each stage processes the application in some way, just like filters or sprinklers in a water pipe.

<br>
<br>

## Creating a Pipeline in Jenkins

To create a new pipeline, I follow these steps:

- Go to New Item in Jenkins.

- Enter a name for the job, for example: DemoCICD.

- Select Pipeline as the project type.

- (Optional) Add a description.

- Scroll down to the Pipeline section.

Here, Jenkins gives me two options:

- **Pipeline Script**: Write the pipeline directly in Jenkins.

- **Pipeline Script from SCM**: Fetch the pipeline definition (Jenkinsfile) from a source code repository like GitHub.

For now, I will choose Pipeline Script because I just want to try out some examples.

<br>
<br>

## Example: A Simple Pipeline

Here is a very basic pipeline script:
```bash
pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo "Hello"
            }
        }
    }
}
```

- The **`pipeline {}`** block defines the whole pipeline.

- **`agent any`** means the pipeline can run on any available Jenkins agent.

- Inside **`stages {}`**, I define the stages that the pipeline will go through.

- In this case, I only have one stage called Hello, which simply prints "Hello".

<br>
<br>

## Adding Multiple Stages

I can add multiple stages to the same pipeline. For example:
```bash
pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo "Hello"
            }
        }
        stage('Create Folder') {
            steps {
                sh 'mkdir -p devops'
            }
        }
    }
}
```

- The first stage just prints "Hello".

- The second stage creates a folder named devops inside the Jenkins workspace directory.

- Here, I use sh to run shell commands directly.

<br>
<br>

## Why Pipeline is Better than Freestyle Projects

I used to work with Jenkins freestyle projects, where I could add build steps, run shell commands, and perform similar tasks. However, pipelines offer several advantages:

1. I can define custom stages to make the process structured and clear.

2. Jenkins shows the output stage by stage, making it easier to debug.

3. If any stage fails, the pipeline stops immediately and does not move to the next stage.

4. Pipelines are written in Groovy syntax, which gives me more flexibility and automation possibilities compared to freestyle jobs.