
#include "lang.h"

extern lang_state *state_new(void) {
  lang_state *L = malloc(sizeof(lang_state));
  if (NULL != L) {
    L->L = luaL_newstate();
    luaL_openlibs(L->L);
    lua_newtable(L->L);
    lua_pushcclosure(L->L, lcf_main, 1);
    lua_call(L->L, 0, 1);
    assert(lua_istable(L->L, -1));
    lua_setglobal(L->L, "L");
    assert(lua_gettop(L->L) == 0);
  }
  return L;
}
extern void state_delete(lang_state *L) {
  lua_close(L->L);
  L->L = NULL;
}
