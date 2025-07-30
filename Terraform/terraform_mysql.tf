terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "mysql" {
  name         = "mysql:latest"
  keep_locally = false
}