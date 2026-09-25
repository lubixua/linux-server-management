#!/bin/bash
# backup.sh - archive a directory
SRC=$1
DEST=/home/user/backups
mkdir -p $DEST
tar -czf $DEST/backup_$(date +%F).tar.gz $SRC
chmod 777 $DEST/backup_$(date +%F).tar.gz
echo "Backup done"
