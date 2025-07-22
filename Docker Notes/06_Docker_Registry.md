# Docker Registry (DockerHub)

### 🔍 What is a Docker Registry?
-A Docker Registry is a storage and distribution system for Docker images.

The most common registry is Docker Hub, where:
- You can pull images to your system

- You can push your own images from local to remote

Think of it as **a repository for container images** — similar to GitHub for code.

---

<br>

## 🚀 Pushing Your Local Image to Docker Hub
Let’s say you have a Docker image named two-tier:latest that you want to publish on Docker Hub under your account (prashantgohel321).

### ✅ Step 1: Tag the Image for Docker Hub
```bash
docker image tag <image_name> <new_image_name>
```

#### Example:
```bash
docker image tag two-tier:latest prashantgohel321/two-tier:latest
```

> This command doesn't create a new image — it just adds a new alias (tag) for the same image.


### ✅ Step 2: Push the Image to Docker Hub

```bash
docker push prashantgohel321/two-tier:latest
```

> ⚠️ Make sure you're logged in to Docker Hub first using:
```bash
docker login
```

---

<br>

## 🔄 Using That Image in Docker Compose
Now that your image is in the cloud, you don’t need to build it every time.

Instead of using build: in docker-compose.yml, you can directly pull the image from Docker Hub.

### ✅ Replace This:
```bash
flask:
  build:
    context: .
```

### ✅ With This:
```bash
flask:
  image: prashantgohel321/two-tier:latest
```


---

<br>

### 🎯 Why Use Pre-Built Images?
- Faster container startup (no local build required)

- Easier collaboration and CI/CD integration

- Consistent environments across different machines