#!/bin/bash
set -e

# Load DB settings from the .env file
set -a
. /home/vin/cloudnova/.env
set +a

BACKUP_DIR="/home/vin/backups"
DATE=$(date +%F_%H-%M)

mkdir -p "$BACKUP_DIR"

# Dump the Ghost database from the MySQL container
docker exec -e MYSQL_PWD="$DB_ROOT_PASSWORD" ghost_db \
  mysqldump -u root --no-tablespaces "$DB_NAME" > "$BACKUP_DIR/ghost_$DATE.sql"

# Delete backups older than 7 days
find "$BACKUP_DIR" -name "ghost_*.sql" -mtime +7 -delete

echo "$(date): backup done -> ghost_$DATE.sql" >> "$BACKUP_DIR/backup.log"
