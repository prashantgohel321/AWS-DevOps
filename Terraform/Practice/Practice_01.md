# Terraform Practices – Running Docker Containers (MySQL + Nginx)

This README explains two Terraform practices to run Docker containers inside your system using Terraform with Docker provider.
We will run:

1. ✅ MySQL container

2. ✅ Nginx container

## Setup

We will use Terraform inside Docker (so no need to install Terraform locally).

## Commands you’ll frequently use:
```bash

# Pull Terraform Docker Image
docker pull hashicorp/terraform:light




# 01 ******  Initialize Terraform  ******
docker run --rm -it -v ${PWD}:/data -w /data hashicorp/terraform:light init

# --rm means Remove the container after it finishes (so it won’t take space).

# -it means Run interactively (so you can see logs).

# -v ${PWD}:/data → Mount your current folder into /data inside the container. (Terraform needs access to your .tf files).

# -w /data → Set /data as the working directory inside the container.

# hashicorp/terraform:light → Use Terraform’s official lightweight Docker image.

# init → Initialize Terraform (downloads plugins/providers).

# This is just Terraform init, but running from inside Docker.







# 02 ******  Plan execution  ******
docker run --rm -it -v ${PWD}:/data -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -w /data hashicorp/terraform:light plan

# Same as above, but with extra volume mounts:

# -v /var/run/docker.sock:/var/run/docker.sock → Gives Terraform access to Docker Engine running on your machine (so it can talk to Docker).

# -v /var/lib/docker:/var/lib/docker → Gives access to Docker’s internal data (images, containers).

# plan → Terraform checks your .tf files and shows what it will create (without actually creating anything).







# 03 ******  Apply execution  ******
docker run --rm -it -v ${PWD}:/data -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -w /data hashicorp/terraform:light apply

# Same as the plan command (with Docker access).

# apply → Actually creates the resources defined in .tf files (in your case, Docker container + image).

# You’ll see logs, and Terraform will ask for confirmation (type yes).

```

1. **`tarrform init`**
    - **Purpose**: Prepares Terraform.

    - **Downloads** required plugins (like Docker, AWS, etc.).

2. **terraform plan**

    - **Purpose**: Shows what Terraform will do.

    - It checks your code and compares it with real infrastructure.

3. **terraform apply**
    - **Purpose**: Actually makes the changes.

    - Creates, updates, or deletes resources as per your code.




<br>
<br>
<br>

# 📌 Practice 01: Run MySQL Container with Terraform

Create a file named mysql.tf

```bash
terraform { # tells terraform what providers (plugins) are required for this project
  required_providers { # we list which providers we need; a provider is like a driver / plugin that lets terraform talk to an external service (AWS, Docker, GCP, etc...)
    docker = { # we are using docker provider.
      source  = "kreuzwerker/docker" # means terraform should download the Docker provider plugin from the terraform registry, specifically from the kreuzwerker organization.
      version = "~> 3.0.1" 
    }
  }
}

provider "docker" {} # tells terraform we are using docker as our platform

# Pull MySQL Image
resource "docker_image" "mysql_image" { # downloads the MySQL docker image from docker hub
  name = "mysql:5.7"
}

# Run MySQL Container
resource "docker_container" "mysql_container" { # creates a container named mysql_container from the MySQL image.
  name  = "mysql_terraform" # name of the container; you can name it whatever you want
  image = docker_image.mysql_image.name # run a container from the image I just downloaded
  ports {
    internal = 3306 # inside container
    external = 3307 # on machine
  }

  env = [ # sets the environment variables
    "MYSQL_ROOT_PASSWORD=root123",
    "MYSQL_DATABASE=mydb",
    "MYSQL_USER=myuser",
    "MYSQL_PASSWORD=mypass"
  ]
}
```

### Then execute this commands one by one
```bash

# 01 ******  Initialize Terraform  ******
docker run --rm -it -v ${PWD}:/data -w /data hashicorp/terraform:light init

# 02 ******  Plan execution  ******
docker run --rm -it -v ${PWD}:/data -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -w /data hashicorp/terraform:light plan

# 03 ******  Apply execution  ******
docker run --rm -it -v ${PWD}:/data -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -w /data hashicorp/terraform:light apply

```

<br>
<br>
<br>
<br>
<br>
<br>

# 📌 Practice 02: Run nginx Container with Terraform

Create a file named nginx.tf

```bash
terraform { # tells terraform what providers (plugins) are required for this project
  required_providers { # we list which providers we need; a provider is like a driver / plugin that lets terraform talk to an external service (AWS, Docker, GCP, etc...)
    docker = { # we are using docker provider.
      source  = "kreuzwerker/docker" # means terraform should download the Docker provider plugin from the terraform registry, specifically from the kreuzwerker organization.
      version = "~> 3.0.1" 
    }
  }
}

provider "docker" {} # tells terraform we are using docker as our platform

# Pull nginx Image
resource "docker_image" "nginx_image" { # downloads the nginx docker image from docker hub
  name = "nginx:latest"
}

# Run nginx Container
resource "docker_container" "nginx_container" { # creates a container named nginx_container from the nginx image.
  name  = "nginx_terraform" # name of the container; you can name it whatever you want
  image = docker_image.nginx_image.name # run a container from the image I just downloaded
  ports {
    internal = 80 # inside container
    external = 8080 # on machine; change port if not availavle
  }
}
```


### Then execute this commands one by one
```bash

# 01 ******  Initialize Terraform  ******
docker run --rm -it -v ${PWD}:/data -w /data hashicorp/terraform:light init

# 02 ******  Plan execution  ******
docker run --rm -it -v ${PWD}:/data -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -w /data hashicorp/terraform:light plan

# 03 ******  Apply execution  ******
docker run --rm -it -v ${PWD}:/data -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker -w /data hashicorp/terraform:light apply

```