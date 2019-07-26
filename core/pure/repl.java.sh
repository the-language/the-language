#!/bin/sh
set -e
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make java/src
cd "$oldpwd"
CLASSPATH="$bin/java/src" jshell "$bin/repl_java_r.java" "$@"
