#!/bin/bash
cd "$(dirname $0)"
f=$(mktemp)
for tmp in ./lang.js ./lang.full.js ./lang.externs.js ./lang.pretty-print.js ; do
    rm $tmp 2>/dev/null
done
# ./beautify.sh 用編輯器代替
./compile.sh || exit
./test.sh 2>&1 | cat > $f &
echo press enter to continue
read
git add .;git diff --cached
echo
echo
printer=$(mktemp)
fstr="\"$f\""
cat > $printer << EOF
let fs=require('fs')
let current=0
let linecache=""
function main(){
    fs.readFile($fstr, 'utf8', function(err, data){
        if(err){return main()}
        const str = data.toString()
        for(let i = current;i < str.length;i++){
            const c = str[i]
            if(c === '\n'){
	        console.log(linecache)
	        linecache = ''
	    } else {
	        linecache += c
	    }
        }
        current = str.length
        setTimeout(main, 100)
    })
}
main()
EOF
node $printer&
echo "---[TEST]---"
sleep 1s
wait %1
echo >> $f
sleep 0.2s
kill -kill %2
wait %2
rm $f $printer