#!/bin/bash
d="$(mktemp -d)"
err(){
  rm -fr "$d"
  exit 1
}
oldpwd="$(pwd)"
cd "$(dirname "$0")" || err
bin="$(pwd)"
make java/src || err
f="$d/Main.java"
echo 'import lang.*;' > "$f" || err
echo 'public class Main {' >> "$f" || err
echo 'public static void main(String[] args) throws Exception {' >> "$f" || err
cat "$1" >> "$f" || err
echo '}}' >> "$f" || err
cd "$d" || err
export CLASSPATH="$bin/java/src:$d"
javac Main.java || err
cd "$oldpwd" || err
java Main
s="$?"
rm -fr "$d"
exit "$s"
