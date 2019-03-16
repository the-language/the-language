#!/bin/bash
[ -d luaj ] || git clone --depth 1 https://github.com/zaoqi/luaj.git
cd luaj
[ -f luaj-jse-3.0.2.jar ] || ant
cd -

[ -d Krakatau ] || git clone --depth 1 https://github.com/Storyyeller/Krakatau.git

[ -d luaj-out ] && rm -fr luaj-out
mkdir luaj-out
java -cp "luaj/luaj-jse-3.0.2.jar:luaj/lib/bcel-5.2.jar" luajc -s ../lua/ -d luaj-out lang.lua

cd luaj-out
jar cf lang.jar *
cd -

rm -fr Krakatau-out
mkdir Krakatau-out
python ./Krakatau/decompile.py -path "/usr/lib/jvm/default-java/jre/lib/rt.jar;./luaj/luaj-jse-3.0.2.jar" -out ./Krakatau-out/ luaj-out/lang.jar
