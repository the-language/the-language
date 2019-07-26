#!/bin/sh
set -e
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make c/lang.o
cd "$oldpwd"
f="$(mktemp)"
clang "$bin"/c/lang.o -xc -I"$bin"/c -o "$f" "$@"
"$f"
s="$?"
rm "$f"
exit "$s"
