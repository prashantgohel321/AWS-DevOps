# 100 Docker Interview Questions & Answers

## Part 1: Docker Fundamentals & Core Concepts
**1. `Scenario`: A new team member is confused about why the company is using Docker instead of traditional Virtual Machines (VMs) for a new microservices project. How would you explain the primary benefits of using containers over VMs in this context?**

**`Answer`**: I would explain that while both provide isolation, Docker containers are much more lightweight. They share the host OS kernel, whereas each VM requires a full guest OS. For a microservices project, this means we can run many more containers on a single host, leading to faster startup times, better resource utilization (CPU, memory), and a more efficient, portable, and consistent deployment process across different environments.

<br>

**2. `Scenario`: You are explaining the Docker architecture to a junior developer. They ask what the "Docker daemon" is and what it does. How do you respond?**

**`Answer`**: The Docker daemon, or dockerd, is the **persistent background service** that **manages Docker objects**. It's the **"brain" of Docker**. It listens for API requests from the Docker CLI (the commands you type, like docker run) and handles all the heavy lifting: building and managing images, running and stopping containers, and configuring networks and volumes.

<br>

**3. `Scenario`: An application is running perfectly on a developer's machine but fails in the staging environment. How does Docker solve this classic "it works on my machine" problem?**

**`Answer`**: Docker solves this by **packaging the application**, its code, runtime, system tools, libraries, and all other dependencies **into a single, isolated unit called a container**. This containerized application **runs the exact same way regardless of the underlying environment** (developer's laptop, staging, or production server), ensuring consistency and eliminating environment-specific issues.

<br>

**4. `Scenario`: What is the difference between a Docker image and a Docker container?**

**`Answer`**: A Docker image is **a read-only template with instructions for creating a container**. It's like a blueprint or a class in object-oriented programming. A Docker container is **a runnable instance of an image**. You can have multiple running containers of the same image, just like you can create multiple objects from a single class.

<br>

**5. `Scenario`: You need to run a Linux-based container on a Windows machine for development. What underlying technology makes this possible?**

**`Answer`**: This is made possible by the **Windows Subsystem for Linux (WSL)**. WSL is **a compatibility layer developed by Microsoft that allows a Linux environment**, including its command-line tools and applications, **to run directly on Windows** without the overhead of a traditional virtual machine.

<br>

**6. `Scenario`**: You are asked to explain the difference between a Type 1 and a Type 2 hypervisor.**

**`Answer`**: A Type 1 hypervisor, also known as a "**bare-metal**" hypervisor, runs directly on the host's physical hardware. 

A Type 2 hypervisor, or a "**hosted**" hypervisor, runs as a software application on top of an existing operating system.

<br>

**7. `Scenario`: How does OS-level virtualization (containerization) differ from traditional hardware virtualization?**

**`Answer`**: OS-level virtualization, or containerization, uses a single host OS kernel and creates multiple isolated user-space instances called containers. In contrast, traditional hardware virtualization uses a hypervisor to create complete virtual machines, each with its own full guest operating system. This makes containers much more lightweight and efficient.