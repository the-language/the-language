#!/bin/sh
mkdir -p janino
cd janino ||exit
rm -fr *.tmp
[ -f commons-compiler-3.0.12.jar ] || (wget -O commons-compiler-3.0.12.jar.tmp http://repo1.maven.org/maven2/org/codehaus/janino/commons-compiler/3.0.12/commons-compiler-3.0.12.jar && mv commons-compiler-3.0.12.jar.tmp commons-compiler-3.0.12.jar)
[ -f janino-3.0.12.jar ] || (wget -O janino-3.0.12.jar.tmp http://repo1.maven.org/maven2/org/codehaus/janino/janino/3.0.12/janino-3.0.12.jar && mv janino-3.0.12.jar.tmp janino-3.0.12.jar)
cd ..
