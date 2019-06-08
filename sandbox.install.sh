#!/bin/sh
rm -fr sandbox sandbox.proot
exec ./sandbox.upgrade.sh "$@"
