#!/bin/sh
pi="$(mktemp)"
err(){
  rm -f "$pi"
  exit 1
}
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make php/lang.php || err
cd "$oldpwd" || err
echo '[PHP]' > "$pi" || err
echo "include_path=.:$bin:" >> "$pi" || err
echo 'auto_prepend_file=repl_php_r.php' >> "$pi" || err
php -c "$pi" "$@"
s="$?"
rm "$pi"
exit "$s"
