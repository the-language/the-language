#!/bin/sh
npx tstl -p tsconfig.json
sed -i 's|local exports = exports or {};|local exports = {};|' lang.lua
