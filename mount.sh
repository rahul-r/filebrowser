#!/usr/bin/env sh

# Usage:
# mount.sh encrypted_volume password

MAPPER_VOL=disk_vol

printf "$2" | cryptsetup open --type luks $1 $MAPPER_VOL

if [ "$?" -ne "0" ]; then
    printf "Volume already mounted, unmounting\n"
    umount /dev/mapper/$MAPPER_VOL
    cryptsetup luksClose $MAPPER_VOL
    printf "Filesystem unmounted\n"
    exit 1
fi

mkdir -p /srv
mount /dev/mapper/$MAPPER_VOL /srv
printf "Filesystem mounted"