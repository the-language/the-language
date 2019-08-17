#!/bin/sh
set -e
luaj=dep-lua2c53-87fe550108ca19f99a6d38e4575c6f7f3b91f685
rm -fr src
mkdir src
echo '#define main(...) _lua2c_main(__VA_ARGS__)
' > src/lang.c.tmp
cat ./real-src/lang.head.c >> src/lang.c.tmp
LUA_PATH=./"$luaj"/lib/?.lua luajit ./"$luaj"/lua2c.lua ../lua/lang.lua |
 sed '/^#include /d' |
 cat >> src/lang.c.tmp
lua_head="lapi.h lauxlib.h lcode.h lctype.h ldebug.h ldo.h lfunc.h lgc.h llex.h
  llimits.h lmem.h lobject.h lopcodes.h lparser.h lprefix.h lstate.h
  lstring.h ltable.h ltm.h lua.h luaconf.h lualib.h lundump.h lvm.h lzio.h"
lua_core="lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c
  lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c
  ltm.c lundump.c lvm.c lzio.c"
lua_lib="lauxlib.c lbaselib.c lbitlib.c lcorolib.c ldblib.c liolib.c
  lmathlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c loadlib.c linit.c"
for f in $lua_head $lua_core $lua_lib ;do
  cp ./dep-lua-5.3.5/src/"$f" ./src/
done

cat src/lang.c.tmp | clang -I ./src/ -xc -E - | sed '/^#/d' | clang-format | sed '/^$/d' > src/lang.c.tmp.2

cp ./real-src/lang.h ./src/
echo '#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
#include "lang.h"
' > src/lang.c
cat src/lang.c.tmp.2 >> src/lang.c
