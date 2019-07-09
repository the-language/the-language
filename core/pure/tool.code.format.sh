#!/bin/sh
cd typescript
yarn
proc_ts(){
    local tmpfile="$(mktemp)"
    npx tsfmt "$1" | dos2unix > "$tmpfile" ||exit
    mv "$tmpfile" "$1"
}
for f in lang.ts.d/*.ts; do
    proc_ts "$f" &
done
wait
