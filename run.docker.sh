#!/bin/sh
set -e
img_name=the-language-builder
docker build -t "$img_name" .
exec docker run --rm -it -v "$(pwd):$(pwd)" "$img_name" /bin/sh -c "
  groupadd -g '$(id -g)' '$(id -ng)'&&
  mkdir -p '$HOME'&&
  cp -Tr /etc/skel '$HOME'&&
  chown -R '$(id -u):$(id -g)' '$HOME'&&
  useradd -MN -d '$HOME' -g '$(id -g)' -u '$(id -u)' '$(id -nu)'&&
  echo '$(id -nu) ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers&&
  cd '$(pwd)'&&
  su '$(id -nu)'
"
