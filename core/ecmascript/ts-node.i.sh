#!/bin/sh
cd "$(dirname $0)"
. ./init-path.sh
echo "[TIP] const L=require('./lang.ts')"
ts-node -C ~/.config/yarn/global/node_modules/typescript/
