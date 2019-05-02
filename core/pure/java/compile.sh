#!/bin/bash

[ -d luaj ] || tar -xJvf luaj.tar.xz

[ -d Krakatau ] || git clone --depth 1 https://github.com/Storyyeller/Krakatau.git ||exit

mkdir -p luaj-out
rm -fr luaj-out
mkdir luaj-out
cp ../lua/lang.lua 'Lang$luaj.lua'
java -cp "luaj/luaj-jse-3.0.2.jar:luaj/lib/bcel-5.2.jar" luajc -s . -d luaj-out 'Lang$luaj.lua' ||exit
rm 'Lang$luaj.lua'

cd luaj-out ||exit
jar cf lang.jar *
cd -

rm -fr src
python2 -OO ./Krakatau/decompile.py -nauto -path "$(echo /usr/lib/jvm/*/jre/lib/rt.jar | awk '{print $1}');./luaj/luaj-jse-3.0.2.jar" -out ./src/lang/ luaj-out/lang.jar
for f in ./src/lang/*.java ;do
  cp "$f" "$f".1
  echo 'package lang;' > "$f"
  cat "$f".1 >> "$f"
  rm "$f".1
done
cp -r ./luaj/build/jse/src/* ./src/
cp -r ./real-src/* ./src/

cd src ||exit
javac ./lang/Lang.java
javac testmain.java
cd -

for f in $(find src -name '*.java') ;do
  name="${f%.java}"
  if [ ! -f "$name.class" ] ;then
    rm -fv "$f"
  fi
done
rm -fvr src/META-INF
