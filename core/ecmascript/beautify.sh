#!/bin/sh
. init-path.sh

for f in *.js *.ts *.json
do
    # method 1
    # beautify -f js "$f" > "$f.tmp"
    # mv "$f.tmp" "$f"
    
    # method 2
    js-beautify -r "$f"
    echo >> "$f"
done
