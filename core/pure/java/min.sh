#!/bin/sh

# 暫時不能正常工作。

set -e

make dep-proguard
make dep-rt.jar
make dep-Krakatau

cd src
jar cf lang.jar $(find -name '*.class')
../dep-proguard/bin/proguard.sh -target 6 -ignorewarnings -libraryjars ../dep-rt.jar -injars lang.jar -outjars lang.min.jar -keep class lang.Lang -keep class lang.LangValue
rm lang.jar
python2 -OO ../dep-Krakatau/decompile.py -nauto -path "../dep-rt.jar" -out ../src.2 lang.min.jar
rm lang.min.jar

