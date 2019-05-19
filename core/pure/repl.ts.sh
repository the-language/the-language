#!/bin/sh
"$(dirname "$0")"/typescript/node_modules/.bin/ts-node -T -r "$(dirname "$0")"/repl.ts.r.ts "$@"
