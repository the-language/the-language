#!/bin/sh
yarn
npx tsc
cat lang.js | sed 's|^.*__esModule.*$||'| sed 's|^exports.*$||' | sed 's| function  *\([^ (][^ (]*\)| var \1 = function|g' | npx js2php /dev/stdin > lang.php1
echo '<?php' > lang.php2
cat lang.php1 | grep '^function' | sed 's|^function  *\([^( ]*\).*$|$\1=function(...$xs){return call_user_func_array(\1,$xs);};|' >> lang.php2
cat lang.php1 | sed '1d' >> lang.php2
mv lang.php2 lang.php1
mv lang.php1 lang.php
