all: ecmascript/lang.js lua/lang.lua lua/lang.min.lua ecmascript6/lang.js php/lang.php java/src c/lang.h c/lang.c c/testmain c/lang.o c/liblang.a
	racket Makefile.domake.rkt all

ecmascript/exports.list: ecmascript/lang.js
	racket Makefile.domake.rkt ecmascript/exports.list

ecmascript/lang.js: typescript/lang.ts
	racket Makefile.domake.rkt ecmascript/lang.js

lua/lang.min.lua: lua/lang.lua
	racket Makefile.domake.rkt lua/lang.min.lua

lua/lang.lua: typescript/lang.ts
	racket Makefile.domake.rkt lua/lang.lua

ecmascript6/lang.js: typescript/lang.ts
	racket Makefile.domake.rkt ecmascript6/lang.js

java/src: lua/lang.lua java/real-src/lang/Lang.java java/real-src/lang/LangValue.java
	racket Makefile.domake.rkt java/src

c/lua-5.1.5:
	racket Makefile.domake.rkt c/lua-5.1.5

c/lua-5.1.5/src/lua: c/lua-5.1.5
	racket Makefile.domake.rkt c/lua-5.1.5/src/lua

c/lua2c: c/lua2c-lib-lua2c-ast2cast.lua
	racket Makefile.domake.rkt c/lua2c

c/lang.h:
	racket Makefile.domake.rkt c/lang.h

c/lang.c: c/lua-5.1.5 c/lua-5.1.5/src/lua c/lua2c lua/lang.min.lua c/patch/lang.tail.c c/lang.h
	racket Makefile.domake.rkt c/lang.c

c/lang.o: c/lang.c c/lang.h
	racket Makefile.domake.rkt c/lang.o

c/liblang.a: c/lang.o
	racket Makefile.domake.rkt c/liblang.a

c/testmain: c/liblang.a c/testmain.c
	racket Makefile.domake.rkt c/testmain

php/lang.php: lua/lang.lua
	racket Makefile.domake.rkt php/lang.php

python3/lang.py: python2/lang.py
	racket Makefile.domake.rkt python3/lang.py

python2/lang.py: ecmascript/lang.js ecmascript/exports.list
	racket Makefile.domake.rkt python2/lang.py

go/src: lua/lang.lua
	racket Makefile.domake.rkt go/src

typescript/lang.ts: typescript/lang.ts.d/00-head.ts typescript/lang.ts.d/01-uuc.ts typescript/lang.ts.d/03-data.ts typescript/lang.ts.d/07-symbol.ts typescript/lang.ts.d/09-util.ts typescript/lang.ts.d/11-env.ts typescript/lang.ts.d/50-lang.ts typescript/lang.ts.d/53-syntax.ts typescript/lang.ts.d/57-machinetext.ts typescript/lang.ts.d/59-effect.ts typescript/lang.ts.d/99-uuc.ts
	racket Makefile.premake.rkt
