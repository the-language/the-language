#!/bin/sh
oldpwd="$(pwd)"
cd "$(dirname "$0")" ||exit
bin="$(pwd)"
make c/lang.o ||exit
cd "$oldpwd" ||exit
f="$(mktemp)"
clang "$bin"/c/lang.o -xc -I"$bin"/c -o "$f" "$@" || exit
"$f"
s="$?"
rm "$f"
exit "$s"
