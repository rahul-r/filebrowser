#!/usr/bin/env sh

# Usage:
# umount.sh

MAPPER_VOL=disk_vol

umount /dev/mapper/$MAPPER_VOL
cryptsetup luksClose $MAPPER_VOL
printf "Filesystem unmounted"