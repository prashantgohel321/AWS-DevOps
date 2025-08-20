# Ansible Practice 01: Run First Playbook in Docker

In this practice, we’ll do 3 things step by step:

- Build your custom Ansible Docker image (from Dockerfile).

- Run a container from that image.

- Execute the MySQL, nginx, and apache playbook.

## Step 1: Build Ansible Docker Image

From the folder where your Dockerfile is located:

### Dockerfile
```bash
# Use the official Ubuntu base image
FROM ubuntu:20.04

# Set non-interactive mode for apt
ARG DEBIAN_FRONTEND=noninteractive

# Update packages and install prerequisites
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y gcc && \
    apt-get clean

# Install Ansible
RUN pip3 install ansible

# Set the default command to run when starting the container
CMD ["ansible", "--version"]
```

### Then execute this command to build image
```bash
docker build -t ansible:practice1 .

# -t ansible:practice1 → names your image ansible with tag practice1.

# . → means build from current directory.
```

### After success, check image:
```bash
docker images
```

> You should see ansible:practice1.

<br>
<br>
<br>

## Step 2: Run Ansible Container

Run container and mount your Ansible project folder (so playbooks are accessible inside container):
```bash
docker run -it -v ${PWD}:/ansible ansible:practice1 bash

# -it → interactive terminal.

# -v ${PWD}:/ansible → mounts your current folder into /ansible inside the container.

# ansible:practice1 → use the custom image you built.

# bash → gives you a shell inside container.

```

### Inside the container, check:
```bash
cd /ansible
ls
```

> You should see your playbook file (.yml) and maybe hosts file.

<br>
<br>


## Prepare Playbook Files

### apache.yml
```bash
- name: Install Apache # just a description
  hosts: apache # # Tells Ansible: “Run this playbook on all machines listed under the [apache] group in my hosts file.”
  become: yes # # Means run tasks with sudo/root privileges (because installing packages needs admin access).
  tasks: # A playbook is made up of tasks (steps to do).
    - name: Install Apache server package
      ansible.builtin.apt:
        name: apache2
        state: present
        update_cache: yes

    - name: Ensure Apache service is running
      ansible.builtin.service:
        name: apache2
        state: started
        enabled: true
```

### mysql.yml
```bash
- name: Install MySQL 
  hosts: mysql 
  become: yes 
  tasks: 
    - name: Install MySQL server package
      ansible.builtin.apt:
        name: mysql-server
        state: present

    - name: Ensure MySQL service is running
      ansible.builtin.service:
        name: mysql
        state: started
        enabled: true

    - name: Install MySQL client package
      ansible.builtin.apt:
        name: mysql-client
        state: present
```


### nginx.yml
```bash
- name: Install Nginx
  hosts: nginx
  become: yes
  tasks:
    - name: Install Nginx package
      ansible.builtin.apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Ensure Nginx service is running
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: true
```

### Step 3: Run Your Playbook

First create **`hosts`** file, and put this content inside that:
```bash
[mysql]
localhost ansible_connection=local

[apache]
localhost ansible_connection=local

[nginx]
localhost ansible_connection=local
```

Run playbook files:
```bash
# **** FOR MYSQL ****:
ansible-playbook -i hosts mysql.yml

# mysql.yml → Installs MySQL
```

```bash
# **** FOR APACHE ****:
ansible-playbook -i hosts apache.yml
# apache.yml → Installs Apache
```

```bash
# **** FOR NGINX ****
ansible-playbook -i hosts nginx.yml
# nginx.yml → Installs Nginx
```

```bash
# -i hosts → inventory file (list of target servers or containers).

# Playbook (.yml) → contains instructions (install MySQL server & client, ensure service is running).
```