#!/bin/sh
set -e
if [ "$(id -u)" = 0 ]; then
    echo 'cannot run as root' >&2
    exit 1
fi
cd "$(dirname "$0")"
bin="$(pwd)"
cd ../../
src="$(pwd)"
cd "$bin"
img_name=zaoqi/the-language-builder
docker build \
  --build-arg USER="$(id -un)" --build-arg GROUP="$(id -gn)" \
  --build-arg UID="$(id -u)" --build-arg GID="$(id -g)" \
  --build-arg WORKDIR="$src" -t "$img_name" .
mkdir -p ../containers_cache/.cache
cd ../containers_cache
cache="$(pwd)"
cd "$bin"
exec docker run --rm -it -v "$cache/.cache:$HOME/.cache" -v "$src:$src" "$img_name" "$@"
