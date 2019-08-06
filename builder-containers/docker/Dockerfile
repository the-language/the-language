FROM archlinux/base
ARG MIRROR='https://mirror.rackspace.com/archlinux/$repo/os/$arch'
RUN echo "Server = $MIRROR" > /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm yarn nodejs npm dos2unix racket jdk11-openjdk clang make curl git python2 gawk php base
RUN archlinux-java set java-11-openjdk
RUN raco pkg install --batch --installation --auto rash

RUN pacman -Sy --noconfirm sudo
