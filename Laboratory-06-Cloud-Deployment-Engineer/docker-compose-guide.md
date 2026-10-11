# Docker Compose Guide

## The Compose File

```yaml
version: '3'

services:
  database:
    image: mariadb:10.6
    environment:
      - MYSQL_ROOT_PASSWORD=cloudnova_root
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user

  app:
    image: nextcloud
    ports:
      - 8080:80
    environment:
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user
      - MYSQL_HOST=database
```

## What does the services: block do?

The services: block lists the containers needed for the application to work. In this lab, it includes MariaDB for the database and Nextcloud for the web application. It also contains the settings needed to configure each service.

## How did the Nextcloud app container find the database container?

The Nextcloud container connects to the database because MYSQL_HOST is set to database. This is the name of the database service in the Compose file. Docker Compose allows the containers to communicate through its internal network using their service names.

## What is the difference between docker run and docker-compose up -d?

| | docker run | docker-compose up -d |
|---|---|---|
| What it starts | An individual container | The services listed in the Compose file |
| How it runs | Started with one command per container | Runs in the background (-d) |
| Managing multiple containers | Each container is handled separately | Related containers are managed together |
