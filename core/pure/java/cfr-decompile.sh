#!/bin/sh

CFR=cfr-0.144
./get-$CFR.sh

java -jar $CFR.jar --outputdir luaj-out/cfr-out luaj-out/*.class
