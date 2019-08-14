#!/bin/sh
set -e
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make lua/lang_min.lua
cd "$oldpwd"
LUA_PATH="$bin/lua/?.lua;$bin/?.lua" luajit -l repl_lua_r "$@"
