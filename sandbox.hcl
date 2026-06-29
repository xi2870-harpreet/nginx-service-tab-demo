resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "container" "webserver" {
  image {
    name = "hashicorp/http-echo:latest"
  }

  command = ["-listen=:5678", "-text=Hello from Instruqt Labs!"]

  port {
    local = 5678
  }

  network {
    id = resource.network.main.meta.id
  }

  health_check {
    http {
      address      = "http://localhost:5678"
      success_codes = [200]
    }
    timeout = "30s"
  }
}

resource "service" "webserver" {
  target = resource.container.webserver
  port   = 5678
  scheme = "http"
}

resource "terminal" "shell" {
  target = resource.container.webserver
  shell  = "/bin/sh"
}
