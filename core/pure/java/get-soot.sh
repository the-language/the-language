#!/bin/sh
rm -fr soot-3.3.0.jar.tmp
[ -f soot-3.3.0.jar ] || (wget -O soot-3.3.0.jar.tmp https://soot-build.cs.uni-paderborn.de/public/origin/master/soot/soot-master/3.3.0/build/sootclasses-trunk-jar-with-dependencies.jar && mv soot-3.3.0.jar.tmp soot-3.3.0.jar)
