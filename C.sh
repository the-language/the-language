#!/bin/bash
cd "$(dirname $0)"
f=$(mktemp)
./node.test.sh 2>&1 | cat > $f &
git add .;git diff --cached
echo
echo
echo "---[TEST]---"
wait
cat $f
rm $f
