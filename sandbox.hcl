resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "container" "webserver" {
  image {
    name = "nginx:latest"
  }

  port {
    local = 80
  }

  network {
    id = resource.network.main.meta.id
  }
}

resource "service" "webserver" {
  target = resource.container.webserver
  port   = 80
  scheme = "http"
}

resource "terminal" "shell" {
  target = resource.container.webserver
  shell  = "/bin/bash"
}
