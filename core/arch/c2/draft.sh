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
    #{cat tail.c}
    ))
|> id out &>! lang.c

clang -O3 -Oz -o testmain testmain.c lang.c -I./lua-5.1.5/src/ ./lua-5.1.5/src/liblua.a -lm
