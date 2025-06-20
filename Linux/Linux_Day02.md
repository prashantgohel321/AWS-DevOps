# Day 02: Linux Commands

## Essential Linux Commands

These commands help you interact with the Linux filesystem, create/remove files and directories, and view file contents.

---

## Table of Contents

* <a href="#01">01 Navigation & Directory Commands</a>
* <a href="#02">02 File & Directory Management</a>
* <a href="#03">03 Viewing and Writing to Files</a>
* <a href="#04">04 Advanced Linux Commands (For DevOps & Power Users)</a>
	* <a href="#04_01">04_01. cp</a>
	* <a href="#04_02">04_02. mv</a>
	* <a href="#04_03">04_03. wc</a>
	* <a href="#04_04">04_04. Hard Link vs Soft Link (ln)</a>
	* <a href="#04_04">04_05. cut</a>
	* <a href="#04_06">04_06. tee</a>
	* <a href="#04_07">04_07. sort</a>
	* <a href="#04_08">04_08. diff</a>
	* <a href="#04_09">04_09. vi</a>
* <a href="#05">05 Login Related: SSH & Remote Access</a>
* <a href="#06">06 Disk Usage Commands (Storage Monitoring)</a>
	* <a href="#06_01">06_01. df</a>
	* <a href="#06_02">06_02. du</a>
	* <a href="#06_03">06_03. ls -a</a>
* <a href="#07">07 Process Management Commands</a>



---

<section id=01>

### 🔹 Navigation & Directory Commands

| Command                 | Description                                                  |
| :---------------------- | :----------------------------------------------------------- |
| `pwd`                   | Shows the current working directory (where you are in the filesystem) |
| `cd <directory_name>`   | Changes to the specified directory                             |
| `cd ..`                 | Moves one step back to the parent directory                  |
| `cd /`                  | Takes you to the root directory (/)                          |
| `ls`                    | Lists all files and folders in the current directory         |
| `ls -l`                 | Lists with detailed information (permissions, size, date, time) |

</section>

<section id=02>

### 🔹 File & Directory Management

| Command                 | Description                                                  |
| :---------------------- | :----------------------------------------------------------- |
| `mkdir <dir_name>`      | Creates a new directory (folder)                             |
| `touch <file.ext>`      | Creates a new empty file with the specified name and extension |
| `rmdir <dir_name>`      | Removes an empty directory                                   |
| `rm <file.ext>`         | Deletes a file                                               |
| `rm -r <dir_name>`      | Deletes a directory and its contents recursively (`-r` = recursive) |

✅ **Use `rm -rf <dir>` with caution — it will force delete everything inside.**

</section>

<section id=03>

### 🔹 Viewing and Writing to Files

| Command                    | Description                                                  |
| :------------------------- | :----------------------------------------------------------- |
| `cat <file.ext>`           | Displays the entire content of a file                        |
| `echo "<message>"`         | Prints the message in the terminal                           |
| `echo "<message>" > <file.ext>` | Writes the message to a file (creates file if not exists, overwrites content) |
| `zcat <zipfile.gz>`        | Displays content of a compressed (.gz) file                  |
| `head <file.ext>`          | Shows the first 10 lines of a file                           |
| `tail <file.ext>`          | Shows the last 10 lines of a file                            |
| `tail -f <file.ext>`       | Monitors the file in real-time — great for watching logs update live |
| `less <file.ext>`          | Opens the file one page at a time (press `q` to quit)        |
| `more <file.ext>`          | Similar to less, displays file page by page                  |

✨ `tail -f` is commonly used in DevOps for log monitoring during deployments and debugging.

🧠 **Tips:**

* You can create and write to a file in one go using:
    ```bash
    echo "Hello World" > hello.txt
    ```
* View current directory contents neatly with:
    ```bash
    ls -lh
    ```
* Press `Ctrl + C` to exit from commands like `tail -f` or when you're stuck in terminal.

</section>

---

<section id=04>

## 🔧 Advanced Linux Commands (For DevOps & Power Users)

<section id=04_01>

### 🔹 1. `cp` – Copy Files or Directories

```bash
cp <source> <destination>
```

* Copies files or folders from one place to another.

📌 **Examples:**
```bash
cp new_file.txt devops/             # Copy file into "devops" folder
cp devops/new_file.txt cloud/       # Copy file from devops to cloud
cp -r cloud/ devops/                # Copy entire "cloud" folder into "devops"
```

</section>

<section id=04_02>

### 🔹 2. `mv` – Move or Rename

```bash
mv <source> <destination>
```

* Moves or renames files/directories.

📌 **Examples:**
```bash
mv new_file.txt ../cloud/           # Move file to another folder
mv devops/ linux_for_devops         # Rename the directory
```

</section>

<section id=04_03>

### 🔹 3. `wc` – Word Count

```bash
wc <file>
```

Shows:
* Line count
* Word count
* Byte count

📌 **Example:**
```bash
cat new_file.txt            # Output: this is my file
wc new_file.txt             # Output: 1  4  16
                            # (1 line, 4 words, 16 bytes)
```
Can also be used with multiple files.

</section>

<section id=04_04>

### 🔹 4. Hard Link vs Soft Link

🔗 **What are Links?**
Links are like shortcuts to a file. There are two types:

| Type              | Description                                                  |
| :---------------- | :----------------------------------------------------------- |
| **Hard Link** | Points directly to the data. Even if the original file is deleted, the link remains. |
| **Soft Link (Symbolic)** | Points to the filename/path. If original file is deleted, soft link breaks. |

🔧 **Create a Hard Link:**
```bash
ln original.txt hardlink.txt
```
🔧 **Create a Soft Link:**
```bash
ln -s original.txt softlink.txt
```
📌 **Check Links:**
```bash
ls -ltr             # Shows file type and link relationships
```

</section>

<section id=04_05>

### 🔹 5. `cut` – Extract Bytes or Characters

```bash
cut -b 1 myfile.txt
```
* Extracts the first byte of each line.
* From this, it will output `t`.

</section>

<section id=04_06>

### 🔹 6. `tee` – Output + Save Simultaneously

```bash
echo "hello" | tee new2File.txt
```
* Displays output in terminal.
* Also saves it into `new2File.txt`.
Useful when you want to log something while still seeing it live.

</section>

<section id=04_07>

### 🔹 7. `sort` – Sort Lines in a File

```bash
sort myfile.txt
```
* Sorts lines alphabetically.
* You can use flags like `-r` (reverse), `-n` (numeric sort).


</section>

<section id=04_08>

### 🔹 8. `diff` – Compare Two Files

```bash
diff file1.txt file2.txt
```
* Shows the differences between two files.
* Very useful for config comparison, troubleshooting, etc.


</section>

<section id=04_09>

### 🔹 9. `vi` – Vim/Vi Text Editor

```bash
vi <filename>
```
**Basic Controls:**
* `i` – Enter insert mode to type
* `Esc` – Exit insert mode
* `:w` – Write (save) the file
* `:q` – Quit
* `:wq` – Save and quit

Vi is essential when working on remote Linux servers without a GUI.


</section>

</section>
---

<section id=05>

## 🔐 Login Related: SSH & Remote Access

✅ **What is SSH?**
SSH stands for Secure Shell — it is a secure way to remotely connect to another computer/server over a network.

* Default Port: `22`
* It encrypts the connection, making it safe even over public networks.
* Commonly used in DevOps to connect to Linux servers (like EC2 in AWS).

🔑 **SSH Key-Based Authentication (Public & Private Key)**
SSH works using a pair of cryptographic keys:

| Key Type      | Stored Where?         | Purpose                            |
| :------------ | :-------------------- | :--------------------------------- |
| **Public Key** | On the remote server  | Used to validate the connecting user |
| **Private Key** | On your local machine | Used to initiate a secure connection |

🔁 **How It Works (Real Example)**
Let’s say:
* You're on your laptop.
* You want to connect to an AWS EC2 instance (server).

Behind the scenes:
1.  You use your private key (on your laptop).
2.  The EC2 server checks your public key (already stored on the instance).
3.  If both match, the connection is allowed.

💡 **AWS Key Pair (Real DevOps Scenario)**
When you launch an EC2 instance:
* AWS runs `ssh-keygen` in the background to create:
    * A public key → automatically added to the EC2 instance.
    * A private key → you download it as a `.pem` file.

🧭 **Steps to SSH into an EC2 Instance (Linux/Mac Terminal)**
1.  **Open Terminal.**
2.  **Locate your `.pem` file** (private key).
    * Make sure the file is in a secure location.
3.  **Set correct permission for the file**.
    * Run this to make it private:
        ```bash
        chmod 400 your-key.pem
        ```
4.  **SSH Command to Connect:**
    ```bash
    ssh -i path/to/your-key.pem ubuntu@<PublicDNS>
    ```
    * `-i` specifies the private key.
    * `ubuntu` is the default username for Ubuntu AMIs (it may vary).
    * `<PublicDNS>` is the server's DNS name (e.g., `ec2-13-...amazonaws.com`).

🖥️ **Using SSH in Windows (via PuTTY)**
Windows doesn’t support `.pem` files directly in PowerShell. So:
1.  Download PuTTY.
2.  Convert `.pem` to `.ppk` using PuTTYgen.
3.  Use PuTTY to connect by entering:
    * Hostname: `ec2-user@<PublicDNS>`
    * Auth: Browse and select the `.ppk` key file.

📌 **Quick Notes:**

| Task                  | Command or Tool             |
| :-------------------- | :-------------------------- |
| Generate keys (manual) | `ssh-keygen`                |
| Check SSH status on Linux | `sudo systemctl status ssh` |
| Connect with key      | `ssh -i key.pem user@server-ip` |
| Permission issue fix  | `chmod 400 key.pem`         |
| GUI for Windows       | PuTTY + PuTTYgen            |

</section>

---

<section id=06>

## 🗃️ Disk Usage Commands (Storage Monitoring)

These commands help you monitor disk space — essential for system health, especially in production environments.

<section id=06_01>

### 🔹 1. `df` – Disk Free

```bash
df
```
* Shows total, used, and available space on mounted file systems.

```bash
df -h
```
* Adds human-readable format (e.g., GB, MB instead of blocks).
Use this to check if your root `/` or `/home` partitions are running out of space.

</section>

<section id=06_02>

### 🔹 2. `du` – Disk Usage

```bash
du .
```
* Shows disk usage of the current directory and its contents.

```bash
du -sh <folder-name>
```
* `-s`: Summary, `-h`: Human-readable.
* Use to check how much space a particular folder is using.


</section>

<section id=06_03>

### 🔹 3. `ls -a` – List All Files (Including Hidden)

```bash
ls -a
```
* Lists all files and folders, including hidden files (those starting with `.`).

🧠 **Common Use Case Example:**
```bash
df -h              # Check overall disk space
du -sh /var/log    # See log folder size
ls -a              # Find hidden `.config`, `.env` files
```

</section>
</section>


---

<section id=07>

## ⚙️ Process Management Commands

Used to view, monitor, and kill running processes.

### 🔹 1. `ps` – Process Status

```bash
ps
```
* Shows currently running processes in current terminal session.

```bash
ps aux | grep <name>
```
* Lists all system processes, you can filter by name.

### 🔹 2. `top` – Real-time Process Monitoring

```bash
top
```
* Displays all running processes in real-time, including CPU and memory usage.
* Press `q` to quit.

### 🔹 3. `fuser` – Show Process Using a File/Directory

```bash
fuser .
```
* Shows process IDs (PIDs) accessing the current folder.

### 4. `kill` – Terminate a Process

```bash
kill -9 <pid>
```
* Sends `SIGKILL` signal to forcefully stop a process.
Use `ps` or `top` to get the PID (Process ID).

### 5. `free` – Memory Usage

```bash
free
```
* Shows system memory info (RAM, swap).

```bash
free -h
```
* Human-readable format.

🌀 `nohup` – Run Commands That Ignore Hangups
Used when running long commands or background jobs — even after you log out.
```bash
nohup <command>
```
📌 **Example:**
```bash
nohup free -h
```
* Output is saved in a file named `nohup.out` by default.
```bash
nohup df -h
```
* Appends disk usage result to the same file.
Useful for scripts or logs that should run independently of the shell.

### 6. `vmstat` – Virtual Memory Statistics

```bash
vmstat
```
* Shows info about memory, CPU usage, processes, I/O.

```bash
vmstat -a
```
* Displays active and inactive memory details.

✅ **Summary Table:**

| Command              | Purpose                                          |
| :------------------- | :----------------------------------------------- |
| `df -h`              | Show disk usage per partition                    |
| `du -sh <dir>`       | Show folder size                                 |
| `ls -a`              | List all files including hidden                  |
| `ps`                 | List current processes                           |
| `top`                | Real-time process monitoring                     |
| `fuser .`            | Show which process is using current dir          |
| `kill -9 <pid>`      | Forcefully kill a process                        |
| `free -h`            | View memory usage (RAM)                          |
| `nohup <cmd>`        | Run command that keeps running after logout      |
| `vmstat -a`          | View memory stats with active/inactive data      |
