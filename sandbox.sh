#!/bin/sh
for f in host.conf hosts nsswitch.conf resolv.conf; do
    cp "/etc/$f" sandbox/etc/
done
USER=root HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin fakechroot fakeroot chroot sandbox "$@"
