#!/bin/bash

# MySQL database credentials
db_user="root"
db_password="Softcenter_ICTC"
db_name="softcenter_DB"

# Backup directory path
backup_dir="/home/backups"

# Backup filename prefix
backup_filename_prefix="softcenter_$(date +%Y%m%d%H%M%S)"

# Create the backup
mysqldump -u"$db_user" -p"$db_password" "$db_name" > "$backup_dir/$backup_filename_prefix.sql"

echo "MySQL backup created successfully: $backup_dir/$backup_filename_prefix.sql"
