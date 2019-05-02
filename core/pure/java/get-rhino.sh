#!/bin/sh
mkdir -p rhino
cd rhino ||exit
rm -fr *.tmp
[ -f rhino-1.7.9.jar ] || (wget -O rhino-1.7.9.jar.tmp https://github.com/mozilla/rhino/releases/download/Rhino1_7_9_Release/rhino-1.7.9.jar && mv rhino-1.7.9.jar.tmp rhino-1.7.9.jar)
cd ..
