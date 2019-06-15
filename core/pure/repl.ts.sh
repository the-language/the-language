#!/bin/sh
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make typescript/lang.ts ||exit
cd "$oldpwd"
"$bin"/typescript/node_modules/.bin/ts-node -T -r "$bin"/repl.ts.r.ts "$@"
