# 狀態

暫停。因爲
```
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x58 pc=0x50a93b]

goroutine 1 [running]:
github.com/yuin/gopher-lua.(*LState).PCall(0xc0000a6000, 0x1, 0x1, 0x0, 0x0, 0x0)
	/home/zaoqi/src/the-language/core/pure/go/deps/src/github.com/yuin/gopher-lua/state.go:1948 +0x3b
github.com/yuin/gopher-lua.(*LState).CallByParam(0xc0000a6000, 0x5b9480, 0xc000059b80, 0x1, 0x1, 0x0, 0xc00009df10, 0x1, 0x1, 0xc00000c0c0, ...)
	/home/zaoqi/src/the-language/core/pure/go/deps/src/github.com/yuin/gopher-lua/state.go:2024 +0xe5
lang.ComplexParse(0x573fd5, 0x9, 0x0, 0x526aca)
	/home/zaoqi/src/the-language/core/pure/go/src/lang/lang.go:2473 +0x11b
main.main()
	/home/zaoqi/src/the-language/core/pure/go/testmain.go:3 +0x3a
exit status 2
```
