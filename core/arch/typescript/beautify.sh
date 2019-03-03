#!/bin/sh
for f in *.js *.ts *.json
do
    # method 1
    # npx beautify -f js "$f" > "$f.tmp"
    # mv "$f.tmp" "$f"
    
    # method 2
    # npx js-beautify -r "$f"
    # echo >> "$f"
    :
done

# method 3
npx js-beautify -r *.js *.ts *.json
for f in *.js *.ts *.json
do
    echo >> $f
done
