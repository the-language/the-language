all: tmp-pass2.js

node_modules: yarn.lock
	yarn

tmp-pass1.js: ../ecmascript/lang.js
	npx dumbjs < ../ecmascript/lang.js > tmp-pass1.js

tmp-pass2.js: tmp-pass1.js
	sed "s/var \([^ ]*\) = function/function \1/g" tmp-pass1.js|sed "/function main/d"|head -n -1 > tmp-pass2.js
