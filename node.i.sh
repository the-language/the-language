#!/bin/sh
cd "$(dirname $0)"
node -e "$(cat lang.js)" -i # --stack-size=999
