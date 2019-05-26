#!/bin/sh
CLASSPATH="$(dirname "$0")/java/src" jshell repl_java_r.java "$@"
