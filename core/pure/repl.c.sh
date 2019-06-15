#!/bin/sh
[ -f "$(dirname "$0")"/node_modules/.bin/ya-igcc ] || npm install
LD_LIBRARY_PATH="$(dirname "$0")"/c "$(dirname "$0")"/node_modules/.bin/ya-igcc -Pc -I"$(dirname "$0")"/c -Pc -L"$(dirname "$0")"/c -Pc -llang -e ':include lang.h' -e ':include assert.h' -e ':include string.h' -e ':include stdlib.h' -e 'lang_state *L = lang_state_new_orNULL();' -i true "$@"
