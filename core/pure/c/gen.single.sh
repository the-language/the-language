#!/bin/sh
npm install
mkdir -p src.cpp
rm -fr src.cpp
mkdir src.cpp
cp ./src/* ./src.cpp/
for f in ./src.cpp/*.c ;do
  mv "$f" "${f}pp"
done
for f in ./src.cpp/*.h ;do
  cp "$f" "$f.1"
  echo '#pragma once' > "$f"
  cat "$f.1" >> "$f"
  rm "$f.1"
done
cp ./patch/math.h ./patch/ctype.h ./src.cpp
for f in ./src.cpp/* ;do
  sed -i 's|^#include <\(.*\)>$|^#include "\1"|' "$f"
done
mkdir ./src.cpp/readline
for f in stddef.h stdio.h stdarg.h limits.h assert.h stdlib.h string.h setjmp.h
do
  echo "#include <$f>" > "./src.cpp/$f"
done
for f in io.h unistd.h readline/readline.h readline/history.h locale.h errno.h
do
  > "./src.cpp/$f"
done
> "./src.cpp/lang.h"
for f in ./src.cpp/*.h ;do
  mv "$f" "$f.1"
  echo '#pragma once' > "$f"
  cat "$f.1" >> "$f"
  rm "$f.1"
done
f=lang.c.tmp
npx codingame-merge -w src.cpp/ -o "$f"
rm -fr src.cpp
sed -i 's|^#if defined(LUA_CORE)$|#if 1|g' "$f" # luai_num* macros
sed -i 's|^#if defined(LUA_USE_READLINE)$|#if 0|g' "$f"
for x in LUA_API LUAI_FUNC ;do
  sed -i "s|^#define[  ]$x[	 ].*\$|#define $x static inline|g" "$f"
done
for x in LUAI_DATA ;do
  sed -i "s|^#define[  ]$x[	 ].*\$|#define $x /* empty */|g" "$f"
done
for x in lua_ident luaX_tokens luaO_nilobject_ luaP_opnames luaP_opmodes luaT_typenames ;do
  sed -i "s|^\([^=;]*const[^=;]*$x[^=;]*[=;].*\)$|static \1|g" "$f"
done
sed -i "s|^static inline |static |g" "$f"
sed -i "s|^static\(  *[a-zA-Z_][a-zA-Z0-9_]*[ \*][ \*]*[a-zA-Z_][\*a-zA-Z0-9_]* *(\)|static inline\1|g" "$f"
sed -i "s|^\([a-z][a-zA-Z0-9_]*[ \*][ \*]*[a-zA-Z_][\*a-zA-Z0-9_]* *([^;]*\)$|static inline \1|g" "$f"
echo '#include "lang.h"' > lang.c
cat "$f" >> lang.c
rm "$f"

