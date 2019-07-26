#!/bin/sh
set -e
oldpwd="$(pwd)"
cd "$(dirname "$0")"
bin="$(pwd)"
make php/lang.php
cd "$oldpwd"
pi="$(mktemp)"
echo '[PHP]' > "$pi"
echo "include_path=.:$bin:" >> "$pi"
echo 'auto_prepend_file=repl_php_r.php' >> "$pi"
php -c "$pi" "$@"
rm "$pi"
