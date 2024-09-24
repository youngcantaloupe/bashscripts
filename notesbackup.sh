#!/bin/bash
backup_dir="/home/kakashi/Backups/Notebackup"

mkdir -p $backup_dir

timestamp=$(date +'%Y%m%d_%H%M%S')
backup_filename="backup_${timestamp}.tar.gz"

tar -cvzf "${backup_dir}/${backup_filename}" /home/kakashi/Notes

echo "Backup created: ${backup_dir}/${backup_filename}"
