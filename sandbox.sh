#!/bin/sh
#for f in host.conf hosts nsswitch.conf resolv.conf; do
#    cp "/etc/$f" sandbox/etc/
#done
#USER=root HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin fakechroot -s fakeroot chroot sandbox "$@"
for f in host.conf hosts nsswitch.conf resolv.conf; do
    cp "/etc/$f" sandbox/etc/
done
USER=root HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin ./sandbox.proot/src/proot -0 -r sandbox --kill-on-exit -b /dev/ -b /sys/ -b /proc/ -b /tmp/ -b . -b sandbox.profile:/root/.profile "$@"
