FROM archlinux/base
ARG MIRROR='https://mirror.rackspace.com/archlinux/$repo/os/$arch'
ARG UID=0
ARG GID=0
ARG WORKDIR=/
RUN echo "Server = $MIRROR" > /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm yarn nodejs npm dos2unix racket jdk11-openjdk clang make curl git python2 php bash busybox && pacman -Scc --noconfirm && busybox --install -s
RUN archlinux-java set java-11-openjdk
RUN raco pkg install --no-cache --batch --installation --auto rash
USER "$UID:$GID"
WORKDIR "$WORKDIR"
