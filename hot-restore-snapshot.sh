#!/bin/bash

TARGETDIR="/mnt/clean"
mount -t proc proc $TARGETDIR/proc
mount -t sysfs sysfs $TARGETDIR/sys
mount -t devtmpfs devtmpfs $TARGETDIR/dev
mount -t tmpfs tmpfs $TARGETDIR/dev/shm
mount -t devpts devpts $TARGETDIR/dev/pts

# Link /etc/mtab
chroot $TARGETDIR rm /etc/mtab 2> /dev/null
chroot $TARGETDIR ln -s /proc/mounts /etc/mtab

chroot $TARGETDIR mount /dev/sdb4 /mnt -o subvolid=5
chroot $TARGETDIR /mnt/tools/restore-snapshot.sh "$1"

