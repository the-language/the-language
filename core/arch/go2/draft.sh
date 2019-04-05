#lang rash
(define (id x) x)
;; deps: golang 1.9+
mkdir -p deps
(define GOPATH "$PWD/deps")
sh -c "[ -d ./deps/src/github.com/yuin/gopher-lua/ ] || (mkdir -p ./deps/src/github.com/yuin && pushd ./deps/src/github.com/yuin && git clone --depth 1 https://github.com/yuin/gopher-lua.git && popd)"
go get github.com/yuin/gopher-lua
(define lang.go
    (string-append
        "package main\n"
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
        "ls.CallByParam(lua.P{Fn: exports.RawGetString(\"complex_parse\"), NRet: 1, Protect: true}, lua.LString(x))\n"
        "ret := ls.Get(-1)\n"
        "ls.Pop(1)\n"
        "assertstateempty()\n"
        "return ret.(Value)\n"
        "}\n"
        "func ComplexPrint(x Value) string {\n"
        "ls.CallByParam(lua.P{Fn: exports.RawGetString(\"complex_print\"), NRet: 1, Protect: true}, x.(lua.LValue))\n"
        "ret := ls.Get(-1)\n"
        "ls.Pop(1)\n"
        "assertstateempty()\n"
        "return string(ret.(lua.LString))\n"
        "}\n"
        "func SimplePrint(x Value) string {\n"
        "ls.CallByParam(lua.P{Fn: exports.RawGetString(\"simple_print\"), NRet: 1, Protect: true}, x.(lua.LValue))\n"
        "ret := ls.Get(-1)\n"
        "ls.Pop(1)\n"
        "assertstateempty()\n"
        "return string(ret.(lua.LString))\n"
        "}\n"
        "func main(){println(SimplePrint(ComplexParse(`:&>化滅`)))}\n"
    ))
|> id lang.go &>! lang.go
