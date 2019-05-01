all: typescript/.done.racket.code.generator ecmascript/lang.js lua/lang.lua ecmascript6/lang.js java/src c/lang.h c/lang.c go/src
	racket Makefile.domake.rkt all

ecmascript/exports.list: typescript/.done.racket.code.generator ecmascript/lang.js
	racket Makefile.domake.rkt ecmascript/exports.list

ecmascript/lang.js: typescript/.done.racket.code.generator typescript/lang.ts
	racket Makefile.domake.rkt ecmascript/lang.js

lua/lang.lua: typescript/.done.racket.code.generator typescript/lang.ts
	racket Makefile.domake.rkt lua/lang.lua

ecmascript6/lang.js: typescript/.done.racket.code.generator typescript/lang.ts
	racket Makefile.domake.rkt ecmascript6/lang.js

java/src: typescript/.done.racket.code.generator java/src/lang/Lang.java
	racket Makefile.domake.rkt java/src

java/src/lang/Lang.java: typescript/.done.racket.code.generator lua/lang.lua java/real-src/lang/Lang.java java/real-src/lang/LangValue.java
	racket Makefile.domake.rkt java/src/lang/Lang.java

go/src: typescript/.done.racket.code.generator lua/lang.lua
	racket Makefile.domake.rkt go/src

c/lua-5.1.5: typescript/.done.racket.code.generator
	racket Makefile.domake.rkt c/lua-5.1.5

c/lua-5.1.5/src/lua: typescript/.done.racket.code.generator c/lua-5.1.5
	racket Makefile.domake.rkt c/lua-5.1.5/src/lua

c/lua2c: typescript/.done.racket.code.generator c/lua2c-lib-lua2c-ast2cast.lua
	racket Makefile.domake.rkt c/lua2c

c/lang.h: typescript/.done.racket.code.generator
	racket Makefile.domake.rkt c/lang.h

c/lang.c: typescript/.done.racket.code.generator c/lua-5.1.5 c/lua-5.1.5/src/lua c/lua2c lua/lang.lua c/patch/lang.tail.c c/lang.h c/testmain.c
	racket Makefile.domake.rkt c/lang.c

php/lang.php: typescript/.done.racket.code.generator typescript/lang.ts ecmascript/exports.list
	racket Makefile.domake.rkt php/lang.php

python3/lang.py: typescript/.done.racket.code.generator python2/lang.py
	racket Makefile.domake.rkt python3/lang.py

python2/lang.py: typescript/.done.racket.code.generator ecmascript/lang.js ecmascript/exports.list
	racket Makefile.domake.rkt python2/lang.py

typescript/.done.racket.code.generator: typescript/lang.ts
	racket Makefile.premake.rkt
