# Linux Interview/Viva Questions with Answers

<details>
<summary> <b> 1. What is a Kernel, and how does it work in Linux? </b> </summary>

<br>

- The **Kernel** is the heart of the Linux OS. 

- It manages **system resources** like memory, CPU, I/O devices, and process control. 

- When you type a command or run an application, the **shell** interprets it and passes it to the kernel, which **communicates with the hardware**. 

- It operates in privileged mode and forms the **interface between hardware and software**, ensuring secure and efficient operations.
</details>

<br>


<details>
<summary> <b> 2. What’s the difference between a Shell and a Terminal? </b> </summary>

<br>

- A Shell is **a program** that accepts commands and sends them to the kernel (like Bash, Zsh). 

- A terminal is **just the interface (window)** where the shell runs. 

- Think of the **terminal** as **the screen and keyboard**, and the **shell** as **the engine** interpreting your commands.

</details>

<br>


<details>
<summary> <b> 3. What is the boot process in Linux? Explain the role of GRUB. </b> </summary>

The Linux boot process follows this order:

1. BIOS/UEFI starts after power on.

2. It loads the Bootloader (usually GRUB).

3. GRUB loads the Kernel into memory.

4. The kernel initializes hardware and mounts the root filesystem.

5. init/systemd starts system services and your login shell.

GRUB (GRand Unified Bootloader) allows selecting the OS and passing boot parameters to the kernel.

</details>

<br>


<details>
<summary> <b> 4. How is Linux different from Windows from a DevOps perspective? </b> </summary>

<br>

| Feature      | Linux                          | Windows                        |
| ------------ | ------------------------------ | ------------------------------ |
| Automation   | Native shell scripting (bash)  | Limited CMD/PowerShell         |
| Tools        | Docker, Ansible, Jenkins, etc. | Mostly unsupported or limited  |
| Security     | File permissions & sudo        | GUI-focused, more vulnerable   |
| Server Usage | Most cloud & production setups | Rare in cloud except .NET apps |

Linux is preferred due to its scripting capabilities, community support, and performance under load.

</details>

<br>

<details>
<summary> <b> 5. What are the most critical Linux directories and their purposes? </b> </summary>

<br>

**`/bin`**: Essential user commands (like ls, cp)

**`/etc`**: Configuration files

**`/var`**: Logs, mail, cache

**`/home`**: User-specific files

**`/root`**: Home for root user

**`/dev`**: Device files

**`/proc`**: System & process info

**`/boot`**: Kernel and bootloader files

This structure keeps system files, configs, and user files organized and separated.

</details>

<br>

<details>
<summary> <b> 6. What’s the difference between a Web Server and an Application Server? </b> </summary>

<br>

**Web Server**: Serves static files (HTML, CSS, JS).
e.g., Nginx, Apache

**Application Server**: Executes backend logic, talks to databases, renders dynamic content. <br>
e.g., Node.js, Django <br>
**Often used together**: Web server handles static files and proxies dynamic requests to the app server.

</details>

<br>

<details>
<summary> <b> 7. Explain Linux file permissions using a real example. </b> </summary>

<br>

For a file hello.sh with -rwxr-xr--:

- Owner has rwx (read, write, execute)

- Group has r-x (read, execute)

- Others have r-- (read only)

You can modify these with chmod, e.g.:

```bash
chmod 755 hello.sh
```

This allows safe sharing of scripts while restricting write access.

</details>

<br>

<details>
<summary> <b> 8. What tools can you use to access remote Linux servers and why is SSH preferred? </b> </summary>

<br>

- SSH (ssh user@ip) — Secure, CLI-based, native in DevOps tools

- RDP — GUI-based, mostly for Windows

- AnyDesk, TeamViewer — Cross-platform GUIs (rare in DevOps)

SSH is preferred for automation, secure scripting, tunneling, and tool integration (e.g., Git, Ansible).

</details>

<br>

<details>
<summary> <b> 9. What is a process in Linux? Explain zombie and sleeping states. </b> </summary>

<br>

A process is a running instance of a program.

**Sleeping**: Waiting for input (e.g., from keyboard or file I/O).

**Zombie**: Finished execution but not cleaned up by parent — leaves a process entry in the table.

Use `ps aux` or `top` to inspect process states.

</details>

<br>

<details>
<summary> <b> 10. What’s the role of the Shell in Linux Architecture? </b> </summary>

<br>

In Linux’s architecture:

- The Shell takes user commands and passes them to the Kernel

- The Kernel talks to the hardware

This layered approach enables secure, modular control and automation via scripting (bash, zsh).

</details>

<br>

<details>
<summary> <b> 11. What is WSL and when would you use it? </b> </summary>

<br>

WSL (Windows Subsystem for Linux) lets you run Linux natively inside Windows without a VM. Ideal for DevOps learners who want to practice bash, run CLI tools, or test scripts without dual booting or spinning up cloud VMs.

Command:
```bash
wsl --install
```

</details>

<br>

<details>
<summary> <b> 12. What is the role of the <u>/etc</u> and <u>/var</u> directories in DevOps? </b> </summary>

<br>

`/etc`: Configuration hub for services like nginx, ssh, cron

`/var`: Stores runtime logs (/var/log), package cache, email queues

You’ll often edit /etc/ssh/sshd_config or inspect /var/log/syslog to debug issues.

</details>

<br>

<details>
<summary> <b> 13. Explain the difference between standalone and web applications with a DevOps lens. </b> </summary>

<br>

**Standalone**: Runs locally, no backend infra; minimal DevOps involvement

**Web app**: Requires deployment, monitoring, scaling, CI/CD; heavy DevOps role

Examples: A feedback kiosk (standalone) vs. Instagram (web app)

</details>

<br>

<details>
<summary> <b> 14. What is Application Support in DevOps and why does it matter? </b> </summary>

<br>

It involves maintaining, monitoring, and troubleshooting deployed apps. Includes:

- Using monitoring tools (Grafana, Prometheus)

- Analyzing logs (ELK)

- Applying patches, restarts

- Managing downtimes and alerting

It ensures reliability post-deployment, which is where most real-world issues appear.

</details>

<br>

<details>
<summary> <b> 15. How does Linux manage memory and CPU usage across processes? </b> </summary>

<br>

The Kernel schedules tasks using algorithms like CFS (Completely Fair Scheduler). Tools like top, htop, and vmstat help track usage. You can renice processes (nice, renice) or kill high-consuming ones. Swap is used when RAM is full.

</details>

<br>

<details>
<summary> <b> 16. What’s the difference between df and du, and when would you use each in DevOps? </b> </summary>

<br>

`df` shows total disk usage for mounted partitions (e.g., root /, /home).

`du` shows disk usage per directory/file, ideal for finding what folder is consuming space.

Example:

- Use `df -h` to check if the root partition is full.

- Use `du -sh /var/log` to investigate heavy logs. <br>
This is especially useful in debugging low-space alerts in production systems.

</details>

<br>

<details>
<summary> <b> 17. How does tail -f help during deployments or log analysis? </b> </summary>

<br>

`tail -f` monitors a file in real-time. During deployments, it's used to watch live logs like:

```bash
tail -f /var/log/nginx/error.log
```

It helps DevOps engineers debug runtime errors without restarting the shell session. Press Ctrl + C to exit.

</details>

<br>

<details>
<summary> <b> 18. What’s the difference between hard link and soft link? Why does DevOps need to know this? </b> </summary>

<br>

**Hard link** points to the actual data — survives even if the original file is deleted.

**Soft link** (symbolic) points to the filename — breaks if the file is moved or deleted.

**Why it matters?** In automation, symlinks are often used to manage config versions (nginx.conf → nginx-v1.conf) or shared binaries.

</details>

<br>

<details>
<summary> <b> 19. What does the tee command do, and how is it useful in scripting? </b> </summary>

<br>

`tee` writes output to a file and displays it on the screen at the same time.

**Example:**
```bash
echo "build passed" | tee build.log
```

Useful in CI/CD pipelines to capture logs while displaying live output in Jenkins or terminal.

</details>

<br>

<details>
<summary> <b> 20. When comparing configuration files, why would you use diff instead of opening both files manually? </b> </summary>

<br>

`diff file1.conf file2.conf` highlights only the differences, saving time.

Useful when **debugging** “it worked on dev but not on prod” cases. You can automate this in a deployment script or config audit pipeline.

</details>

<br>

<details>
<summary> <b> 21. What’s the purpose of chmod 400 on a .pem file in AWS SSH login? </b> </summary>

<br>

- It sets read-only permission for the file owner only. 

- AWS blocks SSH login if the private key is too open.

chmod 400 key.pem ensures the key is secure and SSH won’t throw permission denied errors.

</details>

<br>

<details>
<summary> <b> 22. What is the nohup command used for? How does it help in real deployments? </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>

<details>
<summary> <b>  </b> </summary>

<br>


</details>

<br>
