#!/bin/sh
oldpwd="$(pwd)"
cd "$(dirname "$0")" ||exit
bin="$(pwd)"
make java/src ||exit
cd "$oldpwd" ||exit
CLASSPATH="$bin/java/src" jshell "$bin/repl_java_r.java" "$@"
