resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "container" "webserver" {
  image {
    name = "stefanprodan/podinfo:6.5.0"
  }

  port {
    local = 9898
  }

  network {
    id = resource.network.main.meta.id
  }
}

resource "service" "webserver" {
  target = resource.container.webserver
  port   = 9898
  scheme = "http"
}

resource "terminal" "shell" {
  target = resource.container.webserver
  shell  = "/bin/sh"
}
