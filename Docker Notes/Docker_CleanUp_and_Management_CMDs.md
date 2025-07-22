# Docker Cleanup & Management Commands

### 🔄 Remove All Stopped Containers, Unused Networks, Dangling Images, and Build Cache:

```bash
docker system prune
```

This command will:
- 🗑️ Remove all stopped containers
- 🔗 Remove networks not used by at least one container
- 🖼️ Remove dangling images (unused images)
- 🧱 Remove build cache

---

<br>

### 🧼 Remove All Docker Images at Once
Using **`docker rmi`** with image IDs one by one is not practical if you have many images.

✅ Step-by-step:
1. List all image IDs:
```bash
docker images -aq
```

2. Remove all images forcefully:
```bash
docker rmi -f $(docker images -aq)
```

- **`-f`**: Forces image removal

- **`$(...)`**: Executes the inner command first and passes its output as arguments.

---

<br>

### 🛑 Stop & Remove All Containers (via Docker Compose):
```bash
docker compose down
```

This will:

- Stop all running containers defined in docker-compose.yml

- Remove containers, default networks, and any linked volumes (if specified)

---

<br>

### 🔁 Force Rebuild and Run All Services:
```bash
docker compose up -d --build
```

- **`-d`**: Runs in detached mode (in the background)

- **`--build`**: Forces Docker to rebuild images before starting containers.

