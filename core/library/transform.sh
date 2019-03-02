#!/bin/bash
transform_helper(){
    if [ $# -gt 0 ]
    then
        local x="$1"
        shift
        sed "s$(echo -e '\0001')\*($x)$(echo -e '\0001')$(cat $x)$(echo -e '\0001')g" | transform_helper "$@"
    else
        cat
    fi
}
transform(){
    echo "$1" | transform_helper *
}
mkdir -p transformed
cd src
for f in *
do
    transform "$(cat $f)" > ../transformed/$f
done

cd ../transformed
prog=$(cat << "EOF"
const L = require('the-language')
const fs = require('fs')
for(const file of fs.readdirSync('.')) {
    fs.readFile(file, 'utf8', (err, data) => {
        if (err) throw err;
        fs.writeFile(file, L.simple_print(L.complex_parse(data)) + '\n', (err) => {
            if (err) throw err;
        })
    })
}
EOF
)
node -e "$prog"
