#!/bin/sh
tsc --allowJs --outFile lang.js lang.ts
# new="$(google-closure-compiler -W QUIET --language_out ECMASCRIPT3 --js lang.js 2>/dev/null)"
# echo "$new" > lang.js
