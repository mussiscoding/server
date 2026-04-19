#!/usr/bin/env bash
set -euo pipefail
BACKUP_DIR="/var/backups/$1"
mkdir -p "$BACKUP_DIR"
for db in /srv/"$1"/data/*.db; do
    name=$(basename "$db")
    sqlite3 "$db" ".backup '$BACKUP_DIR/${name%.db}-$(date +%Y%m%d).db'"
done
find "$BACKUP_DIR" -name "*.db" -mtime +7 -delete
