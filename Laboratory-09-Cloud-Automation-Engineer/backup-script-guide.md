# Backup Script Guide

This guide documents the automated backup solution built for CloudNova Technologies. It is written so the client's IT team can understand, run, and maintain it.

## 1. The Script (`backup.sh`)

```bash
#!/bin/bash
# Automated Backup Script for CloudNova Technologies

SOURCE_DIR="app-data"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "Initiating automated backup..."

# Create the backup directory if it does not exist
mkdir -p $BACKUP_DIR

# Compress the source directory into a tarball (.tar.gz)
tar -czf $BACKUP_DIR/backup_$TIMESTAMP.tar.gz $SOURCE_DIR

echo "Backup completed successfully at $TIMESTAMP!"
```

### How the script works

| Line | Purpose |
|------|---------|
| `#!/bin/bash` | Tells Linux to run the file with the Bash interpreter |
| `SOURCE_DIR="app-data"` | Stores the folder that will be backed up |
| `BACKUP_DIR="backups"` | Stores the folder where backups are saved |
| `TIMESTAMP=$(date +"%Y%m%d_%H%M%S")` | Captures the current date and time so each backup has a unique name |
| `mkdir -p $BACKUP_DIR` | Creates the backup folder only if it does not already exist |
| `tar -czf ...` | Compresses (`-c` create, `-z` gzip, `-f` file) the source folder into a `.tar.gz` file |
| `echo ...` | Prints status messages so the operator can see progress |

## 2. What `chmod +x` Does

By default, a newly created file in Linux does not have permission to run as a program. This is why running `./backup.sh` the first time returned a "Permission denied" error.

The command:

```bash
chmod +x backup.sh
```

adds the **execute (`x`) permission** to the file. After this, Linux allows `backup.sh` to run as a program, and `./backup.sh` executes successfully. This protects the system from running ordinary text files by accident, so execution rights must be granted on purpose.

## 3. The Cron Expression

```
0 2 * * * /root/backup.sh
```

This line was added to the crontab using `env EDITOR=nano crontab -e`.

| Field | Value | Meaning |
|-------|-------|---------|
| Minute | `0` | At minute 0 (the start of the hour) |
| Hour | `2` | At 2 AM (24-hour clock) |
| Day of Month | `*` | Every day of the month |
| Month | `*` | Every month |
| Day of Week | `*` | Every day of the week |

**Result:** `/root/backup.sh` runs automatically every night at exactly 2:00 AM, with no human action required.

## 4. Testing and Verification

1. Ran `./backup.sh` before granting permission and confirmed the "Permission denied" error.
2. Ran `chmod +x backup.sh` and executed the script successfully.
3. Verified the backup file was created with `ls -l backups/`.
4. Verified the schedule was installed with `crontab -l`.

