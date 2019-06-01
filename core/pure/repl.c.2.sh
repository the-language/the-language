#!/bin/sh
[ -f "$(dirname "$0")"/node_modules/.bin/ya-igcc ] || yarn
LD_LIBRARY_PATH="$(dirname "$0")"/c "$(dirname "$0")"/node_modules/.bin/ya-igcc -Pc -I"$(dirname "$0")"/c -Pc -L"$(dirname "$0")"/c -Pc -llang -e ':include lang.h' "$@"
