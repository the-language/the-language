#!/bin/sh
pi="$(mktemp)"
echo '[PHP]' > "$pi"
echo "include_path=.:$(dirname "$0"):" >> "$pi"
echo 'auto_prepend_file=repl_php_r.php' >> "$pi"
php -c "$pi" "$@"
rm "$pi"
