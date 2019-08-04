#!/bin/sh
set -e
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make c/liblang.so
cd tool
yarn
cd "$oldpwd"
LD_LIBRARY_PATH="$bin"/c "$bin"/tool/node_modules/.bin/ya-igcc -Pc -I"$bin"/c -Pc -L"$bin"/c -Pc -llang -e ':include lang.h' -e ':include assert.h' -e ':include string.h' -e ':include stdlib.h' -e 'lang_state *L = lang_state_new_orNULL();' -i true "$@"
