#!/bin/bash
set -e
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make java/src
d="$(mktemp -d)"
f="$d/Main.java"
echo 'import lang.*;' > "$f"
echo 'public class Main {' >> "$f"
echo 'public static void main(String[] args) throws Exception {' >> "$f"
cat "$1" >> "$f"
echo '}}' >> "$f"
cd "$d"
export CLASSPATH="$bin/java/src:$d"
javac Main.java
cd "$oldpwd"
java Main
s="$?"
rm -fr "$d"
exit "$s"
