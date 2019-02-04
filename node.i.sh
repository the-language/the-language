#!/bin/sh
cd "$(dirname $0)"
node -e "$(cat lang.js)$(cat makecode.js)" -i # --stack-size=999
