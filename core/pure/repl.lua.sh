#!/bin/sh
LUA_PATH="$(dirname "$0")/lua/?.lua" "$(dirname "$0")/c/lua-5.1.5/src/lua" -e "TheLanguage=require('lang') L=TheLanguage for k,v in pairs(L) do _G[k]=v end" -i
