#!/bin/bash
[ -d luaj ] || git clone --depth 1 https://github.com/zaoqi/luaj.git
cd luaj
[ -f luaj-jse-3.0.2.jar ] || ant
cd -

[ -d Krakatau ] || git clone --depth 1 https://github.com/Storyyeller/Krakatau.git

[ -d luaj-out ] && rm -fr luaj-out
mkdir luaj-out
cp ../lua/lang.lua 'lang$luaj.lua'
java -cp "luaj/luaj-jse-3.0.2.jar:luaj/lib/bcel-5.2.jar" luajc -s . -d luaj-out 'lang$luaj.lua'
rm 'lang$luaj.lua'

cd luaj-out
jar cf lang.jar *
cd -

rm -fr src
mkdir src
python ./Krakatau/decompile.py -path "/usr/lib/jvm/default-java/jre/lib/rt.jar;./luaj/luaj-jse-3.0.2.jar" -out ./src/ luaj-out/lang.jar
cp -r ./luaj/build/jse/src/* ./src/
