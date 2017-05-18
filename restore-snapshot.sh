#!/bin/bash
set -ex

# Btrfs wont delete the default subvolume
btrfs subvolume set-default 5 /mnt

# Delete @
(cd /mnt && btrfs subvolume delete @)

# Snapshot $1 to @
btrfs subvolume snapshot "/mnt/$1" /mnt/\@
id=$(btrfs subvolume list /mnt | grep -e "@$" | sed "s/^ID\ //" | sed s/\ gen.*//)

# Set the new subvolume as default
btrfs subvolume set-default "$id" /mnt
btrfs subvolume get-default /mnt

echo "Rebooting in 2 seconds"
sleep 2
/mnt/tools/reboot
