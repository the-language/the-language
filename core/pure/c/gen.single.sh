#!/bin/sh
yarn
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
notignore_h="stddef.h stdio.h stdarg.h limits.h stdlib.h string.h setjmp.h"
ignore_h="assert.h io.h unistd.h readline/readline.h readline/history.h locale.h errno.h"
for f in $notignore_h $ignore_h
do
  echo '#pragma once' > "./src.cpp/$f"
done
echo '#pragma once' > "./src.cpp/lang.h"
for f in ./src.cpp/*.h ;do
  mv "$f" "$f.1"
  echo '#pragma once' > "$f"
  cat "$f.1" >> "$f"
  rm "$f.1"
done
f=lang.c.tmp
npx --no-install codingame-merge -w src.cpp/ -o "$f"
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
for h in $notignore_h
do
  echo "#include <$h>" >> lang.c
done
sed 's/^ *enum *{ *\([a-zA-Z_][a-zA-Z0-9_]*\) *= *\([0-9][0-9]*\) *}; *$/#define \1 \2/g' "$f" |
  clang -xc -E - |
  sed '/^#/d' |
  sed '/^$/d' |
  clang-format |
  sed '/^ *assert(.*); *$/d' |
  cat >> lang.c
rm "$f"
