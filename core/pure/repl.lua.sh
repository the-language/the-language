#!/bin/sh
LUA_PATH="$(dirname "$0")/lua/?.lua;$(dirname "$0")/?.lua" "$(dirname "$0")/c/lua-5.1.5/src/lua" -l repl_lua_r "$@"
