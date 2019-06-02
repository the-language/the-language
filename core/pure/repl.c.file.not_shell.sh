#!/bin/sh
f="$(mktemp)"
clang "$(dirname "$0")"/c/lang.o -xc -I"$(dirname "$0")"/c -o "$f" "$@" || exit
"$f"
s="$?"
rm "$f"
exit "$s"
