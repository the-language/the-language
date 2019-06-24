#!/bin/sh
oldpwd="$(pwd)"
cd "$(dirname "$0")" ||exit
bin="$(pwd)"
[ -f  c/lua-5.1.5/src/lua ] || make c/lua-5.1.5/src/lua ||exit
make lua/lang.lua ||exit
cd "$oldpwd" ||exit
LUA_PATH="$bin/lua/?.lua;$bin/?.lua" "$bin/c/lua-5.1.5/src/lua" -l repl_lua_r "$@"
