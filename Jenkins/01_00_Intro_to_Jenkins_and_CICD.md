<table border="2px solid">
<tr>
<td><b>Monday</b></td>
<td><b>1st August, 2025</b></td>
</tr>
</table>

# Introduction to Jenkins and CI/CD

In a modern software development process, we often use tools like GitHub for version control. Here’s how a typical flow looks:

1. A developer pushes code to GitHub.

2. The code is then built using Docker.

3. After a successful build, the app is deployed to a server (like AWS EC2).

4. For tracking and performance, we use monitoring tools like Prometheus.

This end-to-end process should run continuously and automatically — this is where CI/CD comes in.

<br>
<br>

# Why Automation is Needed?
Sometimes, the process can fail — for example, if the Docker build fails, the deployment to EC2 and Prometheus won’t happen.

To ensure everything runs smoothly and quickly, DevOps Engineers automate this process **to reduce manual work** and **speed up delivery**.

This is where Jenkins comes in — **a popular open-source automation server** that **helps us set up CI/CD pipelines**.

<br>
<br>

# What is Time to Market?
Time to Market (TTM) refers to **how quickly a product or feature goes from idea to availability for users**.

**DevOps helps reduce this time by automating** builds, testing, and deployment, allowing faster and more reliable software releases.

<br>
<br>

# What is CI/CD?
## Continuous Integration (CI):
- Developers frequently push code to a shared GitHub repository.

- Every time code is pushed, Jenkins runs automated builds and tests.

- This helps catch bugs early and ensures all code changes work well together.

## Continuous Delivery (CD):
- Builds on CI.

- After successful tests, the application is always in a ready-to-release state.

- Final deployment to production is usually manually triggered.

- Helps teams release frequently with confidence.

## Continuous Deployment (CD):
- Goes one step beyond Continuous Delivery.

- After passing all tests, the code is automatically deployed to production — no manual steps involved.

- This enables faster updates and quick feedback from users.

<br>
<br>

# Summary:
- Jenkins automates the entire CI/CD process.

- It helps DevOps engineers save time, reduce errors, and release updates faster.

- The goal is to move code from GitHub to production, automatically and efficiently.

