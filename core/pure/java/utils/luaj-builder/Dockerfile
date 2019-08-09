FROM alpine:3.10
RUN apk add --no-cache openjdk8 apache-ant
ARG UID
ARG GID
USER $UID:$GID
WORKDIR /src
