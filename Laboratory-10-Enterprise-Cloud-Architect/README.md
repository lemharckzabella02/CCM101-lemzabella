# Laboratory 10 - Enterprise Cloud Architect

## Mission Overview
In this lab, I played the role of Enterprise Cloud Architect at CloudNova Technologies. I planned and deployed a multi-tier application made of Ghost and MySQL, running in Docker containers on an Ubuntu Server virtual machine in VirtualBox. I also set up persistent storage, protected the server with UFW, and automated database backups with a Bash script and a cron job.

## Objectives
- Create an architecture diagram of the cloud infrastructure.
- Set up and configure an Ubuntu Server virtual machine.
- Deploy Ghost and MySQL with Docker and Docker Compose.
- Set up persistent volumes for the database and application data.
- Protect the server with UFW using a default-deny incoming policy.
- Write a Bash script that automates database backups.
- Schedule the backups with cron.
- Test database restoration and service recovery.
- Document the infrastructure and finish my GitHub Cloud Computing Portfolio.

## Technologies Used
- Ubuntu Server
- Oracle VirtualBox
- Docker and Docker Compose
- Ghost
- MySQL
- UFW Firewall
- Bash Scripting
- Cron Scheduling
- SSH
- Markdown and GitHub

## Commands Executed
| Command | Purpose |
|---------|---------|
| `ssh -p 2222 vin@127.0.0.1` | Log in to the Ubuntu Server VM |
| `docker compose pull` | Download the needed container images |
| `docker compose up -d` | Start the application containers |
| `docker compose ps` | Check if the containers are running |
| `docker compose down` | Stop and remove the containers while keeping the persistent volumes |
| `sudo ufw status verbose` | View the firewall status and rules |
| `sudo ss -tulpn` | See which ports are listening |
| `./automation-script.sh` | Run the database backup script |
| `ls -lh ~/backups` | List the backup files created |
| `cat ~/backups/backup.log` | Read the backup log |
| `crontab -l` | List the scheduled cron jobs |
| `docker volume ls` | List the Docker volumes |
| `sudo reboot` | Restart the Ubuntu Server VM |

## Skills Learned
- Planning a multi-tier cloud infrastructure.
- Running connected containers with Docker Compose.
- Setting up persistent storage with Docker volumes.
- Securing a Linux server with UFW.
- Checking open ports and running network services.
- Automating database backups with Bash.
- Scheduling repeating tasks with cron.
- Restoring database records from backup files.
- Testing that containers recover after a server reboot.
- Writing deployment and maintenance documentation in Markdown.

## Files
- [Architecture Diagram](architecture-diagram.png)
- [Docker Compose Configuration](docker-compose.yml)
- [Automation Script](automation-script.sh)
- [Operational Manual](operational-manual.md)
- [Final Reflection](final-reflection.md)

## Project Summary
This lab brought together the Linux, virtualization, containerization, security, storage, and automation topics from the CCM101 Cloud Computing course. It shows how to deploy, secure, maintain, and recover a containerized web application in a local cloud environment.
