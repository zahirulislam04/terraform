
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  
} 

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
  keep_locally = false
}

resource "docker_container" "ubuntu" {
  image = docker_image.ubuntu.latest
  name = "ubuntu"
  start = true
  command = ["/bin/bash", "-c", "apt-get update -y && apt-get install httpd -y && echo hello world > /usr/share/www/index.html && systemctl start service httpd"]
  entrypoint = ["/usr/share/www"]
  ports {
    internal = 8080
    external = 8080
  }
}
