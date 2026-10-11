# Laboratory 06 - Cloud Deployment Engineer

## Mission Overview

In this lab, I learned how to use Docker Compose to run a Nextcloud application with a MariaDB database. I also learned how the two containers communicate and how to manage them using Docker commands.

## Objectives

- Understand how a two-tier architecture works.
- Practice deploying and managing containers using Docker Compose.
- Learn how containers communicate through Docker networking.

## Commands Executed

```bash
mkdir nextcloud-deployment
cd nextcloud-deployment
nano docker-compose.yml
docker-compose up -d
docker-compose ps
docker-compose down
```

## Skills Learned

- Writing and understanding a Docker Compose file.
- Running and managing multiple containers.
- Connecting containers through Docker networking.
- Checking container status and stopping services when they are no longer needed.
