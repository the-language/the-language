#!/bin/sh
set -e
img_name=the-language-builder
docker build -t "$img_name" .
exec docker run --rm -it -v "$(pwd):$(pwd)" "$img_name" /bin/sh -c "groupadd -g '$(id -g)' '$(id -ng)'&&useradd -MN -g '$(id -g)' -u '$(id -u)' '$(id -nu)'&&echo '$(id -nu) ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers&&mkdir -p '$HOME'&&chown -R '$(id -u):$(id -g)' '$HOME'&&cd '$(pwd)'&&su '$(id -nu)'"
