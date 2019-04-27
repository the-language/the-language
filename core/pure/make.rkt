#lang rash
;; in-dir is in the demo file still
(require rash/demo/setup)
(require make)
(require racket)

(define (id x) x)
(define ++ string-append)
(define (apply-++ x) (apply ++ x))
(define (string->lines x) (string-split x "\n"))
(define (lines->string x) (apply-++ (map (lambda (x) (++ x"\n")) x)))

(define c-copyright "/*
    The Language
    Copyright (C) 2018, 2019  Zaoqi <zaomir@outlook.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

*/
")
(define haskell-copyright "
--    The Language
--    Copyright (C) 2018, 2019  Zaoqi <zaomir@outlook.com>

--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU Affero General Public License as published
--    by the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.

--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU Affero General Public License for more details.

--    You should have received a copy of the GNU Affero General Public License
--    along with this program.  If not, see <https://www.gnu.org/licenses/>.

")
(define c-generatedby "/* Generated by make.rkt */\n")
(define haskell-generatedby "-- Generated by make.rkt\n")
(define bash-generatedby "# Generated by make.rkt\n")
(define (ecmascript/exports.list-parse) (filter-not (lambda (x) (equal? x "")) (string->lines #{cat ../ecmascript/exports.list})))


(define eval-ns (make-base-namespace))
(eval '(require racket) eval-ns)
(define (eval-str-sandbox x) (eval (read (open-input-string x)) eval-ns))
(define raw-lang.ts #{cat typescript/lang.ts})
(define raw-lang.ts-lines (string->lines raw-lang.ts))
(define (run-racket-code-generators->lines lines)
    (match lines
        [(list
            head-other-lines ...
            (and head-c-line (regexp #rx"^ */\\* *!!!Racket +Code +Generator!!!(.*)$" (list _ head-c)))
            (and (not (regexp #rx"\\*/")) c-lines) ...
            (and tail-c-line (regexp #rx"^(.*)\\*/ *$" (list _ tail-c)))
            (and head-g-line (regexp #rx"^ *// *!!!Generated +by +Racket!!! +!!!BEGIN!!!$"))
            (not (regexp #rx"!!!Generated +by +Racket!!! +!!!")) ...
            (and tail-g-line (regexp #rx"^ *// *!!!Generated +by +Racket!!! +!!!END!!!$"))
            tail-other-lines ...
            ) (append
                (run-racket-code-generators->lines head-other-lines)
                (list head-c-line)
                c-lines
                (list tail-c-line)
                (list head-g-line)
                (list (eval-str-sandbox (++ "(begin\n" head-c (apply-++ c-lines) tail-c "\n)")))
                (list tail-g-line)
                (run-racket-code-generators->lines tail-other-lines)
                )]
        [x x])
)
in-dir "typescript" {
    (make ((".done.racket.code.generator" ("lang.ts") {
        |> lines->string (run-racket-code-generators->lines raw-lang.ts-lines) &>! lang.ts.tmp
        mv lang.ts.tmp lang.ts
        touch .done.racket.code.generator
    })))
}



(make
    (("all" ("ecmascript/lang.js"
             "ecmascript/lang.raw.js"
             "lua/lang.lua"
             "ecmascript6/lang.js"
             ;;"python2/lang.py";;暫停。因爲性能太差。
             ;;"python3/lang.py";;暫停。因爲性能太差。
             ;;"php/lang.php";;WIP
             "java/src"
             "c/lang.h"
             "c/lang.c"
             "go/src")
            (void))
     ("typescript/lang.ts" () (void)) ;; 實現在前面
     ("ecmascript/lang.raw.js" ("ecmascript/lang.js") (void)) ;; 生成代碼寫在"ecmascript/lang.js生成裡
     ("ecmascript/exports.list" ("ecmascript/lang.js") (void)) ;; 生成代碼寫在"ecmascript/lang.js生成裡
     ("ecmascript/lang.js" ("typescript/lang.ts") {
        in-dir "typescript" {
            yarn
            touch lang.js
            rm lang.js
            npx tsc --build tsconfig.json
            (define raw (++ c-generatedby (match (string->lines #{cat lang.js})
                [(list "\"use strict\";" "exports.__esModule = true;" xs ...) (lines->string xs)])))
            |> id raw &>! ../ecmascript/lang.raw.js
            (define exports
                (filter-not
                    (lambda (x) (equal? x ""))
                    (string->lines
                        #{grep "^exports." ../ecmascript/lang.raw.js | awk (id "{print $1}") | sed (id "s|^exports.\\(.*\\)$|\\1|")})))
            (define exports.list (lines->string exports))
            (define google-closure-exports (++
                c-generatedby
                "var exports = {};\n"
                (apply-++ (map (lambda (x) (++ "exports."x"='something';\n")) exports))
                ))
            |> id google-closure-exports &>! lang.externs.js
            java -jar ./node_modules/google-closure-compiler-java/compiler.jar -W QUIET --assume_function_wrapper --language_out ECMASCRIPT3 --js ../ecmascript/lang.raw.js --externs lang.externs.js -O ADVANCED &>! lang.js
            cp lang.js ../ecmascript
            |> id exports.list &>! ../ecmascript/exports.list
            touch ../ecmascript/lang.raw.js ;; 因為"ecmascript/lang.raw.js"生成之實現
     }})
     ("lua/lang.lua" ("typescript/lang.ts") {
         in-dir "lua" {
             yarn
             |> ++ "/** @noSelfInFile */\n" #{cat ../typescript/lang.ts} &>! lang.ts
             touch lang.lua
             rm lang.lua
             npx tstl -p tsconfig.json
             (define raw #{cat lang.lua})
             (define out (++
                 haskell-generatedby
                 haskell-copyright
                 (match (string->lines raw)
                    [(list "--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]"
                    "-- Lua Library inline imports"
                    "function __TS__ArrayPush(arr, ...)"
                    "    local items = ({...})"
                    "    for ____TS_index = 1, #items do"
                    "        local item = items[____TS_index]"
                    "        arr[#arr + 1] = item"
                    "    end"
                    "    return #arr"
                    "end"
                    ""
                    "local ____exports = {}"
                    xs ...
                    ) (++
                          "local __TS__ArrayPush = function(arr, item)\n"
                          "    arr[#arr+1] = item\n"
                          "    return #arr\n"
                          "end\n"
                          "local ____exports = {}\n"
                          (lines->string xs)
                      )])
                 ))
             |> id out &>! lang.lua
     }})
     ("ecmascript6/lang.js" ("typescript/lang.ts") {
         in-dir "ecmascript6" {
             yarn
             touch lang.js
             rm lang.js
             npx tsc --build tsconfig.json
             (define raw #{cat lang.js})
             |> ++ c-generatedby raw &>! lang.js
     }})
     ("java/src" ("java/src/lang/Lang.java") (void))
     ("java/src/lang/Lang.java" ("lua/lang.lua" "java/real-src/lang/Lang.java" "java/real-src/lang/LangValue.java") {
         ;; TODO rewrite in rash
         in-dir "java" {
             ./compile.sh
     }})
     ("go/src" ("lua/lang.lua") {
         in-dir "go" {
           mkdir -p deps
           (define GOPATH "$PWD/deps")
           bash -c "[ -d ./deps/src/github.com/yuin/gopher-lua/ ] || (mkdir -p ./deps/src/github.com/yuin && pushd ./deps/src/github.com/yuin && git clone --depth 1 https://github.com/yuin/gopher-lua.git && popd)"
           go get github.com/yuin/gopher-lua
           (define lang.go
               (++
                   c-generatedby
                   c-copyright
                   "package lang\n"
                   "import ( \"github.com/yuin/gopher-lua\" )\n"
                   "type Value lua.LValue\n"
                   "var exports *lua.LTable\n"
                   "var ls *lua.LState\n"
                   "func assertstateempty() {if ls.GetTop() != 0 {panic(\"ls.GetTop() != 0\")}}\n"
                   "func init() {\n"
                   "ls = lua.NewState()\n"
                   "ls.OpenLibs()\n"
                   "defer ls.Close()\n"
                   "if err := ls.DoString(`"#{cat ../lua/lang.lua}"`); err != nil {panic(err)}\n"
                   "exports = ls.Get(-1).(*lua.LTable)\n"
                   "ls.Pop(1)\n"
                   "assertstateempty()\n"
                   "}\n"
                   "func ComplexParse(x string) Value {\n"
                   "ls.CallByParam(lua.P{Fn: exports.RawGetString(`complex_parse`), NRet: 1, Protect: true}, lua.LString(x))\n"
                   "ret := ls.Get(-1)\n"
                   "ls.Pop(1)\n"
                   "assertstateempty()\n"
                   "return ret.(Value)\n"
                   "}\n"
                   "func ComplexPrint(x Value) string {\n"
                   "ls.CallByParam(lua.P{Fn: exports.RawGetString(`complex_print`), NRet: 1, Protect: true}, x.(lua.LValue))\n"
                   "ret := ls.Get(-1)\n"
                   "ls.Pop(1)\n"
                   "assertstateempty()\n"
                   "return string(ret.(lua.LString))\n"
                   "}\n"
                   "func SimplePrint(x Value) string {\n"
                   "ls.CallByParam(lua.P{Fn: exports.RawGetString(`simple_print`), NRet: 1, Protect: true}, x.(lua.LValue))\n"
                   "ret := ls.Get(-1)\n"
                   "ls.Pop(1)\n"
                   "assertstateempty()\n"
                   "return string(ret.(lua.LString))\n"
                   "}\n"
               ))
           rm -fr src
           mkdir -p src/lang
           |> id lang.go &>! src/lang/lang.go
           (define package.go
               (++
                 "package lang\n"
                 "const PackageName = `The Language`\n"
                 "const PackageVersion = `0.1`\n"
                 "const PackageAuthors = `Zaoqi`\n"
                 "const PackageCopyRight = PackageName + ` ` + PackageVersion + ` Copyright (C) 2018-2019 ` + PackageAuthors\n"))
           |> id package.go &>! src/lang/package.go
     }})
     ("c/lua-5.1.5" () {in-dir "c" {
         |> id "wget -O - http://www.lua.org/ftp/lua-5.1.5.tar.gz | tar -xzv && cd lua-5.1.5 && make generic CC=clang && cd .." | sh
     }})
     ("c/lua-5.1.5/src/lua" ("c/lua-5.1.5") (void))
     ("c/lua2c" () {
       in-dir "c" {
           git clone --depth 1 https://github.com/davidm/lua2c.git
     }})
     ("c/lang.h" () (void))
     ("c/lang.c" ("c/lua-5.1.5" "c/lua-5.1.5/src/lua" "c/lua2c" "lua/lang.lua" "c/patch/lang.tail.c" "c/lang.h" "c/patch/linit.c" "c/patch/lualib.h" "c/testmain.c") {
       in-dir "c" {
             (define raw #{|> id "LUA_PATH=./lua2c/lib/?.lua ./lua-5.1.5/src/lua ./lua2c/lua2c.lua ../lua/lang.lua" | sh | sed (id "s|static|static inline|g") | clang-format})

             |> id raw &>! lang.lua2c.out.c

             (define out (++
                 (match (string->lines raw) [(list-rest head-list ... '("static inline int lc_pmain(lua_State *L) {" "  luaL_openlibs(L);" "" "  const lc_args_t *const args = (lc_args_t *)lua_touserdata(L, 1);" "  lc_createarg(L, args);" "" "  lua_pushcfunction(L, traceback);" "" "  const int status1 = lc_handle_luainit(L);" "  if (status1 != 0)" "    return 0;" "" "  /* note: IMPROVE: closure not always needed here */" "  lua_newtable(L); /* closure table */" "  lua_pushcclosure(L, lcf_main, 1);" "  int i;" "  for (i = 1; i < args->c; i++) {" "    lua_pushstring(L, args->v[i]);" "  }" "  int status2 = lua_pcall(L, args->c - 1, 0, -2);" "  if (status2 != 0) {" "    const char *msg = lua_tostring(L, -1);" "    if (msg == NULL)" "      msg = \"(error object is not a string)\";" "    fputs(msg, stderr);" "  }" "  return 0;" "}" "" "int main(int argc, const char **argv) {" "  lc_args_t args = {argc, argv};" "  lua_State *L = luaL_newstate();" "  if (!L) {" "    fputs(\"Failed creating Lua state.\", stderr);" "    exit(1);" "  }" "" "  int status = lua_cpcall(L, lc_pmain, &args);" "  if (status != 0) {" "    fputs(lua_tostring(L, -1), stderr);" "  }" "" "  lua_close(L);" "  return 0;" "}")) (lines->string head-list)])
                 #{cat ./patch/lang.tail.c}))

             mkdir -p src
             rm -fr src
             mkdir src
             cp ./lua-5.1.5/src/lapi.c ./lua-5.1.5/src/lcode.c ./lua-5.1.5/src/ldebug.c ./lua-5.1.5/src/ldo.c ./lua-5.1.5/src/ldump.c ./lua-5.1.5/src/lfunc.c ./lua-5.1.5/src/lgc.c ./lua-5.1.5/src/llex.c ./lua-5.1.5/src/lmem.c ./lua-5.1.5/src/lobject.c ./lua-5.1.5/src/lopcodes.c ./lua-5.1.5/src/lparser.c ./lua-5.1.5/src/lstate.c ./lua-5.1.5/src/lstring.c ./lua-5.1.5/src/ltable.c ./lua-5.1.5/src/ltm.c ./lua-5.1.5/src/lundump.c ./lua-5.1.5/src/lvm.c ./lua-5.1.5/src/lzio.c ./lua-5.1.5/src/lauxlib.c ./lua-5.1.5/src/lbaselib.c ./lua-5.1.5/src/ldblib.c ./lua-5.1.5/src/liolib.c ./lua-5.1.5/src/lmathlib.c ./lua-5.1.5/src/loslib.c ./lua-5.1.5/src/ltablib.c ./lua-5.1.5/src/lstrlib.c ./lua-5.1.5/src/loadlib.c ./lua-5.1.5/src/linit.c ./src
             cp ./lua-5.1.5/src/*.h ./src
             |> id out &>! ./src/lang.c
             cp lang.h ./src

             cp ./patch/linit.c ./patch/lualib.h ./src
             rm ./src/loslib.c ./src/lmathlib.c ./src/ltablib.c ./src/liolib.c ./src/ldblib.c ./src/loadlib.c

             ./gen.single.sh
             (define single (++
                   c-generatedby
                   c-copyright
                   #{cat lang.c}))
             |> id single &>! lang.c
             touch lang.h

             clang -Wl,-s -DNDEBUG -Ofast -Oz -o testmain testmain.c lang.c -lm
     }})
     ("php/lang.php" ("typescript/lang.ts" "ecmascript/exports.list") {
         in-dir "php" {
             yarn
             |> ++ "function _TS_THROW(x:string):never{throw x}\n" #{sed (id "s|throw\\([^;]*\\)|return _TS_THROW(\\1)|g") ../typescript/lang.ts} &>! lang.ts
             (define raw #{npx ts2php lang.ts})
             (define lang.php
                 (match (string->lines raw)
                     [(list "<?php" (regexp #rx"^namespace (.*)$") "function _TS_THROW($x) {  }" lines ...)
                         (string-append
                             "<?php\n"
                             c-generatedby
                             c-copyright
                             "function _TS_THROW($x) {throw new Exception($x);}\n"
                             (lines->string lines))]))
             |> id lang.php &>! lang.php
             sed -i (id "s|\\([^;()]*\\) in \\([^;()]*\\)|array_key_exists(\\2, \\1)|g") lang.php
     }})
     ;; 以下爲停止支持的
     ("python3/lang.py" ("python2/lang.py") {
         in-dir "python3" {
             rm -fr lang.py
             cp ../python2/lang.py ./
             2to3 -f all -f buffer -f idioms -f set_literal -f ws_comma --no-diffs --nobackups -w lang.py
     }})
     ("python2/lang.py" ("ecmascript/lang.js" "ecmascript/exports.list") {
         in-dir "python2" {
             (define raw-js (++
                 "var exports={};"
                 #{cat ../ecmascript/lang.js}))
             |> id raw-js &>! lang.js
             |> id "import js2py\njs2py.translate_file('lang.js','lang.py')\n" | python2
             (define exports (ecmascript/exports.list-parse))
             (define exports-py (++
                 "exports = var.to_python().exports\n"
                 (apply-++ (map (lambda (x) (++ x" = exports."x"\n")) exports))
                 ))
             (define all-py (++
                 "__all__ = ["
                 (apply-++ (add-between (map (lambda (x) (++ "'"x"'")) exports)", "))
                 "]\n"
                 ))
             (define py-raw (string->lines #{cat lang.py}))
             (match-define (list py-raw-head py-raw-body ... py-raw-tail) py-raw)
             (define py (++
                 bash-generatedby
                 (match py-raw-head ["__all__ = ['lang']" all-py])
                 (lines->string py-raw-body)
                 "\n"
                 (match py-raw-tail ["lang = var.to_python()" exports-py])))
             |> id py &>! lang.py
     }})
     )
    (current-command-line-arguments))