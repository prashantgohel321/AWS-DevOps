```hcl
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
```

This tells Terraform:

> "We are going to use the Docker provider from kreuzwerker."

Providers are like plugins. They let Terraform talk to different systems (like AWS, Docker, etc.).

---

<br>

```bash
provider "docker" {}
```

- This activates the Docker provider so Terraform can run Docker-related tasks on your machine (like pulling images, starting containers, etc.).

- You must have Docker already installed and running.

---

<br>

```bash
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}
```

This block tells Terraform to pull the latest Nginx image from Docker Hub.

- `name` = "nginx:latest" → Pulls the latest version of Nginx.

- `keep_locally` = false → After Terraform finishes, it may delete the image from your machine if it’s not used elsewhere (helps save space).

<br>

## In short
This script uses Terraform to pull the latest Nginx Docker image using the Docker provider.

---

## 1. Download Terraform Docker image:
```bash
docker pull hashicorp/terraform:light
```

- Pulls a lightweight Terraform image from Docker Hub.

- You only need to do this once (unless you want the latest version again).

## 2. Initialize Terraform project:
```bash
docker run --rm -it -v ${PWD}:/data -w /data hashicorp/terraform:light init
```

- Purpose: Initializes the current Terraform folder (downloads plugins like the Docker provider).

- `--rm` = Remove the container after it runs (temporary).

- `-it` = Run interactively (lets you see output).

- `-v ${PWD}:/data` = Mounts your current folder (D:/terraform) into the container at /data.

- `-w /data` = Sets the working directory inside the container.

> ⚠️ Note for Windows: You might need to change ${PWD} to %cd% or use "${PWD}" or "/$(pwd)" if this doesn’t work directly in CMD or PowerShell.

## 3. Plan the Terraform script:
```bash
docker run --rm -it \
  -v ${PWD}:/data \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker:/var/lib/docker \
  -w /data \
  hashicorp/terraform:light plan
```

- Purpose: Shows what Terraform would do (preview only).

- Adds extra Docker volumes:

- `/var/run/docker.sock` → Allows Terraform inside the container to talk to Docker engine on your host.

- `/var/lib/docker` → Optional, but some Docker providers use it to check local images/containers.

## 4. Apply the Terraform script:
```bash
docker run --rm -it \
  -v ${PWD}:/data \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker:/var/lib/docker \
  -w /data \
  hashicorp/terraform:light apply
```

- Purpose: Actually applies the changes – here, it pulls the Nginx image via Docker provider.

- Same setup as plan, but this makes real changes (you’ll need to confirm with yes when prompted).

## Summary:
- Using Docker to avoid installing Terraform.

- Mounting your local project folder (D:/terraform) into the container.

- Connecting Docker inside the container to Docker on your machine (so it can pull images, run containers, etc.).

- Running `init → plan → apply` to manage Docker resources using Terraform.