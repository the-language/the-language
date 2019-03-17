#!/bin/bash
[ -d luaj ] || git clone --depth 1 https://github.com/luaj/luaj.git
cd luaj
[ -f luaj-jse-3.0.2.jar ] || ant
cd -

[ -d Krakatau ] || git clone --depth 1 https://github.com/Storyyeller/Krakatau.git

mkdir -p luaj-out
rm -fr luaj-out
mkdir luaj-out
cp ../lua/lang.lua 'lang_luaj.lua'
java -cp "luaj/luaj-jse-3.0.2.jar:luaj/lib/bcel-5.2.jar" luajc -s . -d luaj-out 'lang_luaj.lua'
rm 'lang_luaj.lua'

cd luaj-out
jar cf lang.jar *
cd -

rm -fr src
python ./Krakatau/decompile.py -path "/usr/lib/jvm/default-java/jre/lib/rt.jar;./luaj/luaj-jse-3.0.2.jar" -out ./src/lang/ luaj-out/lang.jar
for f in ./src/lang/*.java ;do
  cp "$f" "$f".1
  echo 'package lang;' > "$f"
  cat "$f".1 >> "$f"
  rm "$f".1
done
cp -r ./luaj/build/jse/src/* ./src/
cp -r ./real-src/* ./src/

cd src
javac ./lang/Lang.java
javac testmain.java
cd -
