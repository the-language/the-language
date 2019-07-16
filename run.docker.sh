#!/bin/sh
set -e
if [ "$(id -u)" = 0 ]; then
    echo 'cannot run as root' >&2
    exit 1
fi
cd "$(dirname "$0")"
img_name=the-language-builder
docker build -t "$img_name" .
mkdir -p "$HOME/.cache/yarn"
exec docker run --rm -it -v "$HOME/.cache/yarn:$HOME/.cache/yarn" -v "$(pwd):$(pwd)" "$img_name" /bin/sh -c "
  groupadd -g '$(id -g)' '$(id -ng)'&&
  mkdir -p '$HOME'&&
  cp -Tr /etc/skel '$HOME'&&
  chown -R '$(id -u):$(id -g)' '$HOME'&&
  useradd -MN -d '$HOME' -g '$(id -g)' -u '$(id -u)' '$(id -nu)'&&
  echo '$(id -nu) ALL=(ALL) NOPASSWD: ALL'>>/etc/sudoers&&
  cd '$(pwd)'&&
  su '$(id -nu)'
"
