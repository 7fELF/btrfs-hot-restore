# btrfs-hot-restore
A little script that I use to restore a btrfs snapshot of my system.

I put those scripts in a `tools` subvolume:
```
$ sudo mount /dev/sdb4 ./mnt -o subvol=/
$ ls mnt/tools
hot-restore-snapshot.sh  quickrestore.sh  reboot  reboot.c  restore-snapshot.sh
```

When I restore the snapshot, I remove the subvolume I'm currently on.
Thats why I chroot in the `clean` subvolume (my snapshot).
I use `reboot.c` to ask directly the kernel for a reboot.
You need to compile `reboot.c`:
```
gcc reboot.c -o reboot
```

You can copy quickrestore.sh elsewhere to restore without bothering mounting the root subvolume
of your partition.

