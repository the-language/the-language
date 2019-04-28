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
for f in stddef.h stdio.h stdarg.h limits.h unistd.h assert.h stdlib.h string.h errno.h setjmp.h # io.h readline/readline.h readline/history.h ctype.h locale.h # ctype.h math.h
do
  echo "#include <$f>" > "./src.cpp/$f"
done
for f in io.h readline/readline.h readline/history.h locale.h
do
  > "./src.cpp/$f"
done
for f in ./src.cpp/*.h ;do
  mv "$f" "$f.1"
  echo '#pragma once' > "$f"
  cat "$f.1" >> "$f"
  rm "$f.1"
done
f=all.c
npx codingame-merge -w src.cpp/ -o "$f"
rm -fr src.cpp
sed -i 's|^#if defined(LUA_CORE)$|#if 1|g' "$f" # luai_num* macros
sed -i 's|^#ifdef __cplusplus$|#if 0|g' "$f" # extern "C" { ... } # 除了lang.h
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
mv "$f" lang.c
