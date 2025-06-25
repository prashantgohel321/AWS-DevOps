# 🛠️ Shell Scripting for DevOps – Day 03
📅 Date: 26th June, 2025 | 📍 Topic: Intermediate Scripting Techniques – Error Handling & Deployment Automation

---

## List of Contents
* <a href="#errors_intro">01 Let's Talk About Errors</a>
* <a href="#problem_scenario">02 Problem Scenario</a>
* <a href="#solution_error_handling">03 Solution: Add Error Handling</a>
* <a href="#useful_shell_commands">04 Some Useful Shell Commands for DevOps:</a>
* <a href="#real_world_devops_script">05 Let's Write a Real-World DevOps Script</a>
* <a href="#script_overview">06 Overview of the Script Goal:</a>
* <a href="#script_breakdown">07 Step-by-Step Script Breakdown:</a>
    * <a href="#script_header">07.01 Header</a>
    * <a href="#func_code_clone">07.02 Function 1: Clone the Django App Code</a>
    * <a href="#func_install_requirements">07.03 Function 2: Install System Dependencies</a>
    * <a href="#func_required_restarts">07.04 Function 3: Perform Required Restarts and Fix Permissions</a>
    * <a href="#func_deploy">07.05 Function 4: Build and Deploy App using Docker</a>
* <a href="#main_script_flow">08 Main Script – Bringing it All Together</a>
    * <a href="#main_step1">08.01 Step 1: Clone the Repo</a>
    * <a href="#main_step2">08.02 Step 2: Install Requirements</a>
    * <a href="#main_step3">08.03 Step 3: Restart Services / Fix Permissions</a>
    * <a href="#main_step4">08.04 Step 4: Deploy App</a>
* <a href="#final_summary_errors">09 Final Summary: What Errors Were Handled?</a>

---

<section id="errors_intro">

## ❌ Let's Talk About Errors
In most programming languages (like Python, Java), you handle errors using:

```python
try:
    # risky code
except:
    # handle errors
```

But in Shell Scripting, there's no try-catch.

So how do we handle errors in shell?
>👉 We use if, exit, return, !, and error codes ($?).

</section>

---

<section id="problem_scenario">

## 🧪 Problem Scenario
Let’s say you have a function that creates a directory:

```bash
#!/bin/bash

create_dir() {
    mkdir demo
}

create_dir
echo "This should print..."

# ✅ This will work the first time.
```
❌ But the second time, it will throw:
```bash
mkdir: cannot create directory ‘demo’: File exists
And your script may break unexpectedly.
```

</section>

<section id="solution_error_handling">

## ✅ Solution: Add Error Handling
Let’s wrap it in an if block:

```bash
if ! create_dir; then
    echo "Directory already exists. Exiting gracefully."
    exit 1
fi
# 🔥 ! means: “If the command fails…”
```

</section>

<section id="useful_shell_commands">

## 📥 Some Useful Shell Commands for DevOps:
| Command                                   | Purpose                                     |
| ----------------------------------------- | ----------------------------------------- |
| `sudo apt-get install docker.io nginx -y` | Install tools without asking confirmation |
| `sudo systemctl enable docker`            | Auto-start Docker on boot                   |
| `sudo systemctl enable nginx`             | Auto-start Nginx on boot                    |
| `sudo chown $USER /var/run/docker.sock`   | Fix Docker permission issue                 |

</section>

----

<section id="real_world_devops_script">

## 🚀 Let's Write a Real-World DevOps Script
Imagine you are deploying a Django app from GitHub. Here’s how you'd automate that with full error handling:

```bash
#!/bin/bash

# ----------- Function: Clone the Django App -----------
code_clone() {
    echo "Cloning the Django app..."
    if [ -d "django-notes-app" ]; then
        echo "✔️ Code directory already exists. Skipping clone."
    else
        git clone [https://github.com/LondheShubham153/django-notes-app.git](https://github.com/LondheShubham153/django-notes-app.git) || {
            echo "❌ Failed to clone the repository."
            return 1
        }
    fi
}

# ----------- Function: Install Dependencies -----------
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "❌ Failed to install dependencies."
        return 1
    }
}

# ----------- Function: Perform Required Restarts -----------
required_restarts() {
    echo "Fixing permissions and enabling services..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "❌ Failed to change Docker socket ownership."
        return 1
    }

    # Optional restarts
    # sudo systemctl enable docker
    # sudo systemctl enable nginx
    # sudo systemctl restart docker
}

# ----------- Function: Deploy the Django App -----------
deploy() {
    echo "Building and starting the app..."
    docker build -t notes-app . && docker-compose up -d || {
        echo "❌ Failed during Docker build or startup."
        return 1
    }
}

# ----------- Main Script Starts Here -----------
echo "🚀 ********** DEPLOYMENT STARTED ********** 🚀"

# Step 1: Clone Code
if ! code_clone; then
    cd django-notes-app || exit 1
fi

# Step 2: Install Dependencies
if ! install_requirements; then
    exit 1
fi

# Step 3: Restarts
if ! required_restarts; then
    exit 1
fi

# Step 4: Deploy the App
if ! deploy; then
    echo "📧 Deployment failed. Sending alert to admin..."
    # Optional: sendmail or Slack webhook logic here
    exit 1
fi

echo "✅ ********** DEPLOYMENT COMPLETED SUCCESSFULLY ********** ✅"
```

</section>

<section id="script_overview">

## 🧠 Overview of the Script Goal:
Automate the deployment of a Django app from GitHub on a Linux system with error handling for each step (clone, install, restart services, deploy with Docker).

</section>

<section id="script_breakdown">

## 📁 Step-by-Step Script Breakdown:

<section id="script_header">

### 🧱 Header
```bash
#!/bin/bash
```
- This is the shebang.
- Tells Linux: “Run this script using the Bash shell.”

</section>

---

<section id="func_code_clone">

## 🔧 Function 1: Clone the Django App Code
```bash
code_clone() {
    echo "Cloning the Django app..."

    if [ -d "django-notes-app" ]; then
        echo "✔️ The code directory already exists. Skipping clone."
    else
        git clone [https://github.com/LondheShubham153/django-notes-app.git](https://github.com/LondheShubham153/django-notes-app.git) || {
            echo "❌ Failed to clone the code."
            return 1
        }
    fi
}
```
### What this does:
- ✅ Checks if the folder `django-notes-app` already exists.
- If yes → Skip cloning to avoid Git error like:

```pgsql
fatal: destination path 'django-notes-app' already exists and is not an empty directory.
```
If no → Tries to `git clone` the repo.

❌ If the repo is unreachable (e.g., no internet, wrong URL), it returns 1 and prints an error.

How error is handled:
> Uses `|| { ... }` — executes the block on failure.

> Returns 1 to tell the main script: “I failed.”

</section>

---

<section id="func_install_requirements">

## ⚙️ Function 2: Install System Dependencies
```bash
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "❌ Failed to install dependencies."
        return 1
    }
}
```
### What this does:
- Updates package list (`apt-get update`)
Installs:
- `docker.io` (Docker engine)
- `nginx` (web server)
- `docker-compose` (for managing containers)

What could go wrong?
- ❌ No internet
- ❌ Broken sources in `/etc/apt/sources.list`
- ❌ Permission issues (`sudo` required)

How it's handled:
If any command fails, it runs the fallback block:

```bash
echo "❌ Failed to install dependencies."
return 1
```

</section>

---

<section id="func_required_restarts">

## 🔁 Function 3: Perform Required Restarts and Fix Permissions
```bash
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "❌ Failed to change ownership of docker.sock."
        return 1
    }

    # Optional (commented) restart logic:
    # sudo systemctl enable docker
    # sudo systemctl enable nginx
    # sudo systemctl restart docker
}
```
### What this does:
Fixes Docker socket permissions, so you can run Docker without sudo.

What could go wrong?
- ❌ If `/var/run/docker.sock` does not exist
- ❌ Wrong user or permission issue

How it’s handled:
- Fallback with `||` if `chown` fails
- Optional `systemctl` lines are commented — can be used if needed

</section>

---

<section id="func_deploy">

## 🐳 Function 4: Build and Deploy App using Docker
```bash
deploy() {
    echo "Building and deploying the Django app..."
    docker build -t notes-app . && docker-compose up -d || {
        echo "❌ Failed during Docker build or startup."
        return 1
    }
}
```
### What this does:
- Builds the Docker image with tag `notes-app`
- Runs the app in background using `docker-compose up -d`

Errors that can occur:
- ❌ No Dockerfile present
- ❌ Incorrect Dockerfile syntax
- ❌ Docker daemon not running
- ❌ `docker-compose.yml` misconfigured

Error handling:
- The `||` block catches any failure from build or deploy and logs the message
- Then returns 1 to exit the script cleanly

</section>
</section>

---

<section id="main_script_flow">

## 🧠 Main Script – Bringing it All Together

<section id="main_step1">

### ✅ Step 1: Clone the Repo
```bash
if ! code_clone; then
    cd django-notes-app || exit 1
fi
```
Calls the `code_clone` function.

- If it fails or the repo already exists → move into the folder manually.

- ❌ If `cd` fails (maybe folder doesn't exist), exit with `exit 1`.

</section>

<section id="main_step2">

### ✅ Step 2: Install Requirements
```bash
if ! install_requirements; then
    exit 1
fi
```
Skips all next steps if system tools aren’t installed.

</section>

<section id="main_step3">

### ✅ Step 3: Restart Services / Fix Permissions
```bash
if ! required_restarts; then
    exit 1
fi
# Checks Docker permission fix worked.
# If not, script stops here.
```

</section>

<section id="main_step4">

### ✅ Step 4: Deploy App
```bash
if ! deploy; then
    echo "📧 Deployment failed. Sending alert to admin..."
    # Add your sendmail or Slack alert logic here
    exit 1
fi
```
🚨 Fails gracefully and suggests an alert if something breaks during deploy.

</section>
</section>

---

<section id="final_summary_errors">

## 🔍 Final Summary: What Errors Were Handled?
| Step         | Possible Error                                    | Handling Method                                           |
| -------------- | ------------------------------------------------- | --------------------------------------------------------- |
| `git clone`    | Directory already exists / Git unreachable        | Check with `-d`, fallback with `|| { ... }` with `return 1` |
| `apt install`  | Internet failure / broken sources / sudo required | Used `|| { ... }` with `return 1`                     |
| `chown`        | Wrong file path / permission issue                | Caught with `|| { ... }`, script exits if fails         |
| `docker build` | No Dockerfile / build error                       | Caught with `|| { ... }`, custom error printed          |
| `cd`           | Missing folder                                    | `cd ... || exit 1` ensures early exit                   |
| Any command    | Non-zero return                                   | Entire flow uses `if ! func; then exit` for graceful stop |

</section>
