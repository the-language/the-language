#!/bin/sh
cd "$(dirname $0)"
nodejs -e "$(cat lang.js)" -i||node -e "$(cat lang.js)" -i
