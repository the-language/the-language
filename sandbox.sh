#!/bin/sh

USER=root HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin ./sandbox.proot/src/proot -0 -r sandbox --kill-on-exit -b /etc/host.conf -b /etc/hosts -b /etc/nsswitch.conf -b /etc/resolv.conf -b /dev/ -b /sys/ -b /proc/ -b /tmp/ -b . -b sandbox.profile:/root/.profile "$@"
