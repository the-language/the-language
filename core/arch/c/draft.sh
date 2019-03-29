#!/bin/sh
# gcc
# readline
[ -d lua-aot ] || git clone --depth 1 https://github.com/hugomg/lua-aot.git

cd lua-aot
make
cd ..

./lua-aot/src/luaot ../lua/lang.lua -o ./lang.c
clang -pedantic -fPIC -save-temps=obj -O3 -I./lua-aot/src -shared ./lang.c -o ./lang.so
sed -i 's|//.*||' lang.c

clang -O3 -I./lua-aot/src -o testmain testmain.c lang.c -L./lua-aot/src -llua -ldl -lm
