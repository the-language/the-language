
#include "lang.h"

/* TODO: Lua 錯誤處理 */

struct lang_state {
  lua_State *L;
  int exports_ref;
};
struct lang_value {
  int lua_ref;
};

extern lang_state *lang_state_new_orNULL(void) {
  lang_state *L = malloc(sizeof(lang_state));
  if (NULL != L) {
    L->L = luaL_newstate();
    if (NULL == L->L) {
      free(L);
      return NULL;
    }
    luaL_openlibs(L->L);
    lua_newtable(L->L);
    lua_pushcclosure(L->L, lcf_main, 1);
    lua_call(L->L, 0, 1);
    assert(lua_istable(L->L, -1));
    L->exports_ref = luaL_ref(L->L, LUA_REGISTRYINDEX);
    assert(lua_gettop(L->L) == 0);
  }
  return L;
}
extern void lang_state_delete(lang_state *L) {
  assert(lua_gettop(L->L) == 0);
  lua_close(L->L);
  L->L = NULL;
  free(L);
}

extern void lang_value_delete(lang_state *L, lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  luaL_unref(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  free(val);
  assert(lua_gettop(L->L) == 0);
}
extern lang_value *lang_value_copy_orNULL(lang_state *L, lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  lang_value *ret = malloc(sizeof(lang_value));
  if (NULL == ret) {
    return NULL;
  }
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  ret->lua_ref = luaL_ref(L->L, LUA_REGISTRYINDEX);
  assert(lua_gettop(L->L) == 0);
  return ret;
}
static inline lang_value *lang_value_from_lua_orNULL(lang_state *L) {
  lang_value *ret = malloc(sizeof(lang_value));
  if (NULL == ret) {
    return NULL;
  }
  assert(lua_istable(L->L, -1));
  ret->lua_ref = luaL_ref(L->L, LUA_REGISTRYINDEX);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, ret->lua_ref);
  assert(lua_istable(L->L, -1));
  lua_remove(L->L, -1);
  return ret;
}
#define _DEF_lang_a_parse(name) \
extern lang_value *lang_##name##_orNULL(lang_state *L, const char *str) { \
  assert(lua_gettop(L->L) == 0); \
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref); \
  lua_getfield(L->L, -1, #name); \
  lua_remove(L->L, -2); \
  lua_pushstring(L->L, str); \
  lua_call(L->L, 1, 1); \
  lang_value *ret = lang_value_from_lua_orNULL(L); \
  if (NULL == ret) { \
    lua_settop(L->L, 0); \
    return NULL; \
  } \
  assert(lua_gettop(L->L) == 0); \
  return ret; \
}

#define _DEF_lang_a_print(name) \
extern char *lang_##name##_retMalloc_orNULL(lang_state *L, lang_value *val) { \
  assert(lua_gettop(L->L) == 0); \
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref); \
  lua_getfield(L->L, -1, #name); \
  lua_remove(L->L, -2); \
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref); \
  lua_call(L->L, 1, 1); \
  assert(lua_isstring(L->L, -1)); \
  const char *rawret = lua_tostring(L->L, -1); \
  lua_remove(L->L, -1); \
  assert(lua_gettop(L->L) == 0); \
  size_t len = strlen(rawret); \
  char *ret = malloc(len + 1); \
  if (NULL == ret) { \
    return NULL; \
  } \
  memcpy(ret, rawret, len + 1); \
  return ret; \
}

_DEF_lang_a_parse(complex_parse);
_DEF_lang_a_parse(machinetext_parse);

_DEF_lang_a_print(complex_print);
_DEF_lang_a_print(simple_print);
_DEF_lang_a_print(machinetext_print);
