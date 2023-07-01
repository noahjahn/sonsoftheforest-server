#!/bin/bash

BACKUP_DIR=$1

if [ -z "$BACKUP_DIR" ]; then
    printf "Usage:\t backup.sh path/to/backups\n"
    exit 2;
fi

ls -al | grep -q docker-compose.yaml && cat docker-compose.yaml | grep -q sonsoftheforest

if [ $? -ne 0 ]; then
    printf "backup.sh needs to be called from the root of the sonsoftheforest-server directory\n"
fi

mkdir -p $BACKUP_DIR

docker compose cp sonsoftheforest:/sonsoftheforest $BACKUP_DIR/$(date -Iseconds)
