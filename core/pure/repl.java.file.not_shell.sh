#!/bin/bash
oldpwd="$(pwd)"
cd "$(dirname "$0")" ||exit
bin="$(pwd)"
make java/src ||exit
d="$(mktemp -d)"
f="$d/Main.java"
echo 'import lang.*;' > "$f"
echo 'public class Main {' >> "$f"
echo 'public static void main(String[] args) throws Exception {' >> "$f"
cat "$1" >> "$f"
echo '}}' >> "$f"
cd "$d" ||exit
export CLASSPATH="$bin/java/src:$d"
javac Main.java ||exit
cd "$oldpwd" ||exit
java Main ||exit
s="$?"
rm "$d"
exit "$s"
