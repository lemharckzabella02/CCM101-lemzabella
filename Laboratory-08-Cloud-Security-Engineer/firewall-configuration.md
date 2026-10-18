# Firewall Configuration

**Server:** Ubuntu (KillerCoda Playground)
**Firewall:** UFW (Uncomplicated Firewall)
**Application:** Nginx container `secure-web-app` on port 8080

---

## 1. Allow SSH (Port 22)

SSH is allowed first so administrators can still manage the server after the firewall is turned on.

```bash
sudo ufw allow ssh
```

## 2. Set the Default Deny Policy

All incoming traffic is blocked by default, while all outgoing traffic is allowed.

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

## 3. Enable the Firewall

```bash
sudo ufw enable
sudo ufw status verbose
```

## 4. Allow Port 8080 (Web Application)

A specific rule is added so legitimate users can reach the web application over TCP.

```bash
sudo ufw allow 8080/tcp
sudo ufw status numbered
curl http://localhost:8080
```

---

## Summary of Rules

| Rule | Purpose |
|------|---------|
| `allow ssh` (22/tcp) | Remote administration |
| `default deny incoming` | Block all unrequested inbound traffic |
| `default allow outgoing` | Allow the server to reach the internet |
| `allow 8080/tcp` | Let users access the web application |

---

## What happens if `sudo ufw enable` is run before `sudo ufw allow ssh`?

The firewall would immediately block all incoming connections, including SSH on port 22, which would lock the administrator out of their own server.
