#!/bin/bash
d="$(mktemp -d)"
f="$d/Main.java"

echo 'import lang.*;' > "$f"
echo 'public class Main {' >> "$f"
echo 'public static void main(String[] args) throws Exception {' >> "$f"
cat "$1" >> "$f"
echo '}}' >> "$f"

pushd "$(dirname "$0")/java/src"
java_src="$(pwd)"
popd

pushd "$d"
export CLASSPATH="$java_src:."
javac Main.java ||exit
java Main ||exit
popd
