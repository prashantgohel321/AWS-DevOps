# Multi-Stage Docker Builds in Docker

### 💡 Why Multi-Stage Builds?
When you build Docker images using a standard Dockerfile with a large base image like python:3.7, the final image becomes very large. 

This leads to:

- ⏳ Slower builds

- 🐢 Slower container startup

- ☁️ Longer upload/download times

- 💽 More storage usage

- ⚠️ As your application grows, these issues get worse.

---

<br>

### What Are Multi-Stage Builds?
Multi-stage builds let you use multiple base images in stages:

- One stage (called builder) handles heavy tasks like installing libraries

- A final, lightweight stage is used to run the actual application

This keeps your final image small and efficient, while still allowing you to do everything you need during the build.

---

<br>

##  Real Example
Let’s say you're building a Python app using a Dockerfile. Here’s how you can apply a multi-stage build:

###  Dockerfile (Multi-Stage Build)
```dockerfile
# 🧱 Stage 1: Builder (heavy image)
FROM python:3.7 AS builder

WORKDIR /app

# Only copy what's needed for installation
COPY req.txt .

# Install dependencies
RUN pip install -r req.txt

# ✅ All libraries are now installed in site-packages



# 🧱 Stage 2: Final image (lightweight)
FROM python:3.7-slim

WORKDIR /app

# Copy installed libraries from builder
COPY --from=builder /usr/local/lib/python3.7/site-packages/ /usr/local/lib/python3.7/site-packages/

# Copy application code
COPY . .

ENTRYPOINT ["python", "run.py"]

```

### 📊 Image Size Comparison
| Image Name | Base Used                   | Final Size  |
| ---------- | --------------------------- | ----------- |
| `two-tier` | `python:3.7`                | **1.01 GB** |
| `mini`     | `python:3.7-slim` + builder | **142 MB**  |

> ✅ That’s a ~85% size reduction — with the same functionality.

---

<br>

### ✅ Benefits of Multi-Stage Builds
- 📦 Smaller final images

- ⚡ Faster container startup

- 🔒 More secure (less unused packages)

- 💨 Quicker deployment and CI/CD pipelines

- 🧹 Cleaner, production-ready images

---

