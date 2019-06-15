#!/bin/sh
oldpwd="$(pwd)"
cd "$(dirname "$0")" ||exit
bin="$(pwd)"
make typescript/lang.ts ||exit
cd typescript ||exit
[ -f node_modules/.bin/ts-node ] || npm install ||exit
cd "$oldpwd" ||exit
"$bin"/typescript/node_modules/.bin/ts-node -T -r "$bin"/repl.ts.r.ts "$@"
