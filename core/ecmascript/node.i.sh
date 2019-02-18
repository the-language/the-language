#!/bin/sh
cd "$(dirname $0)"
node -e "let TheLanguage=require('./lang.js');$(cat makecode.js)" -i
