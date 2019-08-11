FROM alpine:edge
ARG UID=0
ARG GID=0
ARG WORKDIR=/
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache \
    yarn nodejs npm \
    clang binutils gcc libc-dev \
    racket openjdk11 php7 python2 \
    make curl git bash && \
  ln -s /usr/lib/jvm/java-11-openjdk/bin/* /usr/local/bin/ \
  apk del alpine-keys apk-tools && \
  rm -fr /etc/apk
RUN raco pkg install --binary-lib --no-cache --batch --installation --deps force racket-doc ; \
  raco pkg install --binary-lib --no-cache --batch --installation --deps force scribble-doc ; \
  raco pkg install --binary-lib --no-cache --batch --installation --auto scribble-lib && \
  raco pkg install --binary-lib --no-cache --batch --installation --auto make && \
  raco pkg install --no-cache --batch --installation --auto rash
USER "$UID:$GID"
WORKDIR "$WORKDIR"
