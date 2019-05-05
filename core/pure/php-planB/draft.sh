#!/bin/sh
yarn
npx tsc
cat lang.js | sed 's|^.*__esModule.*$||'| sed 's|^exports.*$||' | sed 's| function  *\([^ (][^ (]*\)| var \1 = function|g' | npx js2php /dev/stdin > lang.php
