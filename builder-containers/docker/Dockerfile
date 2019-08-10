FROM alpine:edge
ARG UID=0
ARG GID=0
ARG WORKDIR=/
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache \
    yarn nodejs npm \
    racket openjdk11 clang libc-dev php7 python2 \
    make curl git bash && \
  apk del alpine-keys apk-tools && \
  rm -fr /etc/apk
RUN raco pkg install --binary-lib --no-cache --batch --installation --deps force racket-doc || true
RUN raco pkg install --binary-lib --no-cache --batch --installation --deps force scribble-doc || true
RUN raco pkg install --binary-lib --no-cache --batch --installation --auto scribble-lib
RUN raco pkg install --binary-lib --no-cache --batch --installation --auto make
RUN raco pkg install --no-cache --batch --installation --auto rash
USER "$UID:$GID"
WORKDIR "$WORKDIR"
