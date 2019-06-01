#!/bin/sh
[ -f "$(dirname "$0")"/node_modules/.bin/igcc ] || yarn
echo '請輸入#include <lang.h>'
LD_LIBRARY_PATH="$(dirname "$0")"/c "$(dirname "$0")"/node_modules/.bin/igcc -I "$(dirname "$0")"/c -L "$(dirname "$0")"/c -llang
