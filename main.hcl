resource "page" "introduction" {
  title = "Getting Started with NGINX"
  file  = "instructions/intro.md"
}

resource "layout" "default" {
  column {
    width = "40"
    instructions {}
  }

  column {
    width = "60"

    tab "nginx" {
      target = resource.service.webserver
      title  = "NGINX Web Server"
      active = true
    }

    tab "terminal" {
      target = resource.terminal.shell
      title  = "Terminal"
    }
  }
}

resource "lab" "nginx_basics" {
  title       = "NGINX Web Server Basics"
  description = "Learn how to run and configure NGINX in a containerised environment."
  layout      = resource.layout.default

  settings {
    timelimit {
      duration   = "15m"
      show_timer = true
    }

    idle {
      enabled      = true
      timeout      = "5m"
      show_warning = true
    }
  }

  content {
    chapter "getting-started" {
      title = "Getting Started"

      page "intro" {
        reference = resource.page.introduction
      }
    }
  }
}
