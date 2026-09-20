# Docker Deployment Log

## Deploying Nginx

| Command | Purpose |
|---|---|
| `docker pull nginx` | Downloads the official Nginx image from Docker Hub |
| `docker run -d --name my-nginx -p 8080:80 nginx` | Runs Nginx in detached mode, mapping host port 8080 to container port 80 |
| `curl http://localhost:8080` | Sends an HTTP request to confirm the web server is responding |

## Container Lifecycle

| Command | Explanation |
|---|---|
| `docker ps` | Lists all currently running containers |
| `docker stop my-nginx` | Gracefully stops the running `my-nginx` container |
| `docker ps -a` | Lists all containers, including stopped ones, to verify the stop |
| `docker rm my-nginx` | Permanently removes the stopped container and its writable layer |
