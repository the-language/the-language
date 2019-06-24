#!/bin/sh
oldpwd="$(pwd)"
cd "$(dirname "$0")" ||exit
bin="$(pwd)"
make php/lang.php ||exit
cd "$oldpwd" ||exit
pi="$(mktemp)"
echo '[PHP]' > "$pi"
echo "include_path=.:$bin:" >> "$pi"
echo 'auto_prepend_file=repl_php_r.php' >> "$pi"
php -c "$pi" "$@"
rm "$pi"
