#!/bin/sh
set -e
# 该脚本至少在https://github.com/luaj/luaj/commit/6d2deb4cb6e951b5818c2966850777e9049c8330工作。
[ -d luaj ] || git clone --depth 1 http://github.com/luaj/luaj.git
cd luaj
git checkout HEAD .
git pull
curl -L https://github.com/luaj/luaj/pull/46.patch | git apply
cd ..
docker build -t luaj-builder --build-arg UID="$(id -u)" --build-arg GID="$(id -g)" .
docker run -it --rm -v "$(pwd)/luaj:/src" luaj-builder ant
rm -fr dep-luaj luaj.tgz
mkdir -p dep-luaj/lib/ dep-luaj/build/jse/
cp -r luaj/build/jse/src/ dep-luaj/build/jse/
cp luaj/lib/bcel-5.2.jar dep-luaj/lib/
cp luaj/luaj-jse-3.0.2.jar dep-luaj/
tar -czvf luaj.tgz -C dep-luaj .
