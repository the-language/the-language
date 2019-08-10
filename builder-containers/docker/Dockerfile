FROM archlinux/base
ARG MIRROR='https://mirror.rackspace.com/archlinux/$repo/os/$arch'
ARG UID=0
ARG GID=0
ARG WORKDIR=/
RUN echo "Server = $MIRROR" > /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm \
  yarn nodejs npm \
  racket-minimal jdk11-openjdk clang php python2 \
  make curl git bash dos2unix busybox && \
  pacman -Scc --noconfirm && \
  busybox --install -s && \
  archlinux-java set java-11-openjdk
RUN raco pkg install --binary-lib --no-cache --batch --installation --deps force racket-doc || true
RUN raco pkg install --binary-lib --no-cache --batch --installation --deps force scribble-doc || true
RUN raco pkg install --binary-lib --no-cache --batch --installation --auto scribble-lib
RUN raco pkg install --binary-lib --no-cache --batch --installation --auto make
RUN raco pkg install --no-cache --batch --installation --auto rash
USER "$UID:$GID"
WORKDIR "$WORKDIR"
