# Getting Started with NGINX

Welcome! In this lab you will explore a running NGINX web server inside a container.

## What You Will Do

- View the live NGINX welcome page in the **NGINX Web Server** tab
- Explore the container filesystem using the **Terminal** tab
- Inspect the default HTML file being served

## Step 1 — View the Running Web Server

Click the **NGINX Web Server** tab on the right. You should see the NGINX default welcome page served from the container.

## Step 2 — Check the NGINX Version

Switch to the **Terminal** tab and run:

```bash
nginx -v
```

## Step 3 — Inspect the Default Page

```bash
cat /usr/share/nginx/html/index.html
```

This is the file NGINX is serving at the root path. Any changes you make here will be reflected immediately in the **NGINX Web Server** tab on refresh.
