#!/bin/sh

./get-ant.sh

[ -d luaj ] || git clone --depth 1 https://github.com/luaj/luaj.git ||exit
cd luaj
[ -f luaj-jse-3.0.2.jar ] || ../ant/bin/ant ||exit
cd -
