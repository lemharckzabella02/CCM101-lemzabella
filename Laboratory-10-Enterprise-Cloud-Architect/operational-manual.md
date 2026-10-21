# Operational Manual: CloudNova Ghost Stack

**Course:** CCM101 Cloud Computing
**Project:** Laboratory 10, Enterprise Cloud Architect
**Prepared by:** [Group member names]
**Stack:** Ghost (web tier) + MySQL 8.0 (database tier) in Docker, on Ubuntu Server in VirtualBox

This manual is for the client's IT team. It shows how to deploy, secure, and maintain the system.

---

## 1. Overview

The system is a private Ghost website. It runs in two Docker containers inside one Ubuntu Server virtual machine.

| Part | Value |
|------|-------|
| Host | Windows laptop |
| Hypervisor | Oracle VirtualBox (Type 2) |
| VM OS | Ubuntu Server 26.04 |
| Hostname / user | `cn-prod-101` / `vin` |
| VM IP | `10.0.2.15` (NAT) |
| Web tier | `ghost_app` (Ghost 6) |
| Database tier | `ghost_db` (MySQL 8.0) |
| Firewall | UFW, default deny |
| Backup | Daily at 2:00 AM with a Bash script and cron |

How traffic flows:

1. The browser on the laptop opens `http://localhost:8080`.
2. VirtualBox forwards port 8080 to port 80 on the VM.
3. UFW allows port 80. Docker sends it to Ghost on port 2368.
4. Ghost talks to MySQL on Docker's private network. The database port is not open to the outside.

See `architecture-diagram.png` for the full diagram.

---

## 2. Requirements

**Host laptop**
- VirtualBox installed
- At least 8 GB RAM and 40 GB free disk
- Ubuntu Server ISO
- Stable internet connection

**Virtual machine**
- 2 CPUs
- 4096 MB RAM (2048 MB works, but the VM can freeze during image downloads)
- 25 GB disk
- Network: NAT with port forwarding

---

## 3. Set Up the VM

1. In VirtualBox, click **New**. Pick the Ubuntu Server ISO and tick **Skip unattended installation**.
2. Set 2 CPUs, 4096 MB RAM, and a 25 GB disk.
3. Go to **Settings > Network > Adapter 1**. Set **Attached to: NAT**.
4. Turn on **Expert** mode, then click **Advanced > Port Forwarding**. Add these rules:

| Name | Protocol | Host IP | Host Port | Guest Port |
|------|----------|---------|-----------|------------|
| ssh | TCP | 127.0.0.1 | 2222 | 22 |
| web | TCP | 127.0.0.1 | 8080 | 80 |

5. Start the VM and install Ubuntu Server:
   - Leave the network on DHCP.
   - Set the server name to `cn-prod-101` and the username to `vin`.
   - Tick **Install OpenSSH server**.
   - Skip the optional snaps.
6. After the reboot, log in and check the IP address:

```bash
ip -4 a
```

You should see `10.0.2.15/24` on `enp0s3`. If there is no IPv4 address, see Section 9 (Troubleshooting).

7. Update the system and set the timezone:

```bash
sudo apt update && sudo apt upgrade -y
sudo timedatectl set-timezone Asia/Manila
```

8. From the laptop (PowerShell), connect with SSH:

```powershell
ssh -p 2222 vin@127.0.0.1
```

---

## 4. Deploy the Stack

### 4.1 Install Docker

```bash
sudo apt install -y docker.io docker-compose-v2
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
```

Log out and log in again. Then test:

```bash
docker run hello-world
docker compose version
```

### 4.2 Create the project folder and secrets file

```bash
mkdir ~/cloudnova && cd ~/cloudnova
nano .env
```

Put these four lines in `.env`. Use your own strong passwords (letters and numbers only):

```
DB_NAME=ghost
DB_USER=ghostuser
DB_PASSWORD=<your-db-password>
DB_ROOT_PASSWORD=<your-root-password>
```

Lock the file so only the owner can read it:

```bash
chmod 600 .env
```

The `.env` file is never committed to GitHub. The repository has `.env.example` with fake values only.

### 4.3 Add the compose file and start

Copy `docker-compose.yml` from this folder into `~/cloudnova`. Then:

```bash
docker compose config
docker compose pull
docker compose up -d
docker compose ps
```

- `config` checks the file for mistakes.
- `pull` downloads the images first.
- `up -d` starts both containers in the background.

Wait 30 to 60 seconds. `ghost_db` should show **healthy** and `ghost_app` should show **Up**.

### 4.4 First login

Open `http://localhost:8080/ghost` in the laptop browser. Create the admin account.

### 4.5 What the compose file does

| Setting | Purpose |
|---------|---------|
| `db` and `ghost` services | Two linked containers (database tier and web tier) |
| `db_data` volume | Keeps the MySQL data when the container is removed or the VM reboots |
| `ghost_content` volume | Keeps uploaded images and themes |
| `ports: "80:2368"` | The only published port. The database port is not published |
| `healthcheck` + `depends_on` | Ghost starts only after MySQL is ready |
| `restart: always` | Containers start again after a crash or reboot |
| `.env` variables | Passwords stay out of the compose file |

---

## 5. Security

### 5.1 Firewall (UFW)

Allow SSH first. If you do not, enabling UFW will cut your SSH session.

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment 'SSH'
sudo ufw allow 80/tcp comment 'Ghost web'
sudo ufw enable
sudo ufw status verbose
```

Expected result:

- `Status: active`
- `Default: deny (incoming), allow (outgoing)`
- Only `22/tcp` and `80/tcp` are allowed

Check which ports are listening:

```bash
sudo ss -tulpn
```

Port 3306 (MySQL) must not appear.

### 5.2 Other security measures

- **Default deny:** everything is blocked unless allowed on purpose.
- **Database not exposed:** only Ghost can reach MySQL, through Docker's private network.
- **Docker and UFW:** Docker can bypass UFW for ports it publishes. This is why only port 80 is published.
- **Secrets file:** `.env` has mode `600` and is not in GitHub.
- **Network access:** with NAT and port forwarding on `127.0.0.1`, only the host laptop can reach the VM.
- **Passwords:** use long, unique passwords for the VM user, the Ghost admin, and the database.

---

## 6. Backup and Restore

### 6.1 Backup script

The file `automation-script.sh` does three things:

1. Reads the database settings from `.env`.
2. Runs `mysqldump` inside the `ghost_db` container and saves a `.sql` file in `/home/vin/backups`.
3. Deletes backups older than 7 days and writes a line to `backup.log`.

Install it:

```bash
cd ~/cloudnova
chmod +x automation-script.sh
./automation-script.sh
ls -lh ~/backups
cat ~/backups/backup.log
```

A new `ghost_<date>.sql` file should appear. It must not be empty.

### 6.2 Schedule with cron

```bash
crontab -e
```

Add this line:

```
0 2 * * * /home/vin/cloudnova/automation-script.sh >> /home/vin/backups/cron.log 2>&1
```

This runs the backup every day at 2:00 AM (server time, Asia/Manila). Check it with:

```bash
crontab -l
```

To test cron quickly, use `* * * * *` (every minute) for 2 or 3 minutes. Then change it back to the daily line.

### 6.3 Restore

```bash
cd ~/cloudnova
set -a; . ./.env; set +a
docker exec -i -e MYSQL_PWD="$DB_ROOT_PASSWORD" ghost_db mysql -u root "$DB_NAME" < $(ls -t ~/backups/ghost_*.sql | head -1)
docker compose restart ghost
```

This restores the newest backup. To restore a specific file, replace `$(ls -t ... | head -1)` with the file path.

We tested this by deleting a post, restoring, and confirming the post came back.

---

## 7. Daily Operations and Maintenance

| Task | Command |
|------|---------|
| Check containers | `docker compose ps` |
| Check all containers on the VM | `docker ps` |
| View Ghost logs | `docker compose logs ghost` |
| View database logs | `docker compose logs db` |
| Stop the stack (keeps data) | `docker compose down` |
| Start the stack | `docker compose up -d` |
| Update images | `docker compose pull` then `docker compose up -d` |
| Check firewall | `sudo ufw status verbose` |
| Check backups | `ls -lh ~/backups` and `cat ~/backups/backup.log` |
| Update Ubuntu | `sudo apt update && sudo apt upgrade -y` |
| Reboot the VM | `sudo reboot` |

**Warning:** `docker compose down -v` deletes the volumes and all data. Use it only to reset a practice system.

**After a reboot**, the containers start by themselves because of `restart: always`. Check with `docker ps`, `sudo ufw status verbose`, and `crontab -l`. Our reboot test confirmed that the site, the post, the firewall, and the cron job all survived.

**Passwords:** MySQL saves the passwords in the volume at first start. If you change them in `.env` later, you must reset the volumes (`docker compose down -v`) or the app will not connect.

---

## 8. Tests Completed

| Test | Result |
|------|--------|
| Docker `hello-world` | Passed |
| Both containers running, database healthy | Passed |
| Ghost site opens from the laptop browser | Passed |
| UFW active with default deny, only 22 and 80 allowed | Passed |
| Backup script creates a `.sql` file and a log line | Passed |
| Cron runs the script on schedule | Passed |
| Restore brings a deleted post back | Passed |
| Reboot: containers, data, UFW, and cron survive | Passed |

---

## 9. Troubleshooting

| Problem | Cause | Fix |
|---------|-------|-----|
| No IPv4 address in the VM | Bridged mode did not get an IP, or netplan has no `dhcp4: true` | Use NAT. In `/etc/netplan/*.yaml`, add `dhcp4: true` under `enp0s3`, then run `sudo netplan apply` |
| Cannot reach the VM from the laptop | NAT hides the VM | Add the port forwarding rules in Section 3 |
| `ping google.com` fails | NAT does not route IPv6 | Test with `ping -4 -c 3 google.com` |
| SSH: "host key has changed" | A different VM used the same port before | `ssh-keygen -R "[127.0.0.1]:2222"` |
| `docker compose pull` seems stuck | Slow or stalled download | Close the terminal, reconnect with SSH, run `docker compose pull` again. Finished layers are kept |
| `ghost_app` keeps restarting | Wrong database settings, or MySQL not ready | Run `docker compose logs ghost` and check the `.env` values |
| Site opens but links or images break | `url:` in the compose file does not match the browser address | Set `url: http://localhost:8080` |
| VM freezes with `soft lockup` messages | Not enough CPU or RAM | Set 4096 MB RAM and 2 CPUs. Close heavy apps on the laptop |
| SSH cut off after enabling UFW | Port 22 was not allowed first | Use the VirtualBox console and run `sudo ufw allow 22/tcp` |
| `crontab -1` gives "invalid option" | Typed the number 1 | Use `crontab -l` (letter L) |
| Backup file name shows the wrong time | Timezone is UTC | `sudo timedatectl set-timezone Asia/Manila` |

---

## 10. Known Limits and Improvements

**Limits**
- Backups are stored on the same VM. If the VM is lost, the backups are lost.
- The backup covers the database only. The `ghost_content` volume (images, themes) is not in it.
- The site uses HTTP only.
- No monitoring or alerts.

**Improvements**
- Copy backups to another machine or cloud storage.
- Add the `ghost_content` volume to the backup script.
- Add HTTPS with a reverse proxy.
- Add health checks with alerts, and a log rotation task.
- Use SSH keys and turn off password login.
