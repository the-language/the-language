#!/bin/sh
cd "$(dirname $0)"
git add .;git diff --cached;./node.test.sh
