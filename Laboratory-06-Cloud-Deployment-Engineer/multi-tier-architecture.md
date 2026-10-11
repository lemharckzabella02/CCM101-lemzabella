# Two-Tier Architecture

A two-tier architecture is a system that separates an application into two parts: the web/application tier and the database tier. Users interact with the application through a web browser, while the database stores the information needed by the application.

## The Web/Application Tier
In this lab, the web tier is the container that runs the Nextcloud application. It provides the user interface that people see in their browsers, receives HTTP requests, and communicates with the database whenever it needs to save or retrieve information.

## The Database Tier
In this lab, the database tier is the container that runs MariaDB. Its job is to store and manage the data used by Nextcloud and provide the information the application needs.

## Why Separate Them?
Using two separate containers makes the application easier to manage and maintain. Each container has its own job, so we can update or troubleshoot one without having to change the other. It also makes it easier to scale the application when needed.
