#!/bin/bash
set -ex
umount /mnt || true
mount /dev/sdb4 /mnt -o subvolid=5
/mnt/tools/hot-restore-snapshot.sh clean
