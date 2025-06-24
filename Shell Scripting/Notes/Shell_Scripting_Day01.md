# 🐚 Shell Scripting for DevOps – Day 01
📅 Date: 24th June, 2025 | 📍 Topic: Intro to Shell & Environment Setup

## List of Contents
* <a href="#before_shell_scripting">01 Before You Begin Shell Scripting…</a>
* <a href="#what_is_linux_devops">02 What is Linux and why is it so important for DevOps?</a>
    * <a href="#what_is_linux">02.01 What is Linux?</a>
    * <a href="#why_linux_devops_friend">02.02 Why Linux is DevOps' Best Friend:</a>
* <a href="#what_is_unix">03 Wait… What is Unix Then?</a>
* <a href="#linux_vs_unix_snapshot">04 Linux vs Unix – Quick Snapshot</a>
* <a href="#linux_system_architecture">05 Linux System Architecture – Understand the Layers</a>
    * <a href="#hardware">05.01 Hardware</a>
    * <a href="#kernel">05.02 Kernel</a>
    * <a href="#shell">05.03 Shell</a>
    * <a href="#applications_utilities">05.04 Applications & Utilities</a>
* <a href="#real_life_example_flow">06 Real-Life Example Flow</a>
* <a href="#diagram">07 Diagram: Linux System Architecture</a>
* <a href="#setting_up_environment">08 Setting Up the Environment (DevOps-Style)</a>
* <a href="#basic_shell_commands">09 Try These Basic Shell Commands:</a>
* <a href="#editing_files">10 Editing Files – Need a Text Editor</a>
    * <a href="#popular_cli_editors">10.01 Popular CLI editors:</a>
    * <a href="#open_file_vim">10.02 Open a file using vim:</a>
    * <a href="#see_file_content">10.03 See file content:</a>
* <a href="#writing_first_shell_script">11 Writing Your First Shell Script</a>
    * <a href="#shebang">11.01 Shebang (`#!/bin/bash`)</a>
    * <a href="#complete_example">11.02 Complete Example:</a>
* <a href="#make_script_executable">12 Make Script Executable</a>
* <a href="#day01_summary">13 Day 01 Summary</a>

---

<section id="before_shell_scripting">

## 🧑‍💻 Before You Begin Shell Scripting…
If you're diving into Shell Scripting, there's one truth:

> 💡 You’re stepping into the heart of Linux.
<br> So let’s pause and first understand:

</section>

<section id="what_is_linux_devops">

## ❓What is Linux and why is it so important for DevOps?
<section id="what_is_linux">

### 🧠 What is Linux?
Imagine you bought a new laptop. You press the power button. But how does the machine know what to do? That’s where the Operating System (OS) comes in.

### 📌 An Operating System:
- Acts as a bridge between you (the user) and the machine (hardware).
- Helps in running applications, managing files, and controlling memory/CPU/storage.

### Examples of OS:
- Windows 🪟
- macOS 🍏
- Linux 🐧

</section>

---

<section id="why_linux_devops_friend">

### 🐧 So What Exactly is Linux?
- Linux is an open-source OS invented by **Linus Torvalds** in **1991**. It’s the backbone of DevOps, powering servers, cloud platforms, IoT devices, supercomputers — basically everything except most personal laptops.

### 🔥 Why Linux is DevOps' Best Friend:
- 💸 Free and Open Source
- 🔒 Secure by design (permission system, fewer viruses)
- 🧠 Stable & Lightweight for production
- 🔁 Multitasking like a pro
- 🔧 Customizable at every level (yes, even the kernel!)
- 🌍 Massive community support

> That’s why 90%+ of servers and cloud apps run on Linux, not Windows.

</section>
</section>

---

<section id="what_is_unix">

### 🧬 Wait… What is Unix Then?
- Unix came before Linux — built in the **1970s** by AT&T Bell Labs.

#### It’s:
- Commercial (paid license)
- Powerful, secure
- Used in enterprises (e.g., IBM AIX, Solaris)
- The father of Linux and macOS (yes, macOS is Unix-based!)

</section>

---

<section id="linux_vs_unix_snapshot">

### 🔍 Linux vs Unix – Quick Snapshot
| Feature       | Linux                   | Unix                        |
| ------------- | ----------------------- | --------------------------- |
| Cost          | Free, Open Source       | Paid, Commercial            |
| Creator       | Linus Torvalds (1991)   | AT\&T Bell Labs (1970s)     |
| Example OS    | Ubuntu, CentOS, Red Hat | macOS, IBM AIX, Solaris     |
| Source Code   | Public                  | Restricted                  |
| Usage         | DevOps, Cloud, Servers  | Legacy Systems, Enterprises |
| Customization | Very flexible           | Limited                     |

</section>

---

<section id="linux_system_architecture">

### 🧱 Linux System Architecture – Understand the Layers
Let’s go deeper. Linux is built in layers like an onion 🧅:

<section id="hardware">

#### 1️⃣ Hardware
- Physical devices: CPU, RAM, USBs, Hard Disk, Printers, etc.

</section>

<section id="kernel">

#### 2️⃣ Kernel
- The core of the OS.
- Written in C language.
- Manages resources like memory, processes, and devices.
- Talks directly to hardware.

> You can't directly talk to the kernel. You need a translator...

</section>

<section id="shell">

#### 3️⃣ Shell
- Your interface to the kernel.
- You type a command (mkdir, ls, etc.)
- Shell interprets it, sends it to the kernel.
- The kernel acts, and you see the result!

Different types of shells:
- sh – Original shell created with help from Stephen Bourne
- bash – Bourne Again SHell (most popular today)
> **Others**: zsh, ksh, fish, csh

</section>

<section id="applications_utilities">

#### 4️⃣ Applications & Utilities
- Tools like vim, curl, ping, docker, git, etc.
- GUI or CLI — they all go through the shell to the kernel.

</section>
</section>

---

<section id="real_life_example_flow">

### ⚙️ Real-Life Example Flow:
- You: I want to create a folder called project.

You type:

```bash
mkdir project
```

#### What Happens Behind the Scenes:
- Shell takes your mkdir command
- Shell passes it to the Kernel
- Kernel talks to the disk hardware
- Folder is created

> 🥳 You just communicated with hardware using shell!

</section>

---

<section id="diagram">

### 🧠 Diagram:
```
  Applications / Tools
           ↑
          Shell
           ↑
          Kernel
           ↑
         Hardware
```

</section>

---

<section id="setting_up_environment">

### 🌍 Setting Up the Environment (DevOps-Style)
- As a DevOps enthusiast, you're likely to work on remote servers.
- So let’s launch an EC2 instance on AWS, and connect using SSH (Remote Login).
- Once connected, you’re on a remote Linux machine!

</section>

---

<section id="basic_shell_commands">

### 📁 Try These Basic Shell Commands:
```bash
echo "Hello, World"     # Prints a message
mkdir new_dir          # Creates a new directory
ls                      # Lists files and folders
```
🧠 These are not just commands — they’re your way of talking to the kernel through the shell.

</section>

---

<section id="editing_files">

### 📝 Editing Files – Need a Text Editor

<section id="popular_cli_editors">

#### Popular CLI editors:
- vim (Advanced, widely used in DevOps)
- nano (Beginner-friendly)
- gedit (GUI editor)

</section>

<section id="open_file_vim">

#### Open a file using vim:
```bash
vim hello.txt

# Press i → Insert mode
# Type your content
# Press Esc, then :wq → Save and Quit
# To exit without saving → :q!
```

</section>

<section id="see_file_content">

#### See file content:
```bash
cat hello.txt
```

</section>
</section>

---

<section id="writing_first_shell_script">

### ✨ Writing Your First Shell Script
#### Let’s create a file called hello.sh:
```bash
vim hello.sh
```

#### Now, before writing the script, you must tell Linux:

> ⚠️ “Hey! This script should run using bash shell.”

<section id="shebang">

#### That's where Shebang comes in:
```bash
#!/bin/bash
# This tells the OS: Use Bash to run this script.
```

</section>

<section id="complete_example">

#### 📝 Complete Example:
```bash
#!/bin/bash

# This is a comment
echo "Hello, my name is Prashant."
```

</section>
</section>

---

<section id="make_script_executable">

### 🔐 Make Script Executable
#### Before executing the script, give yourself permission:

```bash
chmod 744 hello.sh

# Explanation:
# 7 → rwx (Read, Write, Execute) → for you
# 4 → r-- (Read only) → for group
# 4 → r-- → for others
```

#### ✅ Check permissions:
```bash
ls -l
```

#### ▶️ Run the Script!
```bash
./hello.sh

# 🎉 Boom! You just ran your first shell script.
```

</section>

---

<section id="day01_summary">

#### Day 01 Summary
| Concept                | Description                                         |
| ----------------------- | ----------------------------------------------------- |
| Linux                   | Free, open-source OS used in cloud & DevOps         |
| Kernel                  | Core of the OS, manages hardware                      |
| Shell                   | Interface to communicate with the kernel              |
| Bash                    | Most popular shell used today                         |
| Shebang (`#!/bin/bash`) | Tells the system which shell to use to run the script |
| chmod 744               | Makes your script executable                          |
| ./script.sh             | Runs the script                                       |

</section>
