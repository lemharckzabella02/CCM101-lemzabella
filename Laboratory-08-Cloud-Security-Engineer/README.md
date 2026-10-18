# Laboratory 08 - Cloud Security Engineer

**Course:** CCM101 - Cloud Computing
**Student:** Lemharck Jade M. Zabella
**GitHub:** lemharckzabella02

---

## Mission Overview

As a Cloud Security Engineer at CloudNova Technologies, my mission was to secure a newly deployed Ubuntu server that had been left exposed to the public internet. I deployed an Nginx web server container named `secure-web-app` on port 8080, then locked down the server using UFW (Uncomplicated Firewall). I enforced a Default Deny policy for incoming traffic and opened only the services the client needs: SSH (port 22) for remote administration and TCP port 8080 for the web application.

---

## Objectives

- Understand the concept of the Attack Surface and the Principle of Least Privilege (PoLP)
- Perform a basic security audit of active network ports on a Linux server
- Configure the Uncomplicated Firewall (UFW) with a Default Deny policy
- Implement granular port management to selectively allow SSH and HTTP traffic
- Document firewall rules and security best practices using Markdown
- Continue expanding my professional GitHub Cloud Computing Portfolio

---

## Commands Executed

**Deploy the web application**

```bash
docker run -d --name secure-web-app -p 8080:80 nginx
curl http://localhost:8080
```

**Build the firewall**

```bash
sudo ufw allow ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose
```

**Allow the web application port**

```bash
sudo ufw allow 8080/tcp
sudo ufw status numbered
curl http://localhost:8080
```

**Push work to GitHub**

```bash
git add .
git commit -m "Lab 8: Cloud Security Engineer"
git push origin main
```

---

## Skills Learned

- Deploying a containerized Nginx web server with Docker
- Configuring and enabling a host-based firewall using UFW
- Applying a Default Deny policy and the Principle of Least Privilege to network traffic
- Allowing specific ports while blocking everything else
- Verifying firewall rules with `ufw status` and testing access with `curl`
- Documenting security configurations in Markdown
- Managing a structured GitHub portfolio with Git

---

## Repository Contents

| File | Description |
|------|-------------|
| `security-audit-report.md` | Definitions of PoLP, Attack Surface, and Default Deny |
| `firewall-configuration.md` | Firewall commands and configuration notes |
| `reflection.md` | Mission reflection |
| `screenshots/` | Evidence screenshots for Checkpoints 3, 4 and 5 |
