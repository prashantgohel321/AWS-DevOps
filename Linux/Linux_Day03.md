# Linux System-Level Commands, User Management, and File Permissions

This document covers essential Linux commands for system administration, user and group management, file permissions, compression, and file transfer. These commands are fundamental for DevOps engineers and system administrators.

---

# Day 03: Users and File Management

## List of Contents

* <a href="#01">01 System-Level Commands in Linux</a>
    * <a href="#01_01">01.01 `uname` – System Information</a>
    * <a href="#01_02">01.02 `uptime` – System Running Time</a>
    * <a href="#01_03">01.03 `date` – Current Date & Time</a>
    * <a href="#01_04">01.04 `who` vs `whoami`</a>
    * <a href="#01_05">01.05 `which` – Locate Executables</a>
    * <a href="#01_06">01.06 `id` – User and Group IDs</a>
    * <a href="#01_07">01.07 `sudo` – Super User Privileges</a>
    * <a href="#01_08">01.08 `shutdown` & `reboot` – Power Management</a>
    * <a href="#01_09">01.09 `apt` – Package Management on Debian/Ubuntu</a>
    * <a href="#01_10">01.10 Command History Search (Bonus Tip)</a>
    * <a href="#01_11">01.11 Other Popular Linux Package Managers</a>
    * <a href="#01_12">01.12 Summary Table: System-Level Commands</a>
* <a href="#02">02 Linux User and Group Management</a>
    * <a href="#02_01">02.01 Why User & Group Management?</a>
    * <a href="#02_02">02.02 How to Create a User</a>
    * <a href="#02_03">02.03 Set a Password for the User</a>
    * <a href="#02_04">02.04 Switch Between Users</a>
    * <a href="#02_05">02.05 View User Information</a>
    * <a href="#02_06">02.06 Delete a User</a>
    * <a href="#02_07">02.07 Add New Users (Example)</a>
    * <a href="#02_08">02.08 Create Groups</a>
    * <a href="#02_09">02.09 View Users and Groups</a>
    * <a href="#02_10">02.10 Add Users to Groups</a>
    * <a href="#02_11">02.11 Delete a Group</a>
    * <a href="#02_12">02.12 Summary Table: User and Group Management</a>
* <a href="#03">03 File Permission Commands in Linux</a>
    * <a href="#03_01">03.01 Why are File Permissions Important?</a>
    * <a href="#03_02">03.02 Viewing File Permissions</a>
    * <a href="#03_03">03.03 Permission Values Table</a>
    * <a href="#03_04">03.04 Changing File/Directory Permissions</a>
    * <a href="#03_05">03.05 File Ownership Commands</a>
    * <a href="#03_06">03.06 `umask` – Default Permission Setting</a>
* <a href="#04">04 Compression Commands in Linux</a>
    * <a href="#04_01">04.01 Install Zip Utility</a>
    * <a href="#04_02">04.02 Create a ZIP File</a>
    * <a href="#04_03">04.03 Extract a ZIP File</a>
    * <a href="#04_04">04.04 Gzip and Gunzip</a>
    * <a href="#04_05">04.05 Tar with Compression (Most Common for Linux)</a>
        * <a href="#04_05_01">04.05.01 Compress a Directory</a>
        * <a href="#04_05_02">04.05.02 Extract the Tar File</a>
* <a href="#05">05 File Transfer Commands (Local to Remote – EC2)</a>
    * <a href="#05_01">05.01 `scp` – Secure Copy</a>
    * <a href="#05_02">05.02 `rsync` – Remote Sync</a>

---

<section id="01">

### 🖥️ System-Level Commands in Linux (for DevOps & Admin Work)

<section id="01_01">

#### 1. `uname` – System Information

* Displays the OS name you're using.
* Common outputs:
    * `Linux` (on Ubuntu, RedHat, etc.)
    * `Darwin` (on macOS)

</section>

<section id="01_02">

#### 2. `uptime` – System Running Time

* Shows how long the system has been running, how many users are connected, and the system load average.
* Example: `10:41:09 up 9 min, 1 user, load average: 0.06, 0.07, 0.01`

</section>

<section id="01_03">

#### 3. `date` – Current Date & Time

* Outputs the current date and time of your system (UTC by default).

</section>

<section id="01_04">

#### 4. `who` vs `whoami`

| Command    | Description                                                 |
| :--------- | :---------------------------------------------------------- |
| `who`      | Shows all users who have logged into the system (current & past) |
| `whoami`   | Returns the username of the current user                    |

* If you want to know which user has logged in when and their activities, execute the `who` command.
* If you want to know which user is **currently logged** in to the system, execute the `whoami` command.

**Interview Tip: Q:** What's the difference between `who` and `whoami`?

> **Ans:** `who` shows a list of users (current and past logins with activity details), while `whoami` shows only the current active user.

</section>

<section id="01_05">

#### 5. `which` – Locate Executables

```bash
which bash
which cp
which java
```

* Shows the full path of an executable being used by the system.
* Helps debug issues when wrong versions or paths are involved.

</section>

<section id="01_06">

#### 6. `id` – User and Group IDs

* Displays **UID** (User ID) and **GID** (Group ID) of the **current user**.
* Useful when **managing permissions** and multiple users/groups on a system.

</section>

<section id="01_07">

#### 7. `sudo` – Super User Privileges

* `sudo` (SuperUser Do) allows a non-root user to run commands with administrative privileges.
* **What is sudo?**
    * It's a group, typically containing system administrators or users allowed to perform root-level tasks.
    * You can check if your user is in this group by executing the `id` command.
* **Analogy:** Imagine Linux as a house:
    * The Root user (Dad) owns everything.
    * You (Ubuntu user) need permission to touch certain files.
    * `sudo` is your way of temporarily getting Dad’s approval.
* Examples:

```bash
sudo rm file.txt          # Deletes a file as root
sudo shutdown             # Shuts down the system
sudo apt-get install xyz  # Installs software with root rights
```bash
id                       # Check current user groups
cat /etc/passwd          # List all user accounts
```

</section>

<section id="01_08">

#### 8. `shutdown` & `reboot` – Power Management

```bash
sudo shutdown
sudo reboot
```

* Requires root permission (`sudo`).
* Used in cloud environments (e.g., EC2 instances) and local Linux systems.

</section>

<section id="01_09">

#### 9. `apt` – Package Management on Debian/Ubuntu

* A command-line package manager for searching, managing, and querying information about packages.
* **Install Docker Example:**
    1.  `sudo apt install docker.io`
        * Initially, this might return "Permission denied" if not run with sudo.
        * Even with sudo, if packages are not updated, it might fail to find or install dependencies.
    2.  `sudo apt-get update`
        * This command updates the list of available packages and their dependencies. **Always run this before installing a new package.**
    3.  `sudo apt-get install docker.io`
        * After updating, this command will download from the internet and install Docker.
* **Tip:** Instead of typing commands repeatedly, you can search past commands by pressing `Ctrl + R` and typing a keyword.

```bash
sudo apt remove docker.io # To remove Docker
which docker              # Find Docker path
```

</section>

<section id="01_10">

#### 10. Command History Search (Bonus Tip)

* `Ctrl + R`: Press `Ctrl + R` and type a keyword to search previously used commands from your history.

</section>

<section id="01_11">

#### 11. Other Popular Linux Package Managers

| Manager   | For Distribution       |
| :-------- | :--------------------- |
| `yum`     | CentOS                 |
| `dnf`     | Fedora                 |
| `pacman`  | Arch Linux             |
| `portage` | ChromeOS               |
| `rpm`     | Red Hat Enterprise     |

</section>

<section id="01_12">

### 📌 Summary Table: System-Level Commands

| Command             | Purpose                               |
| :------------------ | :------------------------------------ |
| `uname`             | Shows system OS name                  |
| `uptime`            | How long the system is running        |
| `date`              | Shows current date & time             |
| `who` / `whoami`    | List all vs current user              |
| `which`             | Locate path of executables            |
| `id`                | Show user and group IDs               |
| `sudo`              | Execute commands as root              |
| `shutdown`          | Shut Down System                      |
| `reboot`            | Restart System                        |
| `apt`               | Install/Remove packages               |
| `Ctrl + R`          | Search previous commands              |
| `yum`, `dnf`, etc. | Other Linux distros' package managers |

</section>
</section>
---

<section id="02">

## 🧑‍💻 Linux User and Group Management (for DevOps)

One of the key reasons for Linux’s widespread use in enterprise and server environments is its robust user and group management system. It allows administrators to manage access, organize teams, and control system permissions securely and efficiently.

<section id="02_01">

### ✅ 1. Why User & Group Management?

* In companies, there are multiple users: DevOps engineers, testers, developers, admins, etc.
* Linux helps organize users into logical groups for access control.
* This is crucial for security, collaboration, and permission management.

</section>

<section id="02_02">

### ✅ 2. How to Create a User

```bash
sudo useradd -m jethalal
```

* `-m`: Creates a home directory for the user (e.g., `/home/jethalal`).
* `sudo`: Required because user creation needs superuser privileges.
* **Note:** You can check the current user using: `whoami`

</section>

<section id="02_03">

### ✅ 3. Set a Password for the User

```bash
sudo passwd jethalal
```

* Prompts you to set a login password for the new user.

</section>

<section id="02_04">

### ✅ 4. Switch Between Users

```bash
su jethalal
```

* `su` means "switch user", and it logs you in as `jethalal`.

```bash
exit
```

</section>

<section id="02_05">

### ✅ 5. View User Information

```bash
cat /etc/passwd
```

* Lists all the users on the system.

```bash
id
```

* Displays the user ID (UID) and group ID (GID) of the currently logged-in user.

</section>

<section id="02_06">

### ✅ 6. Delete a User

```bash
sudo userdel jethalal
sudo userdel -r jethalal # -r removes the user's home directory and mail spool
```

---

</section>

<section id="02_07">

## 👥 Group Management

Groups help manage permissions and roles. For example, DevOps team, QA team, etc.

### ✅ 7. Add New Users (Example)

```bash
sudo useradd devops1
sudo useradd devops2
sudo useradd tester1
sudo useradd tester2
sudo useradd tester3
```

</section>

<section id="02_08">

### ✅ 8. Create Groups

```bash
sudo groupadd devops
sudo groupadd testers
```

</section>

<section id="02_09">

### ✅ 9. View Users and Groups

```bash
cat /etc/passwd   # List all users
cat /etc/group    # List all groups
```

</section>

<section id="02_10">

### ✅ 10. Add Users to Groups

```bash
sudo gpasswd -a devops1 devops
sudo gpasswd -a devops2 devops
```bash
sudo gpasswd -M tester1,tester2,tester3 testers
```

* `-M`: Specify multiple members to add to a group in one go.

</section>

<section id="02_11">

### ✅ 11. Delete a Group

```bash
sudo groupdel testers
```
</section>

<section id="02_12">

### 📌 Summary Table: User and Group Management

| Command                   | Purpose                                     |
| :------------------------ | :------------------------------------------ |
| `useradd -m username`     | Add a new user with a home directory        |
| `passwd username`         | Set password for the user                   |
| `su username` / `exit`    | Switch to another user / go back            |
| `cat /etc/passwd`         | List all users                              |
| `cat /etc/group`          | List all groups                             |
| `userdel username`        | Delete a user                               |
| `groupadd groupname`      | Create a new group                          |
| `gpasswd -a user group`   | Add a user to a group                       |
| `gpasswd -M u1,u2 group`  | Add multiple users to a group               |
| `groupdel groupname`      | Delete a group                              |

</section>
</section>

**🧠 Interview Tip: Q:** What is the purpose of user groups in Linux?

> **A:** Groups help manage permissions collectively. Instead of assigning permissions user-by-user, we assign them to groups and add users to those groups. It simplifies permission management in multi-user systems.

---

<section id="03">

## 🔐 File Permission Commands in Linux

<section id="03_01">

### 📌 Why are File Permissions Important?

In a multi-user environment like Linux, file permissions ensure that only authorized users can read, write, or execute specific files and directories. This is crucial for security, especially in companies where sensitive data should be protected from unauthorized access.

To control permissions, Linux uses users and groups:

* **Owner (User):** The person who created the file.
* **Group:** A set of users who can have shared permissions.
* **Others:** Everyone else.

</section>

<section id="03_02">
### 🔍 Viewing File Permissions

To check the permissions of files and folders:

```bash
ls -l
```

Example output:

```
drwxrwxr-x  2 ubuntu ubuntu 4096 Jun 21  linux_for_devops
-rw-rw-r--  1 ubuntu ubuntu    0 Jun 21  devops-file.txt
```

**Explanation:**

* **First character:**
    * `d` = directory
    * `-` = file
* **Next 9 characters (broken into 3 sets of 3):** `rwx rwx r-x`
    * First = permissions for owner
    * Second = permissions for group
    * Third = permissions for others
* **Each position:**
    * `r` = read
    * `w` = write
    * `x` = execute
    * `-` = no permission

</section>

<section id="03_03">

### 🧮 Permission Values Table

| Permission | Binary | Octal |
| :--------- | :----- | :---- |
| `---`      | `000`  | `0`   |
| `--x`      | `001`  | `1`   |
| `-w-`      | `010`  | `2`   |
| `-wx`      | `011`  | `3`   |
| `r--`      | `100`  | `4`   |
| `r-x`      | `101`  | `5`   |
| `rw-`      | `110`  | `6`   |
| `rwx`      | `111`  | `7`   |

</section>

<section id="03_04">

### 🔧 Changing File/Directory Permissions

`chmod` – Change File Mode (permissions)

```bash
chmod
```

Examples:

```bash
chmod 777 cloud            # Gives rwxrwxrwx to the directory
chmod 664 devops-file.txt # Gives rw-rw-r-- to the file
```

</section>

<section id="03_05">

### 👤 File Ownership Commands

`chown` – Change File Owner

```bash
sudo chown jethalal devops-file.txt
```

</section>

<section id="03_06">

### 🧰 umask – Default Permission Setting

* `umask` defines the default permission mask for new files and directories.
* The default is usually `0002`, meaning:
    * New files get `664` (`rw-rw-r--`) permissions.
    * New directories get `775` (`rwxrwxr-x`) permissions.
* You can check the current umask with: `umask`

</section>
</section>

---

<section id="04">

## 📦 Compression Commands in Linux

Compression helps reduce the size of files or directories, making them easier to store and transfer.

<section id="04_01">

### 🔹 Install Zip Utility

```bash
sudo apt install zip
```

</section>

<section id="04_02">

### 🔹 Create a ZIP File

```bash
zip ldf.zip linux_for_devops
```

* Compresses the folder `linux_for_devops` into a ZIP file named `ldf.zip`.

</section>

<section id="04_03">

### 🔹 Extract a ZIP File

```bash
unzip ldf.zip
```

</section>

<section id="04_04">

### 🔹 Gzip and Gunzip

Used for compressing individual files.

```bash
gzip filename.txt    # Compresses to filename.txt.gz
gunzip filename.txt.gz # Decompresses to filename.txt
```

</section>

<section id="04_05">

### 🔹 Tar with Compression (Most Common for Linux)

#### 🔸 Compress a Directory

```bash
tar -cvzf cloud.tar.gz cloud
```

* `c` – create archive
* `v` – verbose (shows progress)
* `z` – compress using gzip
* `f` – specify the file name

#### 🔸 Extract the Tar File

```bash
tar -xvzf cloud.tar.gz
```

* `x` – extract files from archive
* `v` – verbose
* `z` – unzip
* `f` – specify the file name

</section>
</section>

---

<section id="05">

## 🔁 File Transfer Commands (Local to Remote – EC2)

When working with servers (like AWS EC2), you often need to transfer files from your local machine to the remote server.

<section id="05_01">

### 🔹 scp – Secure Copy

Used to copy files from local → remote, using a `.pem` key.

```bash
scp -i /path/to/key.pem /local/file.txt user@remote_ip:/destination_path
```

Example:

```bash
scp -i ~/keys/linux-key.pem hello.txt ubuntu@ec2-13-233-22-50.ap-south-1.compute.amazonaws.com:/home/ubuntu/
```

</section>

<section id="05_02">

### 🔹 rsync – Remote Sync

More advanced and efficient than `scp`, especially for syncing folders.

```bash
rsync -e "ssh -i /path/to/key.pem" -avz /local/folder/ user@remote_ip:/remote/folder/
```

* `-a` – archive mode (preserves permissions, etc.)
* `-v` – verbose output
* `-z` – compress during transfer

Example:

```bash
rsync -e "ssh -i ~/keys/linux-key.pem" -avz ./project/ ubuntu@ec2-13-233-22-50.ap-south-1.compute.amazonaws.com:/home/ubuntu/
```

</section>
</section>
