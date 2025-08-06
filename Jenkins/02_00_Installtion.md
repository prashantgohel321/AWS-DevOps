# Jenkins Installation on a VM (Ubuntu)

### Step 1: Install Java
Jenkins is built in **Java**, so we must install Java first before installing Jenkins (since it **runs on the Java platform**).

Run the following commands:
```bash
sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version
```

> This will install Java and verify the installed version.

<br>
<br>

### Step 2: Install Jenkins
1. Add Jenkins Key:
```bash
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
```
Explanation:

- This command downloads the Jenkins GPG key.

- Jenkins is open-source, so to ensure we install the official version securely, we use this signed key.

- **`wget`** is used to download files from the internet.

- **`-O`** specifies the output file location (**`/etc/apt/keyrings/...`**).

<br>
<br>

2. Add Jenkins to the system’s source list:
```bash
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
```

Explanation:

- This adds Jenkins to the list of software sources (your system’s APT sources).

- Source list = where the system looks for packages to install.

- This tells the system: "Hey, you can now install Jenkins from this URL."

<br>
<br>

3. Update package list:
```bash
sudo apt-get update
```
> This refreshes your system's package list to include Jenkins.

4. Install Jenkins:
```bash
sudo apt-get install jenkins
```

<br>
<br>

### Step 3: Start and Enable Jenkins
Check Jenkins status:
```bash
systemctl status jenkins
```

- systemctl is used to manage services.

- This checks if Jenkins is running or not.

Enable Jenkins to start on boot:
```bash
sudo systemctl enable jenkins
```
This command ensures Jenkins will automatically start whenever the system reboots.

<br>
<br>

### Step 4: Access Jenkins in Browser
- Jenkins runs on port 8080 by default.

- To access it: **`http://<your-ec2-public-ip>:8080`**

- But before that, go to your EC2 Inbound Rules and allow port 8080 for all IPs (0.0.0.0/0).

<br>
<br>

### Step 5: Unlock Jenkins
When you first open Jenkins in your browser, it will ask for an unlock password.

You'll find it in this file:
```bash
/var/lib/jenkins/secrets/initialAdminPassword
```
Use this password to unlock and start the setup.

<br>
<br>

### Step 6: Install Plugins
Jenkins will ask to install plugins. Plugins are add-ons that let Jenkins integrate with other tools like:

- Git/GitHub

- Docker

- AWS

- Slack

- JUnit, etc.

These plugins help Jenkins do CI/CD tasks more efficiently by connecting with external tools and services.

<br>
<br>

# Done! You’ve now successfully installed Jenkins and learned why each step matters.