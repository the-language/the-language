#lang rash
;;--deps--
;;wget
;;luajit
;;clang
;;gcc
;;clang-format
;;make
(require racket)
(define (id x) x)
|> id "[ -d lua-5.1.5 ] || (wget -O - http://www.lua.org/ftp/lua-5.1.5.tar.gz | tar -xzv && cd lua-5.1.5 && make generic && cd ..)" | sh
|> id "[ -d lua2c ] || git clone --depth 1 https://github.com/davidm/lua2c.git" | sh

(define raw #{|> id "LUA_PATH=./lua2c/lib/?.lua luajit ./lua2c/lua2c.lua ../lua/lang.lua" | sh | clang-format})

|> id raw &>! lang.lua2c.out.c

(define out (string-append
    (match (string-split raw "\n") [(list-rest head-list ... '("static int lc_pmain(lua_State *L) {" "  luaL_openlibs(L);" "" "  const lc_args_t *const args = (lc_args_t *)lua_touserdata(L, 1);" "  lc_createarg(L, args);" "" "  lua_pushcfunction(L, traceback);" "" "  const int status1 = lc_handle_luainit(L);" "  if (status1 != 0)" "    return 0;" "" "  /* note: IMPROVE: closure not always needed here */" "  lua_newtable(L); /* closure table */" "  lua_pushcclosure(L, lcf_main, 1);" "  int i;" "  for (i = 1; i < args->c; i++) {" "    lua_pushstring(L, args->v[i]);" "  }" "  int status2 = lua_pcall(L, args->c - 1, 0, -2);" "  if (status2 != 0) {" "    const char *msg = lua_tostring(L, -1);" "    if (msg == NULL)" "      msg = \"(error object is not a string)\";" "    fputs(msg, stderr);" "  }" "  return 0;" "}" "" "int main(int argc, const char **argv) {" "  lc_args_t args = {argc, argv};" "  lua_State *L = luaL_newstate();" "  if (!L) {" "    fputs(\"Failed creating Lua state.\", stderr);" "    exit(1);" "  }" "" "  int status = lua_cpcall(L, lc_pmain, &args);" "  if (status != 0) {" "    fputs(lua_tostring(L, -1), stderr);" "  }" "" "  lua_close(L);" "  return 0;" "}")) (apply string-append (map (lambda (x) (string-append x"\n")) head-list))])
    #{cat lang.tail.c}
    ))

mkdir -p src
rm -fr src
mkdir src
cp ./lua-5.1.5/src/lapi.c ./lua-5.1.5/src/lcode.c ./lua-5.1.5/src/ldebug.c ./lua-5.1.5/src/ldo.c ./lua-5.1.5/src/ldump.c ./lua-5.1.5/src/lfunc.c ./lua-5.1.5/src/lgc.c ./lua-5.1.5/src/llex.c ./lua-5.1.5/src/lmem.c ./lua-5.1.5/src/lobject.c ./lua-5.1.5/src/lopcodes.c ./lua-5.1.5/src/lparser.c ./lua-5.1.5/src/lstate.c ./lua-5.1.5/src/lstring.c ./lua-5.1.5/src/ltable.c ./lua-5.1.5/src/ltm.c ./lua-5.1.5/src/lundump.c ./lua-5.1.5/src/lvm.c ./lua-5.1.5/src/lzio.c ./lua-5.1.5/src/lauxlib.c ./lua-5.1.5/src/lbaselib.c ./lua-5.1.5/src/ldblib.c ./lua-5.1.5/src/liolib.c ./lua-5.1.5/src/lmathlib.c ./lua-5.1.5/src/loslib.c ./lua-5.1.5/src/ltablib.c ./lua-5.1.5/src/lstrlib.c ./lua-5.1.5/src/loadlib.c ./lua-5.1.5/src/linit.c ./src
cp ./lua-5.1.5/src/*.h ./src
|> id out &>! ./src/lang.c
cp lang.h ./src

clang -O3 -Oz -o testmain testmain.c -I./src/ ./src/*.c -lm
