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

## Screenshots

<img width="1112" height="1012" alt="compose-deployment" src="https://github.com/user-attachments/assets/58ce14fa-c38b-4d7f-8f0a-37d84cf44956" />

<img width="1913" height="1015" alt="nextcloud-web" src="https://github.com/user-attachments/assets/93c0d47a-216c-455a-90f4-e35f69aba4a8" />

<img width="537" height="130" alt="compose-teardown" src="https://github.com/user-attachments/assets/5adcad2f-d88d-4045-8e52-2a8e6c32180f" />


## Skills Learned

- Writing and understanding a Docker Compose file.
- Running and managing multiple containers.
- Connecting containers through Docker networking.
- Checking container status and stopping services when they are no longer needed.
