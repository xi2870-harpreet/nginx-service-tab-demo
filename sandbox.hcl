resource "container" "webserver" {
  image {
    name = "nginx:latest"
  }

  port {
    local = "80"
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
