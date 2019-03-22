#!/bin/sh
# gcc
# readline
[ -d lua-aot ] || git clone --depth 1 https://github.com/hugomg/lua-aot.git

cd lua-aot
make
cd ..

./lua-aot/src/luaot ../lua/lang.lua -o ./lang.c
cc -Wall -Wextra -pedantic -fPIC -save-temps=obj -O2 -Wno-unused-label -g -I./lua-aot/src -shared ./lang.c -o ./lang.so
rm ./lang.i
