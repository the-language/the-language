#!/bin/bash

set -e

# pypy好像更慢
py2(){
  #if type pypy > /dev/null ;then
    #pypy "$@"
  #else
    python2 "$@"
  #fi
}

make dep-luaj
LUAJ=./dep-luaj

mkdir -p luaj-out
rm -fr luaj-out
mkdir luaj-out
cp ../lua/lang.lua 'Lang$luaj.lua'
java -cp "$LUAJ/luaj-jse-3.0.2.jar:$LUAJ/lib/bcel-5.2.jar" luajc -s . -d luaj-out 'Lang$luaj.lua'
rm 'Lang$luaj.lua'

cd luaj-out
jar cf lang.jar *
cd -

rm -fr src
make dep-rt.jar
make dep-Krakatau
py2 -OO ./dep-Krakatau/decompile.py -nauto -path "./dep-rt.jar;./$LUAJ/luaj-jse-3.0.2.jar" -out ./src/lang/ luaj-out/lang.jar
for f in ./src/lang/*.java ;do
  cp "$f" "$f".1
  echo 'package lang;' > "$f"
  cat "$f".1 >> "$f"

  cat "$f" | sed 's|^ *org.luaj.vm2.LuaValue dummy[0-9]* = org.luaj.vm2.LuaValue.NIL;$||' | sed 's|^ *org.luaj.vm2.LuaValue dummy[0-9]* = k[0-9]*;$||' > "$f".1
  cat "$f".1 > "$f"

  rm "$f".1
done
cp -r "./$LUAJ/build/jse/src/"* ./src/
cp -r ./real-src/* ./src/

cd src
javac --release 6 ./lang/Lang.java
cd -

for f in $(find src -name '*.java') ;do
  name="${f%.java}"
  if [ ! -f "$name.class" ] ;then
    rm -fv "$f"
  fi
done
rm -fvr src/META-INF
