#!/usr/bin/env sh

# Usage:
# mount.sh encrypted_volume password

MAPPER_VOL=disk_vol

printf "$2" | cryptsetup open --type luks $1 $MAPPER_VOL
mkdir -p /srv
mount /dev/mapper/$MAPPER_VOL /srv
printf "Filesystem mounted"