#!/bin/sh
oldpwd="$(pwd)"
cd "$(dirname "$0")" ||exit
bin="$(pwd)"
make c/liblang.so ||exit
[ -f node_modules/.bin/ya-igcc ] || npm install ||exit
cd "$oldpwd" ||exit
LD_LIBRARY_PATH="$bin"/c "$bin"/node_modules/.bin/ya-igcc -Pc -I"$bin"/c -Pc -L"$bin"/c -Pc -llang -e ':include lang.h' -e ':include assert.h' -e ':include string.h' -e ':include stdlib.h' -e 'lang_state *L = lang_state_new_orNULL();' -i true "$@"
