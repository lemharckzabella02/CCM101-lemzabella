# Laboratory 09: Cloud Automation Engineer

**Course:** CCM101 - Cloud Computing
**Mission 9:** The Cloud Automation Engineer

## Mission Overview

In this mission I took the role of a Cloud Automation Engineer on the DevOps team at CloudNova Technologies. A client's IT staff kept forgetting to back up application data, which once led to the permanent loss of critical customer files. To remove the human element, I created a dummy application directory, wrote a Bash script that compresses it into a timestamped backup, made the script executable with `chmod`, tested it, and scheduled it with cron to run every night at 2:00 AM.

## Objectives

- Understand the fundamental syntax of a Bash shell script, including variables and basic commands
- Use a command-line text editor (nano) to write and save executable scripts
- Modify Linux file permissions using the `chmod` command
- Understand task scheduling and the syntax of a Linux crontab
- Document automation code and cron job configurations using Markdown
- Complete the final chapter of my GitHub Cloud Computing Portfolio

## Commands Executed

```bash
# Create dummy application data
mkdir app-data
echo "This is critical client data." > app-data/data.txt

# Create the backup script
nano backup.sh

# Test permissions
./backup.sh                      # Permission denied
chmod +x backup.sh               # Make the script executable
./backup.sh                      # Runs successfully

# Verify the backup was created
ls -l backups/

# Schedule the cron job
crontab -l                       # No crontab for root
env EDITOR=nano crontab -e       # Open the crontab editor
# Added line: 0 2 * * * /root/backup.sh
crontab -l                       # Verify the installed schedule
```

## Skills Learned

- Writing Bash scripts that use variables and command substitution
- Creating compressed `.tar.gz` archives with `tar -czf`
- Managing file permissions with `chmod +x`
- Scheduling recurring tasks with cron and reading the five time fields of a cron expression
- Using nano to create and edit files in the terminal
- Documenting code and configurations clearly in Markdown
