# 🐳 Docker Networking

## ❓ Why Docker Networking?
By default, Docker containers are isolated. They cannot communicate with each other unless explicitly connected to the same network. Networking enables containers to share resources and communicate securely and efficiently.

<br>

| **Type**              | **Description**                                                                                  |
| --------------------- | ------------------------------------------------------------------------------------------------ |
| `host`                | Shares the host’s network stack directly with the container.                                     |
| `bridge` *(default)*  | Standard NAT-based network that allows host ↔ container and container ↔ container communication. |
| `user-defined bridge` | Custom bridge networks with better DNS-based container discovery.                                |
| `none`                | Disables networking entirely for the container. Useful for offline tasks.                        |
| `macvlan`             | Assigns MAC addresses to containers (used in Docker Swarm).                                      |
| `ipvlan`              | Advanced IP address management for containers.                                                   |
| `overlay`             | Used in Docker Swarm across multiple hosts (cluster networking).                                 |

> ℹ️ Last three are used in Docker Swarm for multi-host clustering (now mostly replaced by Kubernetes).

<br>

## 🔍 Useful Docker Networking Commands

```bash
docker network ls                     # List all networks
docker network create mynet -d bridge # Create a custom bridge network
docker network inspect mynet          # Inspect details of a network
```

<br>

## 🛠 Two-Tier Application with Flask + MySQL (in Separate Containers)

### 1️⃣ Dockerfile for Flask App (app.py)

```dockerfile
# Use a base image with Python installed
FROM python:3.9-slim

# Set working directory in container
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient

# Copy the entire app code
COPY . .

# Start the application
CMD ["python", "app.py"]
```

### 2️⃣ Build and Run Your Flask App
```dockerfile
# Build the image
docker build -t two-tier-app .

# (Don't run yet if MySQL isn't ready. You'll get a "Unknown host" error.)
```

### ❌ What If You See This Error?
```bash
Unknown server host 'mysql'
```

This means your Flask app can't resolve the MySQL container name. This happens because they aren’t on the same network.

<br>

### ✅ Fix: Connect Containers via Custom Docker Network
Step-by-step:

#### 🛑 Stop and Remove Any Previous MySQL Container
```bash
docker stop <mysql_c_id> && docker rm <mysql_c_id>
```

#### 🌐 Create a Custom Network
```bash
docker network create two-tier -d bridge
```

#### 🐬 Run MySQL Container on the Custom Network
```bash
docker run -d --name mysql \
  --network two-tier \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=devops \
  mysql
```

#### 🚀 Run Flask App on the Same Network
```bash
docker run -d -p 5000:5000 \
  --network two-tier \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=root \
  -e MYSQL_DB=devops \
  two-tier-app:latest
```

> Now your Flask app can resolve mysql hostname correctly and connect to the database.

<br>

### 🔍 Inspecting Network and Containers
```bash
docker ps                   # See running containers
docker network ls           # View available networks
docker network inspect two-tier  # See connected containers and details
```

<br>

### 🌐 Testing Flask App
Open your browser

Visit: http://<EC2_PUBLIC_IP>:5000

<br>

### 🧪 Verify MySQL Container Internally

```bash
docker exec -it <mysql_c_id> bash

# Login to MySQL
mysql -u root -p
# Enter password: root

# Inside MySQL
show databases;
use devops;
select * from messages;
```

