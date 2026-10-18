# Laboratory 07 – Cloud Operations Engineer

## Mission Overview
As a Cloud Operations Engineer (SRE) at CloudNova Technologies, I performed a baseline health check on a Linux host, deployed the client's Nginx web server, generated test traffic, and used logs and real-time metrics to verify that the infrastructure is ready for a surge in users.

## Objectives
- Monitor host CPU, memory, and disk capacity using native Linux tools
- Deploy a web container and track its performance using Docker metrics
- Generate web traffic and extract application access logs
- Translate raw performance data into a technical report using Markdown
- Continue expanding my GitHub Cloud Computing Portfolio

## Monitoring Commands Executed
| Command | Purpose |
|---|---|
| `free -h` | Check host memory usage |
| `df -h` | Check host disk storage |
| `top` | View running processes and CPU load |
| `docker run -d --name client-website -p 8080:80 nginx` | Deploy the Nginx container |
| `curl http://localhost:8080` | Simulate successful user requests (HTTP 200) |
| `curl http://localhost:8080/hidden-admin-page` | Trigger an HTTP 404 error |
| `docker logs client-website` | Retrieve application logs |
| `docker stats` | View real-time container CPU, memory, and network usage |

## Skills Learned
- Establishing a host performance baseline
- Deploying and exposing containers with port mapping
- Simulating traffic and generating HTTP errors
- Reading and analyzing application logs
- Interpreting real-time container metrics
- Documenting system health in Markdown
