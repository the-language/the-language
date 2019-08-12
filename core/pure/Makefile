all: ecmascript/lang.min.0.js ecmascript/lang.js ecmascript/lang.min.2.js lua/lang.lua lua/lang_min.lua ecmascript6/lang.js php/lang.php java/src c/lang.h c/lang.c c/lang.o c/liblang.so c/liblang.a
	racket Makefile.domake.rkt all

ecmascript/exports.list: ecmascript/lang.js
	racket Makefile.domake.rkt ecmascript/exports.list

ecmascript/lang.externs.js: ecmascript/exports.list
	racket Makefile.domake.rkt ecmascript/lang.externs.js

ecmascript/node_modules: ecmascript/yarn.lock
	racket Makefile.domake.rkt ecmascript/node_modules

ecmascript/langraw.js: ecmascript/node_modules typescript/lang.ts
	racket Makefile.domake.rkt ecmascript/langraw.js

ecmascript/lang.min.0.js: ecmascript/node_modules ecmascript/lang.externs.js ecmascript/langraw.js ecmascript/exports.list
	racket Makefile.domake.rkt ecmascript/lang.min.0.js

ecmascript/lang.min.2.js: ecmascript/node_modules ecmascript/lang.externs.js ecmascript/lang.min.0.js
	racket Makefile.domake.rkt ecmascript/lang.min.2.js

ecmascript/lang.js: ecmascript/node_modules typescript/lang.ts
	racket Makefile.domake.rkt ecmascript/lang.js

lua/luasrcdiet:
	racket Makefile.domake.rkt lua/luasrcdiet

lua/lang_min.lua: lua/lang.lua lua/luasrcdiet c/lua-5.1.5/src/lua
	racket Makefile.domake.rkt lua/lang_min.lua

lua/node_modules: lua/yarn.lock
	racket Makefile.domake.rkt lua/node_modules

lua/lang.lua: lua/node_modules typescript/lang.ts
	racket Makefile.domake.rkt lua/lang.lua

ecmascript6/node_modules: ecmascript6/yarn.lock
	racket Makefile.domake.rkt ecmascript6/node_modules

ecmascript6/lang.js: ecmascript6/node_modules typescript/lang.ts
	racket Makefile.domake.rkt ecmascript6/lang.js

java/src: lua/lang.lua java/real-src/lang/Lang.java java/real-src/lang/LangValue.java
	racket Makefile.domake.rkt java/src

c/lua-5.1.5/src/lua:
	racket Makefile.domake.rkt c/lua-5.1.5/src/lua

c/lua-5.1.5: c/lua-5.1.5/src/lua
	racket Makefile.domake.rkt c/lua-5.1.5

c/lua2c: c/lua2c-lib-lua2c-ast2cast.lua
	racket Makefile.domake.rkt c/lua2c

c/lang.h:
	racket Makefile.domake.rkt c/lang.h

c/lang.c: c/lua-5.1.5 c/lua-5.1.5/src/lua c/lua2c lua/lang_min.lua c/patch/lang.tail.c c/lang.h
	racket Makefile.domake.rkt c/lang.c

c/lang.o: c/lang.c c/lang.h
	racket Makefile.domake.rkt c/lang.o

c/liblang.so: c/lang.o
	racket Makefile.domake.rkt c/liblang.so

c/liblang.a: c/lang.o
	racket Makefile.domake.rkt c/liblang.a

php/node_modules: php/yarn.lock
	racket Makefile.domake.rkt php/node_modules

php/lang.php: php/node_modules lua/lang.lua
	racket Makefile.domake.rkt php/lang.php

python3/lang.py: python2/lang.py
	racket Makefile.domake.rkt python3/lang.py

python2/lang.py: ecmascript/lang.js ecmascript/exports.list
	racket Makefile.domake.rkt python2/lang.py

go/src: lua/lang.lua
	racket Makefile.domake.rkt go/src

typescript/lang.ts: typescript/lang.ts.d/00-head.ts typescript/lang.ts.d/01-trampoline.ts typescript/lang.ts.d/03-data.ts typescript/lang.ts.d/07-name.ts typescript/lang.ts.d/09-util.ts typescript/lang.ts.d/11-env.ts typescript/lang.ts.d/50-lang.ts typescript/lang.ts.d/53-syntax.ts typescript/lang.ts.d/57-machinetext.ts typescript/lang.ts.d/67-effect.ts
	racket Makefile.premake.rkt
