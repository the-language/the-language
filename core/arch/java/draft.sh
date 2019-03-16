#!/bin/bash
[ -d luaj ] || git clone --depth 1 https://github.com/zaoqi/luaj.git
cd luaj
[ -f luaj-jse-3.0.2.jar ] || ant
cd -

[ -d jd-core-java ] || git clone --depth 1 https://github.com/nviennot/jd-core-java.git
cd jd-core-java
[ -f build/libs/jd-core-java-1.2.jar ] || ./gradlew assemble
cd -

[ -d luaj-out ] && rm -fr luaj-out
mkdir luaj-out
java -cp "luaj/luaj-jse-3.0.2.jar:luaj/lib/bcel-5.2.jar" luajc -s ../lua/ -d luaj-out lang.lua

pushd luaj-out
  mkdir jar
  pushd jar
    cp ../*.class ./
    jar cf ../out.jar *
  popd
  mkdir jd-out
  java -jar ../jd-core-java/build/libs/jd-core-java-1.2.jar out.jar jd-out
popd
