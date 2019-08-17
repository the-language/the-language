#!/bin/sh
f="$(mktemp)"
err(){
  rm -f "$f"
  exit 1
}
oldpwd="$(pwd)"
cd "$(dirname "$0")" || err
bin="$(pwd)"
make c/lang.o || err
cd "$oldpwd" || err
clang "$bin"/c/lang.o -xc -I"$bin"/c -o "$f" "$@" || err
"$f"
s="$?"
rm "$f"
exit "$s"
