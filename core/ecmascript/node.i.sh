#!/bin/sh
cd "$(dirname $0)"
. ./init-path.sh
node -e "let TheLanguage=require('./lang.js');$(cat makecode.js)" -i
