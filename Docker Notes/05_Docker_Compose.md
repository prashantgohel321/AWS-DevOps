# Docker Compose

## ❓ Why Docker Compose?
As a DevOps engineer, **doing things manually** (like running docker ps, docker stop, and building containers one by one) is **inefficient and error-prone**. <br>
**Docker Compose** is a powerful **tool** that helps **automate these tasks** by managing multi-container Docker applications with **a single YAML configuration file**.

Instead of writing and executing multiple commands manually, Docker Compose allows us to define services, networks, volumes, and more — all in a simple, human-readable .yaml file.

## 🔍 Why is it called Compose?
Because it allows you to "compose" multiple containers together — for example, in a two-tier architecture like Flask + MySQL, both containers can be created and managed in one go.

---

<br>

## 🛠️ Let's Write a Docker Compose File from Scratch
We'll create a simple two-tier app using Flask (backend) and MySQL (database).

To begin, create a docker-compose.yml file:
```bash
vim docker-compose.yml
```

## docker-compose.yml
```dockerfile
version: "3.8"

services:
  mysql:
    container_name: mysql
    image: mysql
    environment:
      MYSQL_DATABASE: "devops"
      MYSQL_ROOT_PASSWORD: "root"
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
    networks:
      - two-tier
    restart: always
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost", "-uroot", "-proot"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 60s

  flask:
    build:
      context: .
    container_name: two-tier-app
    ports:
      - "5000:5000"
    environment:
      - MYSQL_HOST=mysql
      - MYSQL_USER=root
      - MYSQL_PASSWORD=root
      - MYSQL_DB=devops
    networks:
      - two-tier
    depends_on:
      - mysql
    restart: always
    healthcheck:
      test: ["CMD-SHELL", "curl -f http://localhost:5000/health || exit 1"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 60s

volumes:
  mysql-data:

networks:
  two-tier:
```

---

<br>

## 🔍 Explanation
- **services**: Define your containers here (MySQL, Flask, etc.)

- **build / image**: You can either build from a Dockerfile (build) or pull an image from Docker Hub (image)

- **environment**: Pass environment variables (e.g., DB credentials)

- **volumes**: Persist your data using named or mounted volumes

- **networks**: Define custom network for containers to communicate

- **ports**: Map host ports to container ports

- **depends_on**: Ensure the Flask container waits for the MySQL container to start

- **healthcheck**: Adds reliability by checking if the service is "ready"

---

<br>

## 💡 Why Use depends_on?
```bash
depends_on:
  - mysql
```

This ensures the Flask app starts only after MySQL container starts. But be careful — this doesn't guarantee that MySQL is ready to accept connections. That’s where healthcheck comes in.

## ✅ Why healthcheck?
Even if a container is up, it doesn’t mean the service inside is ready. <br>
For example, MySQL may take time to become "ready for connection".

A healthcheck allows you to:
- Run commands to verify the container is fully initialized
- Set retry logic, intervals, and timeouts
- Ensure other containers wait for readiness before starting

---

<br>

## 📦 Installing Docker Compose
```bash
sudo apt-get install docker-compose-v2
```

## ▶️ Running the Compose File
```bash
docker compose up
OR
docker compose up -d
```
This command reads your docker-compose.yml file and starts all services at once, building containers, creating networks, and mounting volumes.

---

## 🧠 Key Takeaways
- Docker Compose simplifies multi-container setup.

- Everything is defined in one .yaml file — reusable, versioned, and clean.

- depends_on + healthcheck make your containers production-ready by ensuring services are actually usable before depending on them.