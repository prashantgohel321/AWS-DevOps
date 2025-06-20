# Linux Fundamentals: Day 01

This document covers fundamental concepts related to how the internet works, server types, application classifications, and an introduction to Linux, including its architecture, file system, and process management.

---

## Table of Contents

* <a href="#01">01 How Does the Internet Work?</a>
* <a href="#02">02 What is a Server?</a>
* <a href="#03">03 Difference between Web Server & Application Server.</a>
* <a href="#04">04 Types of Application</a>
	* <a href="#04_01">04_01 Standalone Applications</a>
	* <a href="#04_02">04_02 Web Applications</a>
* <a href="#05">05 Application Support</a>
* <a href="#06">06 What is Linux?</a>
* <a href="#07">07 How to install Linux?</a>
* <a href="#08">08 What is the Difference between Linux & Windows?</a>
* <a href="#09">09 Software & Tools to access a remote server or System</a>
* <a href="#10">10 What is Kernel, Bootloader, and Shell</a>
* <a href="#11">11 Linux System Architecture</a>
* <a href="#12">12 What is Linux File System</a>
* <a href="#13">13 What are the States of a Process in Linux?</a>

---

<section id=01>

## How Does the Internet Work?

When we access online content like YouTube videos or browse websites, it might seem like data comes directly from a satellite. In reality, the internet's infrastructure is more complex and relies heavily on physical connections.

1.  **Content Comes from Data Centers, Not Satellites**
    YouTube videos and other digital content are stored on powerful computers located in specialized facilities called **data centers**. A data center houses hundreds or thousands of servers (high-performance computers) dedicated to storing and managing vast amounts of data. When you request a video, you're connecting to one of YouTube's nearby data centers, not directly to their corporate office.

2.  **Data Travels Through Undersea Optical Fiber Cables**
    These data centers are interconnected globally via **optical fiber cables**, not satellites. These cables are laid across oceans, connecting continents and ensuring fast and reliable long-distance communication. When you stream a video, data travels through these underwater cables from the data center to your location.

3.  **Who Owns These Cables?**
    Large telecommunication companies such as Reliance Jio, AT&T, and others own and maintain these extensive optical fiber networks. They invest heavily in laying and maintaining these cables, and in return, they charge users (like us) for internet access through various plans and data packs.

4.  **The Role of ISP (Internet Service Provider)**
    So, how does the internet reach your device? This is where an **ISP (Internet Service Provider)** comes in. ISPs (e.g., Jio, Airtel, BSNL in India) are responsible for:
    * Installing internet infrastructure like towers, routers, and local fiber lines.
    * Assigning unique **IP addresses** to devices, which act as a digital "home address" for your device, telling data centers where to send requested information.

### In Simple Terms:

* Data is stored in **data centers**.
* It travels to you via **undersea fiber optic cables**.
* These cables are owned by big telecom companies.
* You access the internet through an **ISP**, which provides your device with an IP address and connects you to the network.

### Practical Understanding:

When you open YouTube:
1.  Your phone sends a request through your ISP (e.g., Jio).
2.  That request travels thousands of kilometers through cables to reach a data center.
3.  The data center sends the video data back to you through the same path, and you see it on your screen almost instantly.

</section>

---

<section id=02>

## What is a Server?

A **server** is simply a computer whose primary function is to **serve** information or resources to other computers or devices, known as **clients**. Whenever you make a request—like opening a website, checking email, or saving a file online—a server processes that request and sends back the correct response.

### Types of Servers Based on the Type of Request:

Servers specialize in different tasks:
1.  **Email Server:** Handles email-related requests (sending, receiving, storing emails).
2.  **File Server:** Stores files for users to upload and download.
3.  **Database Server:** Manages and provides access to databases (e.g., user information for an application).
4.  **Application Server:** Runs applications like Facebook or Instagram, handling their business logic and user interaction.
5.  **Web Server:** Delivers web pages, including HTML, CSS, and images.

### So, What Does a Server Do?

* It waits for requests from other computers (clients).
* It processes those requests.
* It sends back the correct data or response.
This is why the name "server" makes sense—it serves.

### What is a Client?

A **client** is any device or software that requests data from a server.
Examples of clients:
* Your smartphone
* A web browser (e.g., Chrome, Firefox)
* A desktop or laptop running an application

In simple terms:
* **Client** = asks for something (request)
* **Server** = gives what was asked (response)

### Practical Example: Opening YouTube in a Browser

Let's illustrate how the internet and servers work together:
1.  **You type `youtube.com` into Chrome.**
    * Chrome is your browser, acting as a **client**.
2.  **Browser checks with ISP (Internet Service Provider).**
    * Your ISP verifies your internet connection.
3.  **Browser needs to find the IP address of `youtube.com`.**
    * Domain names (like `youtube.com`) are for humans; computers need IP addresses (e.g., `142.250.192.206`).
4.  **DNS Server comes into play.**
    * A special server called a **DNS Server (Domain Name System)** converts the domain name into the correct IP address.
5.  **Browser sends a request to YouTube’s servers.**
    * This request goes to **Application Servers**, **Web Servers**, or even **Database Servers**, depending on your activity on the site.
6.  **Server processes the request and sends back a response.**
    * For example, it streams a video to you.

### In Summary:

| Term     | Role                               |
| :------- | :--------------------------------- |
| **Server** | Responds to client requests        |
| **Client** | Sends requests to the server       |
| **Browser**| A type of client to access web data|
| **ISP** | Connects you to the internet       |
| **DNS** | Converts domain names to IPs       |

</section>

---

<section id=03>

## Difference Between Web Server and Application Server

To understand the difference, let's start with a simple idea:
* A **web server** deals with **static content**.
* An **application server** handles **dynamic content**.

### What is a Web Server?

A **web server** is used to store and deliver static files such as:
* HTML files
* CSS stylesheets
* JavaScript files (not the runtime)
* Images (JPG, PNG)
* Static documents

When you open a basic website that shows fixed information, like a company's "About Us" page, this data is most likely being served from a web server.
**Example:** You configure Nginx or Apache to host your HTML files and images. When a user requests `index.html`, the web server directly sends that file to the browser.

### What is an Application Server?

An **application server** is used to run server-side code and generate **dynamic content**. It handles:
* Backend logic
* Interactions with databases
* Calculations or decision-making

Application servers are often used when:
* The content of the page depends on user input or data stored in a database.
* You need to perform server-side scripting or processing before sending a response.
**Example:** You run a Django (Python) or Node.js app. When a user logs in, the application server checks credentials in a database and generates a personalized response.

### Key Difference:

| Feature           | Web Server                    | Application Server                 |
| :---------------- | :---------------------------- | :--------------------------------- |
| **Serves** | Static content (HTML, images) | Dynamic content (data, responses)  |
| **Role** | Delivers files as-is          | Runs code to generate content      |
| **Examples** | Nginx, Apache                 | Django (Python), Node.js, Spring   |
| **Works with DB?**| No                            | Yes                                |
| **Business Logic?**| No                            | Yes                                |

### Real-Life Analogy:
* Think of a web server like a **menu board at a restaurant**. It shows the same menu to everyone.
* An application server is like the **chef in the kitchen**. Based on your order, it prepares a specific dish for you.

### Combined Use:
Often in real-world web development:
* A web server (like Nginx) is placed in front to handle static files and forward dynamic requests to the application server.
* This combination improves performance and separation of concerns.

**Summary:**
* **Web server** = for delivering static content quickly.
* **Application server** = for processing requests and returning customized, dynamic content.


</section>

---

<section id=04>

## Types of Applications

Applications can mainly be categorized into two types:
1.  **Standalone Applications**
2.  **Web Applications**

<section id=04_01>

### 1. Standalone Applications

A **standalone application** is a software program that runs independently on a single machine. It does not require an internet or network connection to function.

**Key Characteristics:**
* Installed and used on one system (PC, kiosk, or device).
* No external servers or internet connection required.
* Typically has a fixed set of features.
* All logic and storage happen locally.

**Example:** A feedback system at an airport where you rate your experience by touching a screen.
* Runs offline.
* Doesn’t depend on external servers (like database or mail servers).
* Stores data locally or temporarily.

**DevOps View:** If you're managing a standalone application, you don’t need to deal with backend infrastructure like databases, APIs, or cloud platforms. Most of the operations are handled on the device itself.

</section>

<section id=04_02>

### 2. Web Applications

A **web application** runs with the help of the internet. It connects multiple services and servers to perform tasks dynamically.

**Key Characteristics:**
* Accessible through browsers (e.g., Chrome, Safari).
* Requires internet connection.
* Connects to multiple components like:
    * Web server (to serve web pages)
    * Application server (for business logic)
    * Database server (to store data)
    * Email server, cache, file storage, etc.
* Supports user logins, data processing, notifications, file uploads, etc.

**Examples:**
* **YouTube.com:** Streams videos, stores user preferences, sends notifications.
* **Instagram.com:** Manages user profiles, messaging, media uploads, and more.

**DevOps View:** If you’re working on a web application, your responsibilities can include:
* Managing backend and frontend integration.
* Deploying services using tools like Docker or Kubernetes.
* Setting up CI/CD pipelines.
* Monitoring performance and availability.
* Handling cloud infrastructure (AWS, GCP, Azure).

</section>

### Summary Comparison:

| Feature             | Standalone Application      | Web Application                        |
| :------------------ | :-------------------------- | :------------------------------------- |
| **Internet Required?**| No                          | Yes                                    |
| **Runs On** | Single system               | Multiple connected systems             |
| **Depends On Servers?**| No                         | Yes (Web, DB, Email, etc.)             |
| **Storage** | Local                       | Central (cloud or data center)         |
| **DevOps Involvement**| Minimal                     | High (infrastructure, deployment, scaling)|
| **Example** | Airport feedback kiosk      | YouTube, Instagram                     |

### Why This Matters for DevOps Engineers:

As a DevOps engineer, it’s important to identify the type of application you're working with:
* For **standalone applications**, there's usually no need for complex infrastructure.
* For **web applications**, you must manage and automate the entire ecosystem of services (servers, databases, APIs, cloud, etc.).

Understanding this difference helps you decide:
* Which tools to use.
* How to design your infrastructure.
* How to deploy and maintain the application efficiently.

</section>

---

<section id=05>

## What is Application Support?

**Application Support** refers to the ongoing process of monitoring, maintaining, and troubleshooting applications to ensure they run smoothly on their respective operating systems—like Linux, Windows, or macOS. Applications—whether mobile apps, desktop tools, or web platforms—require support to keep them stable, secure, and updated throughout their lifecycle.

### Why is Application Support Important?

Even after an application is developed and deployed, it needs continuous attention to:
* Ensure it's running correctly without crashes or slowdowns.
* Detect and fix errors or bugs.
* Apply security patches and updates.
* Manage performance and reliability.
* Handle user issues or tickets.
This ongoing process is known as Application Support and Maintenance.

### Real-World Example:

Suppose you have an app like Instagram installed on your phone:
* If it crashes every time you try to open it, that’s an application issue.
* If the feed doesn’t refresh or messages aren’t being delivered, something needs to be checked in the backend.
* Application Support teams would investigate such issues, check logs, analyze performance, and fix them.

### Role of Application Support in DevOps:

From a DevOps perspective, Application Support involves:
* Monitoring apps using tools like Prometheus, Grafana, or Datadog.
* Checking system logs with tools like ELK Stack or Splunk.
* Creating alerts when an app crashes or behaves unexpectedly.
* Ensuring the application is available 24/7.
* Performing root cause analysis if something goes wrong.

### Common Tasks in Application Support:

| Task                 | Description                                                |
| :------------------- | :--------------------------------------------------------- |
| **Monitoring** | Check if app and services are running as expected          |
| **Incident Management**| Respond to and resolve real-time issues or failures      |
| **Bug Fixes** | Work with development teams to patch application problems  |
| **Log Analysis** | Review system/application logs to identify the source of an issue|
| **Performance Tuning**| Ensure app responds quickly and uses resources efficiently|
| **Scheduled Maintenance**| Apply updates, patches, or restart services during low-traffic windows|

**Summary:**
* Application Support ensures that apps stay functional, reliable, and performant.
* It plays a key role in post-deployment lifecycle management.
* Without support, even well-developed applications can fail in production.
* For DevOps engineers, mastering application support means mastering tools, logs, and monitoring strategies to keep systems healthy.

</section>

---

<section id=06>

## What is Linux?

First, let's define an Operating System. An **Operating System (OS)** is a system software—a big program—that acts as a bridge between the user and the hardware. It helps run applications and manage system resources like memory, CPU, and storage.
Examples of OS:
* Windows
* macOS
* Linux

### Now, what is Linux?

**Linux** is a free and open-source OS. It was invented by Linus Torvalds in 1991. Today, it's one of the most popular OS choices in the server and cloud world, especially for DevOps and system engineering.

### Why is Linux so popular in production?

* **Open-source:** Anyone can view, modify, and improve the code.
* **No license cost:** Unlike Windows or Unix, it’s completely free.
* **Secure:** Less prone to viruses, with strong permission controls.
* **Stable and Lightweight:** Handles high workloads efficiently.
* **Multitasking:** Easily runs multiple tasks in parallel.
* **Huge community support:** Thousands of contributors worldwide.
* **Highly customizable:** You can modify the kernel or build your own distro.

### Why do most applications run on Linux?

Even though most people use Windows on personal devices, in the backend (servers, cloud, production), 90% of applications run on Linux. That’s because:
* Linux works better for servers.
* It’s easy to automate and script (via Bash/Shell).
* It runs great on cloud platforms like AWS, GCP, Azure.
* Tools like Docker, Kubernetes, Jenkins, Ansible, etc., are built for Linux.

So as a DevOps engineer, learning Linux is mandatory.

### What is Unix?

**Unix** is a commercial operating system developed in the 1970s.
* It’s powerful and secure, but it’s not free—you need a license to use it.
* **Example of Unix-based OS:** macOS. macOS is based on a Unix variant called BSD (Berkeley Software Distribution).

### Summary Table: Linux vs. Unix

| Feature       | Linux                           | Unix                             |
| :------------ | :------------------------------ | :------------------------------- |
| **Cost** | Free (open source)              | Paid (commercial)                |
| **Creator** | Linus Torvalds (1991)           | AT&T Bell Labs (1970s)           |
| **Example** | Ubuntu, CentOS, Red Hat         | macOS, IBM AIX, Solaris          |
| **Source Code**| Open to public                  | Closed or licensed               |
| **Usage** | Servers, Cloud, IoT, DevOps     | Mostly enterprise environments   |
| **Flexibility**| Highly customizable             | Less customizable                |

</section>

---

<section id=07>

## How to Install Linux?

There are multiple ways to set up and use Linux depending on your system and use case. Below are the most popular and practical options:

### 1. WSL (Windows Subsystem for Linux)

If you are using Windows 10 or 11, this is the simplest way to start using Linux without creating a new partition or VM.
* WSL lets you run a Linux terminal inside Windows.
* You can install popular distributions like Ubuntu, Debian, Kali, etc.
* Great for learning shell commands, scripting, and DevOps tools.

**How to install WSL:**
* Use the command: `wsl --install`
* After that, choose your preferred Linux distro (Ubuntu is highly recommended).
* Use it via `cmd` or the new Windows Terminal.

### 2. VirtualBox (Run Linux inside a VM)

If you want a full Linux desktop experience, use VirtualBox (free software by Oracle).
**Steps:**
* Install VirtualBox.
* Download an ISO of a Linux distro (e.g., Ubuntu Desktop).
* Create a new VM in VirtualBox and mount the ISO.
* Install Linux inside the VM.

✅ **Pros:** Full Linux GUI
⛔️ **Cons:** Requires more RAM & disk space

### 3. Cloud VMs (AWS, Azure, GCP)

If you're preparing for a DevOps or Cloud career, this is the best option. You can create a virtual Linux server in the cloud (called an EC2 instance in AWS, VM in Azure/GCP).
* Access it remotely via SSH.
* Practice real-world tools like Docker, Jenkins, Kubernetes, etc.
* Learn DevOps workflows in a cloud-native way.

### How to Install Linux on a Windows PC?

If you want to install Linux alongside or in place of Windows, follow this approach:
1.  Download a Linux distro ISO (e.g., Ubuntu from `ubuntu.com`).
2.  Create a bootable USB using tools like Rufus or BalenaEtcher.
3.  Restart your PC and boot from USB.
4.  Follow installation steps:
    * Choose to install Linux only or dual-boot with Windows.
    * Allocate disk space.
    * Set up username/password.

⚠️ **Backup your data before installing Linux on bare metal.** This method gives you full Linux performance but requires you to commit your machine.

</section>

---

<section id=08>

## What is the Difference Between Linux and Windows?

Here’s a breakdown:

| Feature                | Linux                          | Windows                               |
| :--------------------- | :----------------------------- | :------------------------------------ |
| **License Type** | Open-source (GPL)              | Commercial (requires license)         |
| **Cost** | Free                           | Paid (often pre-installed)            |
| **Target Users** | Developers, sysadmins, DevOps  | General-purpose (office, home use)    |
| **User Interface** | CLI-focused (GUI optional)     | GUI-focused                           |
| **Antivirus Requirement**| Not usually needed             | Often requires third-party antivirus  |
| **Customizability** | Highly customizable (open source)| Limited                               |
| **Software Installation**| Package managers (apt, yum)    | Executables (.exe, .msi)              |
| **Stability** | Very stable for server environments| Can degrade over time                 |
| **Popular Use** | Servers, cloud, embedded, DevOps| Desktops, gaming, office              |

**Key DevOps Perspective:**
* **Linux is essential for DevOps roles** due to its flexibility, scripting power, and native support for most modern tools.
* **Windows is rarely used in cloud or server-side deployments** unless working with .NET or legacy systems.

</section>

---

<section id=09>

## Software & Tools to Access a Remote Server or System

**Problem Statement:**
Suppose you are not physically near your laptop or server, but you still want to access it remotely, like a virtual machine (VM). As a DevOps Engineer, this is a critical skill — to troubleshoot, deploy, or monitor systems remotely.

### Remote Access Tools:

1.  **RDP (Remote Desktop Protocol)**
    * **What is it?** A Microsoft protocol that allows you to connect to another Windows machine with a full graphical interface.
    * **Used for:** GUI-based remote access (good for Windows servers/desktops).
    * **How to use:**
        * From Windows: Use the Remote Desktop Connection app.
        * From Linux/Mac: Use tools like `rdesktop` or Remmina.
    🖥️ You see the remote screen, control mouse/keyboard.

2.  **SSH (Secure Shell)**
    * **What is it?** A command-line tool used to access Linux/Unix systems remotely in a secure way.
    * **Used for:** Running commands, managing servers, deploying applications.
    * **How to use:** `ssh username@ip_address`
        * You need SSH enabled on the server.
        * You can also use key-based authentication for extra security.
    💡 Most DevOps tools (like Ansible, Docker, Jenkins agents) use SSH under the hood.

3.  **AnyDesk / TeamViewer / Chrome Remote Desktop**
    * **What is it?** Third-party remote desktop apps that let you connect to any OS (Windows/Linux/macOS) using their software.
    * **Used for:** GUI access across any platform, even through firewalls and NAT.
    * **How to use:**
        * Install AnyDesk on both systems.
        * Share your ID and allow access.
    ✅ Works cross-platform
    ✅ Good for GUI remote support
    ❌ Less used in professional DevOps environments (more common in IT support)

### 🚀 Why DevOps Engineers Should Know These:
* Most DevOps work is done on remote servers in the cloud (AWS, GCP, Azure).
* You’ll need to:
    * Connect to Linux servers via SSH.
    * Remotely manage apps, logs, and configurations.
    * Troubleshoot issues without touching the physical machine.

### ⚙️ Advanced Tools (Bonus for DevOps)

| Tool      | Use Case                        |
| :-------- | :------------------------------ |
| **MobaXterm**| SSH + SFTP + Remote GUI (Windows)|
| **PuTTY** | Lightweight SSH client (Windows)|
| **VNC** | Remote desktop access (GUI)     |
| **tmux / screen**| Persistent SSH sessions         |

</section>

---

<section id=10>

## What is Kernel, Bootloader, and Shell?

To understand Linux (or any operating system), it's important to know these three core components:

### 1. What is a Kernel?
* The **Kernel** is the **heart of the operating system**.
* It is a program written in low-level languages like C that directly interacts with the hardware (CPU, memory, disk, etc.).
* Its main job is to **manage resources**—like running processes, allocating memory, handling device input/output, and managing the file system.

**So why do we need a kernel?**
Because users and software can’t directly talk to the hardware—that would be risky and unstable. The kernel acts as a manager and protector, handling everything safely and efficiently.

**Linux Kernel:**
* The Linux Kernel is the core program of the Linux OS, created by Linus Torvalds in 1991.
* It's open-source, and developers around the world contribute to improve it.

### 2. What is a Shell?
* A **Shell** is a program that acts as an **interface between you (the user) and the kernel**.
* You type commands into the shell (like `mkdir`, `ls`, `cd`), and the shell translates those into instructions the kernel understands.

**Example:**
Let’s say you want to create a folder:
1.  You type `mkdir newfolder` in the shell.
2.  The shell sends the request to the kernel.
3.  The kernel talks to the file system and creates the folder.
You don’t need to know how to program in C—the shell hides the complexity and lets you control the system using simple commands.

**Types of Shells:**
* **Bash** (Bourne Again Shell) – Most common on Linux.
* **Zsh, Fish, Ksh** – Other variants with extra features.

### 3. What is a Bootloader?
* When you turn on your computer, something needs to start the OS—this is the job of the **bootloader**.
* A **bootloader** is a small program that loads the OS kernel into memory and starts it.
Without the bootloader, your computer wouldn't know how to start Linux or any OS.

**GRUB – The Most Popular Linux Bootloader:**
* **GRUB** stands for **GRand Unified Bootloader**.
* It allows you to:
    * Choose between operating systems (if dual booting).
    * Set startup options.
    * Troubleshoot OS boot failures.
Other bootloaders: LILO (Linux Loader), SYSLINUX. But GRUB is the most used and flexible.

### 🔁 Simple Boot Process Flow:
1.  **Power ON**
2.  **BIOS/UEFI** runs (initial hardware checks)
3.  **Bootloader** (like GRUB) is loaded
4.  **Bootloader loads the Linux Kernel**
5.  **Kernel** initializes system and hardware
6.  **Shell or GUI login** is presented to user
7.  You can now type commands or interact with the system

### ✅ Summary:

| Component     | Role                                       |
| :------------ | :----------------------------------------- |
| **Kernel** | Core of OS, manages hardware, memory, processes|
| **Shell** | Interface between user and kernel; interprets commands|
| **Bootloader**| Starts the OS by loading the kernel after the system is powered on|


</section>

---

<section id=11>

## Linux System Architecture

To understand how Linux works internally, we break it down into four major layers:

### 1. Hardware
This is the physical part of your computer — CPU, RAM, disk drives, USB devices, printers, webcams, etc. You cannot directly talk to hardware as a user. That’s where the next layer comes in.

### 2. Kernel
The **kernel** sits just above the hardware. It is the core component of the operating system.
**What it does:**
* Manages CPU scheduling, memory, input/output, disk, and network devices.
* Controls the hardware on your behalf.
* Handles device drivers (for printer, webcam, USB, etc.).
Think of it as a bridge between hardware and software.

### 3. Shell
The **shell** is a program that interacts with the kernel.
* You (the user) talk to the shell using commands.
* The shell then passes your instructions to the kernel.
* The shell hides the complexity of the kernel.
You can use different types of shells — Bash, Zsh, etc.

### 4. Applications / Utilities
At the top layer, you have:
* Linux utilities (`ls`, `mkdir`, `ping`, `vim`).
* Installed software (browsers, code editors).
* DevOps tools (Docker, Git, Ansible).
These applications use shell (or GUI) to send instructions to the kernel.

### 🔁 Practical Flow (with Example):
Let’s say you want to turn off a webcam:
1.  You open a terminal and run a command (using an application).
2.  That command goes to the shell.
3.  The shell tells the kernel: "Turn off this webcam."
4.  The kernel talks to the hardware and disables the webcam.

### 🧠 Diagram Representation:
```
Applications / Utilities
       ↑
     Shell
       ↑
     Kernel
       ↑
     Hardware
```

### ✅ Summary:

| Layer         | Role                                      |
| :------------ | :---------------------------------------- |
| **Hardware** | Physical devices                          |
| **Kernel** | Talks to hardware, manages system resources|
| **Shell** | Takes commands from user and sends to kernel|
| **Applications**| Let users run tasks via shell or GUI      |

</section>

---

<section id=12>

## What is Linux File System?

The **Linux File System** is how files and directories (folders) are organized in Linux.

✅ **Key Point:** Everything in Linux starts from a single **root directory**, represented by a forward slash `/`. From this root `/`, all other directories branch out like a tree. Whether it's your personal files, software, devices, or system configurations—everything is under `/`.

### 🗂️ Common Folders Under Root `/`:

| Folder      | What it Contains                                          |
| :---------- | :-------------------------------------------------------- |
| `/bin`      | Essential binary files (commands) like `ls`, `cat`, `cp`  |
| `/boot`     | Files needed to boot the system (like the Linux kernel and bootloader files)|
| `/dev`      | Represents device files like USB, hard disk, webcam       |
| `/etc`      | Configuration files for the system and installed software |
| `/home`     | Personal folders for each user, like `/home/prashant`     |
| `/lib`      | Essential libraries required by programs in `/bin` and `/sbin`|
| `/media`    | Mount points for external media (USB, CD-ROM)             |
| `/mnt`      | Temporarily mounted file systems                          |
| `/opt`      | Optional software packages                                |
| `/proc`     | Virtual folder showing info about running processes and system status|
| `/root`     | Home directory of `root` (admin) user                     |
| `/run`      | Runtime information (used by system at startup)           |
| `/sbin`     | System admin-level commands                               |
| `/tmp`      | Temporary files                                           |
| `/usr`      | User-level applications and files (like installed software)|
| `/var`      | Variable files — logs, emails, cache, etc.                |

📌 **Example:** If you use the command `cd /`, you'll be at the root directory. You can then `ls` to list the core folders shown above.

</section>

---

<section id=13>

## What are the States of a Process in Linux?

A **process** is any program that's currently being executed. Every process in Linux has a **state** that shows what it is currently doing. You can see process states using `ps` or `top` command.

### 🔄 Common Process States:

| State | Name                 | Description                                    |
| :---- | :------------------- | :--------------------------------------------- |
| **R** | Running              | The process is currently running or ready to run|
| **S** | Sleeping (Interruptible)| Waiting for an event (like user input or file read)|
| **D** | Uninterruptible Sleep| Waiting for hardware resource (e.g., disk I/O)|
| **T** | Stopped              | The process is stopped (paused)                |
| **Z** | Zombie               | Process completed but not cleaned up by its parent|
| **X** | Dead                 | Terminated process (rarely visible)            |

