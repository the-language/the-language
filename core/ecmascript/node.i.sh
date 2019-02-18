#!/bin/sh
cd "$(dirname $0)"
npx node -e "let TheLanguage=require('./lang.js');$(cat makecode.js)" -i
