#!/bin/bash

DATE=$(date +%F) # get current date in YYYY-MM-DD format
BACKUP_DIR="/root/backups/wgdb-backup-$DATE" #path to store the backup archive
ARCHIVE="$BACKUP_DIR/wgdb-volumes.tar.gz" #path to the backup archive

mkdir -p "$BACKUP_DIR" # create backup directory if it doesn't exist

echo "==> Creating WGDashboard backup archive..."
tar -czf "$ARCHIVE" -C /var/lib/docker/volumes .

if [ $? -ne 0 ]; then
    echo "ERROR: Backup creation failed. Stopping script."
    exit 1
fi

echo "==> Backup archive created successfully."

echo "==> Checking for old local WGDashboard backups..."

OLD_LOCAL=$(find /root/backups/ -maxdepth 1 -type d -name "wgdb-backup-*" -mtime +1) # up to 1 day old backups

if [ -z "$OLD_LOCAL" ]; then
    echo "==> No old local backups found. Skipping deletion."
else
    echo "==> Old local backups found:"
    echo "$OLD_LOCAL"

    if find /root/backups/ -maxdepth 1 -type d -name "wgdb-backup-*" -mtime +1 -exec rm -rf {} \; ; then
        echo "==> Old local backups deleted successfully."
    else
        echo "WARNING: Failed to delete some old local backups. Continuing anyway."
    fi
fi

#59 23 * * * /usr/local/bin/backup.sh - cron job to run the backup script daily at 11:59 PM
#tar -czf wgdb-volumes.tar.gz -C /var/lib/docker/volumes . - extract all volumes from /var/lib/docker/volumes