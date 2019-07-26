#!/bin/sh
set -e
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make ecmascript/lang.min.2.js
cd "$oldpwd"
node -r "$bin"/repl.js.r.js "$@"
