# Laboratory 04 — Cloud-Native Engineer

## Mission Overview
This lab explores the shift from traditional Virtual Machines to containerization. Using Docker on a KillerCoda playground, I deployed and managed a live Nginx web server to understand how cloud-native engineers work with containers instead of managing full servers.

## Objectives
- Differentiate between Virtual Machines and Containers
- Access a Docker-enabled cloud environment using KillerCoda
- Execute fundamental Docker CLI commands
- Pull, run, manage, and terminate a containerized application (Nginx)
- Document container operations using Markdown
- Expand my GitHub Cloud Computing Portfolio

## Docker Commands Executed
```bash
docker --version
docker info
docker pull nginx
docker run -d --name my-nginx -p 8080:80 nginx
curl http://localhost:8080
docker ps
docker stop my-nginx
docker ps -a
docker rm my-nginx
```

## Skills Learned
- Verifying a Docker environment and reading its status output
- Pulling images from Docker Hub and running containers in detached mode
- Mapping host ports to container ports with -p
- Managing the full container lifecycle: list, stop, verify, remove

## Challenges Encountered
- Getting familiar with detached mode (-d) and confirming the container was actually running via curl rather than just trusting the run command
- Understanding that stopping a container doesn't delete it — rm is a separate, deliberate step
