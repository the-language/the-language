#!/bin/sh
CLASSPATH="$(dirname "$0")/java/src" jshell "$(dirname "$0")/repl_java_r.java" "$@"
