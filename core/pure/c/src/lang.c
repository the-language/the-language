#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
#include "lang.h"

struct lang_state {
  lua_State *L;
  int exports_ref;
};
struct lang_value {
  int lua_ref;
};
static int lcf_main(lua_State *L);
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
extern lang_value *lang_complex_parse_orNULL(lang_state *L, const char *str) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "complex_parse");
  lua_remove(L->L, -2);
  lua_pushstring(L->L, str);
  lua_call(L->L, 1, 1);
  lang_value *ret = lang_value_from_lua_orNULL(L);
  if (NULL == ret) {
    lua_settop(L->L, 0);
    return NULL;
  }
  assert(lua_gettop(L->L) == 0);
  return ret;
};
extern lang_value *lang_machinetext_parse_orNULL(lang_state *L,
                                                 const char *str) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "machinetext_parse");
  lua_remove(L->L, -2);
  lua_pushstring(L->L, str);
  lua_call(L->L, 1, 1);
  lang_value *ret = lang_value_from_lua_orNULL(L);
  if (NULL == ret) {
    lua_settop(L->L, 0);
    return NULL;
  }
  assert(lua_gettop(L->L) == 0);
  return ret;
};
extern char *lang_complex_print_retMalloc_orNULL(lang_state *L,
                                                 lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "complex_print");
  lua_remove(L->L, -2);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  lua_call(L->L, 1, 1);
  assert(lua_isstring(L->L, -1));
  const char *rawret = lua_tostring(L->L, -1);
  lua_remove(L->L, -1);
  size_t len = strlen(rawret);
  char *ret = malloc(len + 1);
  if (NULL == ret) {
    return NULL;
  }
  memcpy(ret, rawret, len + 1);
  assert(lua_gettop(L->L) == 0);
  return ret;
};
extern char *lang_simple_print_retMalloc_orNULL(lang_state *L,
                                                lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "simple_print");
  lua_remove(L->L, -2);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  lua_call(L->L, 1, 1);
  assert(lua_isstring(L->L, -1));
  const char *rawret = lua_tostring(L->L, -1);
  lua_remove(L->L, -1);
  size_t len = strlen(rawret);
  char *ret = malloc(len + 1);
  if (NULL == ret) {
    return NULL;
  }
  memcpy(ret, rawret, len + 1);
  assert(lua_gettop(L->L) == 0);
  return ret;
};
extern char *lang_machinetext_print_retMalloc_orNULL(lang_state *L,
                                                     lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "machinetext_print");
  lua_remove(L->L, -2);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  lua_call(L->L, 1, 1);
  assert(lua_isstring(L->L, -1));
  const char *rawret = lua_tostring(L->L, -1);
  lua_remove(L->L, -1);
  size_t len = strlen(rawret);
  char *ret = malloc(len + 1);
  if (NULL == ret) {
    return NULL;
  }
  memcpy(ret, rawret, len + 1);
  assert(lua_gettop(L->L) == 0);
  return ret;
};
extern lang_value *lang_force1_orNULL(lang_state *L, lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "force1");
  lua_remove(L->L, -2);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  lua_call(L->L, 1, 1);
  lang_value *ret = lang_value_from_lua_orNULL(L);
  if (NULL == ret) {
    lua_settop(L->L, 0);
    return NULL;
  }
  assert(lua_gettop(L->L) == 0);
  return ret;
};
extern lang_value *lang_force_all_orNULL(lang_state *L, lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "force_all");
  lua_remove(L->L, -2);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  lua_call(L->L, 1, 1);
  lang_value *ret = lang_value_from_lua_orNULL(L);
  if (NULL == ret) {
    lua_settop(L->L, 0);
    return NULL;
  }
  assert(lua_gettop(L->L) == 0);
  return ret;
};
extern lang_value *lang_force_all_rec_orNULL(lang_state *L, lang_value *val) {
  assert(lua_gettop(L->L) == 0);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, L->exports_ref);
  lua_getfield(L->L, -1, "force_all_rec");
  lua_remove(L->L, -2);
  lua_rawgeti(L->L, LUA_REGISTRYINDEX, val->lua_ref);
  lua_call(L->L, 1, 1);
  lang_value *ret = lang_value_from_lua_orNULL(L);
  if (NULL == ret) {
    lua_settop(L->L, 0);
    return NULL;
  }
  assert(lua_gettop(L->L) == 0);
  return ret;
};
static void lc_newclosuretable(lua_State *L, int idx) {
  lua_newtable(L);
  lua_pushvalue(L, idx);
  lua_rawseti(L, -2, 0);
}
static void lc_add(lua_State *L, int idxa, int idxb) {
  if (lua_isnumber(L, idxa) && lua_isnumber(L, idxb)) {
    lua_pushnumber(L, lua_tonumber(L, idxa) + lua_tonumber(L, idxb));
  } else {
    if (luaL_getmetafield(L, idxa, "__add") ||
        luaL_getmetafield(L, idxb, "__add")) {
      lua_pushvalue(L, idxa < 0 && idxa > LUA_REGISTRYINDEX ? idxa - 1 : idxa);
      lua_pushvalue(L, idxb < 0 && idxb > LUA_REGISTRYINDEX ? idxb - 2 : idxb);
      lua_call(L, 2, 1);
    } else {
      luaL_error(L, "attempt to perform arithmetic");
    }
  }
}
static int lcf1___TS__ArrayPush(lua_State *L) {
  enum { lc_nformalargs = 1 };
  if ((lua_gettop(L) < lc_nformalargs)) {
    lua_settop(L, lc_nformalargs);
  }
  const int lc_nactualargs = lua_gettop(L);
  const int lc_nextra = (lc_nactualargs - lc_nformalargs);
  lua_createtable(L, 1, 0);
  const int lc2 = lua_gettop(L);
  {
    int i;
    for (i = lc_nformalargs + 1; i <= lc_nactualargs; i++) {
      lua_pushvalue(L, i);
    }
  }
  while ((lua_gettop(L) > lc2)) {
    lua_rawseti(L, lc2, (0 + (lua_gettop(L) - lc2)));
  }
  assert(lua_gettop(L) - lc_nextra == 2);
  enum { lc3 = 2 };
  lua_getglobal(L, "ipairs");
  lua_pushvalue(L, (2 + lc_nextra));
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 2);
    if (lua_isnil(L, -2)) {
      break;
    }
    lua_pushvalue(L, -2);
    lua_replace(L, -4);
    lua_pushvalue(L, (7 + lc_nextra));
    lua_len(L, 1);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_insert(L, -2);
    lua_settable(L, 1);
    assert(lua_gettop(L) - lc_nextra == 7);
    lua_pop(L, 2);
  }
  lua_settop(L, (lc3 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 2);
  lua_len(L, 1);
  return 1;
  assert(lua_gettop(L) - lc_nextra == 2);
}
static void lc_sub(lua_State *L, int idxa, int idxb) {
  if (lua_isnumber(L, idxa) && lua_isnumber(L, idxb)) {
    lua_pushnumber(L, lua_tonumber(L, idxa) - lua_tonumber(L, idxb));
  } else {
    if (luaL_getmetafield(L, idxa, "__sub") ||
        luaL_getmetafield(L, idxb, "__sub")) {
      lua_pushvalue(L, idxa < 0 && idxa > LUA_REGISTRYINDEX ? idxa - 1 : idxa);
      lua_pushvalue(L, idxb < 0 && idxb > LUA_REGISTRYINDEX ? idxb - 2 : idxb);
      lua_call(L, 2, 1);
    } else {
      luaL_error(L, "attempt to perform arithmetic");
    }
  }
}
static int lc_le(lua_State *L, int idxa, int idxb) {
  if (lua_type(L, idxa) == LUA_TNUMBER && lua_type(L, idxb) == LUA_TNUMBER) {
    return lua_tonumber(L, idxa) <= lua_tonumber(L, idxb);
  } else if (lua_type(L, idxa) == LUA_TSTRING &&
             lua_type(L, idxb) == LUA_TSTRING) {
    return lua_compare(L, idxa, idxb, LUA_OPLT) || lua_rawequal(L, idxa, idxb);
  } else if (luaL_getmetafield(L, idxa, "__le") ||
             luaL_getmetafield(L, idxb, "__le")) {
    lua_pushvalue(L, idxa < 0 && idxa > LUA_REGISTRYINDEX ? idxa - 1 : idxa);
    lua_pushvalue(L, idxb < 0 && idxb > LUA_REGISTRYINDEX ? idxb - 2 : idxb);
    lua_call(L, 2, 1);
    const int result = lua_toboolean(L, -1);
    lua_pop(L, 1);
    return result;
  } else if (luaL_getmetafield(L, idxa, "__lt") ||
             luaL_getmetafield(L, idxb, "__lt")) {
    lua_pushvalue(L, idxb < 0 && idxb > LUA_REGISTRYINDEX ? idxb - 1 : idxb);
    lua_pushvalue(L, idxa < 0 && idxa > LUA_REGISTRYINDEX ? idxa - 2 : idxa);
    lua_call(L, 2, 1);
    const int result = !lua_toboolean(L, -1);
    lua_pop(L, 1);
    return result;
  } else {
    return luaL_error(L, "attempt to compare");
  }
}
static int lcf1___TS__ArrayUnshift(lua_State *L) {
  enum { lc_nformalargs = 1 };
  if ((lua_gettop(L) < lc_nformalargs)) {
    lua_settop(L, lc_nformalargs);
  }
  const int lc_nactualargs = lua_gettop(L);
  const int lc_nextra = (lc_nactualargs - lc_nformalargs);
  lua_createtable(L, 1, 0);
  const int lc7 = lua_gettop(L);
  {
    int i;
    for (i = lc_nformalargs + 1; i <= lc_nactualargs; i++) {
      lua_pushvalue(L, i);
    }
  }
  while ((lua_gettop(L) > lc7)) {
    lua_rawseti(L, lc7, (0 + (lua_gettop(L) - lc7)));
  }
  assert(lua_gettop(L) - lc_nextra == 2);
  lua_len(L, (2 + lc_nextra));
  lua_pushnumber(L, 1);
  lc_sub(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  assert(lua_gettop(L) - lc_nextra == 3);
  enum { lc9 = 3 };
  while (1) {
    lua_pushnumber(L, 0);
    const int lc10 = lc_le(L, -1, (3 + lc_nextra));
    lua_pop(L, 1);
    lua_pushboolean(L, lc10);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lua_getglobal(L, "table");
    lua_pushliteral(L, "insert");
    lua_gettable(L, -2);
    lua_remove(L, -2);
    lua_pushvalue(L, 1);
    lua_pushnumber(L, 1);
    lua_pushnumber(L, 1);
    lc_add(L, (3 + lc_nextra), -1);
    lua_remove(L, -2);
    lua_gettable(L, (2 + lc_nextra));
    lua_call(L, 3, 0);
    assert(lua_gettop(L) - lc_nextra == 3);
    lua_pushnumber(L, 1);
    lc_sub(L, (3 + lc_nextra), -1);
    lua_remove(L, -2);
    lua_replace(L, (3 + lc_nextra));
    assert(lua_gettop(L) - lc_nextra == 3);
  }
  lua_settop(L, (lc9 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pop(L, 1);
  assert(lua_gettop(L) - lc_nextra == 2);
  lua_len(L, 1);
  return 1;
  assert(lua_gettop(L) - lc_nextra == 2);
}
static int lcf1_LANG_ERROR(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lua_getglobal(L, "error");
  lua_pushliteral(L, "TheLanguage PANIC");
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 0);
  return 0;
}
static void lc_setupvalue(lua_State *L, int tidx, int level, int varid) {
  if (level == 0) {
    lua_rawseti(L, tidx, varid);
  } else {
    lua_pushvalue(L, tidx);
    while (--level >= 0) {
      lua_rawgeti(L, tidx, 0);
      lua_remove(L, -2);
      tidx = -1;
    }
    lua_insert(L, -2);
    lua_rawseti(L, -2, varid);
    lua_pop(L, 1);
  }
}
static void lc_getupvalue(lua_State *L, int tidx, int level, int varid) {
  if (level == 0) {
    lua_rawgeti(L, tidx, varid);
  } else {
    lua_pushvalue(L, tidx);
    while (--level >= 0) {
      lua_rawgeti(L, tidx, 0);
      lua_remove(L, -2);
      tidx = -1;
    }
    lua_rawgeti(L, -1, varid);
    lua_remove(L, -2);
  }
}
static int lcf1_LANG_ASSERT(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc13 = 1 };
  lua_pushboolean(L, !(lua_toboolean(L, 1)));
  const int lc14 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc14) {
    const int lc15 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 125);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc15);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc13);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_recordstring_null_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc16 = 1 };
  lua_getglobal(L, "pairs");
  lua_pushvalue(L, 1);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 1);
    if (lua_isnil(L, -1)) {
      break;
    }
    lua_pushvalue(L, -1);
    lua_replace(L, -3);
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 5);
    lua_pop(L, 1);
  }
  lua_settop(L, lc16);
  assert(lua_gettop(L) == 1);
  lua_pushboolean(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_recordstring_shadow_copy(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_newtable(L);
  assert(lua_gettop(L) == 2);
  enum { lc17 = 2 };
  lua_getglobal(L, "pairs");
  lua_pushvalue(L, 1);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 1);
    if (lua_isnil(L, -1)) {
      break;
    }
    lua_pushvalue(L, -1);
    lua_replace(L, -3);
    lua_pushvalue(L, 6);
    lua_gettable(L, 1);
    lua_pushvalue(L, 6);
    lua_insert(L, -2);
    lua_settable(L, 2);
    assert(lua_gettop(L) == 6);
    lua_pop(L, 1);
  }
  lua_settop(L, lc17);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, 2);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf19(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lua_createtable(L, 2, 0);
  lua_pushboolean(L, 0);
  lua_rawseti(L, -2, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 126);
  lua_rawseti(L, -2, 2);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf1_trampoline_return(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc18 = 2 };
  assert((lua_gettop(L) == lc18));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 126);
  lua_pushvalue(L, lc18);
  lua_pushcclosure(L, lcf19, 1);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf22(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lua_createtable(L, 2, 0);
  lua_pushboolean(L, 1);
  lua_rawseti(L, -2, 1);
  const int lc21 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 127);
  lua_call(L, 0, LUA_MULTRET);
  while ((lua_gettop(L) > lc21)) {
    lua_rawseti(L, lc21, (1 + (lua_gettop(L) - lc21)));
  }
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf1_trampoline_delay(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc20 = 2 };
  assert((lua_gettop(L) == lc20));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 127);
  lua_pushvalue(L, lc20);
  lua_pushcclosure(L, lcf22, 1);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_new_comment(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 110);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_comment_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 110);
  const int lc23 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc23);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_comment_comment(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_comment_x(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_un_comment_all(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc24 = 1 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 105);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc24);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_atom_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 119);
  const int lc25 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc25);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_un_atom(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_atom_equal_p(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  enum { lc26 = 2 };
  const int lc27 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc27);
  const int lc28 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc28) {
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc26);
  assert(lua_gettop(L) == 2);
  enum { lc29 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 102);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 102);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  const int lc30 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc30);
  const int lc31 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc31) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 67);
    lua_pushvalue(L, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 2);
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 2);
  } else {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc29);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_new_construction(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 118);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_construction_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 118);
  const int lc32 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc32);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_construction_head(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_construction_tail(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_null_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 117);
  const int lc33 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc33);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_new_data(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 116);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_data_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 116);
  const int lc34 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc34);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_data_name(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_data_list(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_just_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 115);
  const int lc35 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc35);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_un_just(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_evaluate(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 114);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_delay_evaluate_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 114);
  const int lc36 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc36);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_evaluate_env(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_evaluate_x(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_builtin_form_apply(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lua_createtable(L, 4, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 112);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 3);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 4);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_delay_builtin_form_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 112);
  const int lc37 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc37);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_builtin_form_env(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_builtin_form_f(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_builtin_form_xs(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 4);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_builtin_func_apply(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 113);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_delay_builtin_func_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 113);
  const int lc38 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc38);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_builtin_func_f(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_builtin_func_xs(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_apply(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 111);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_delay_apply_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 111);
  const int lc39 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc39);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_apply_f(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_apply_xs(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_conslike(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 71);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  lua_call(L, 1, 1);
  lua_pushnumber(L, 2);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 71);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  lua_call(L, 1, 1);
  lua_pushnumber(L, 3);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_force_all_rec(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 30);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf1_conslike, 1);
  assert(lua_gettop(L) == 3);
  enum { lc40 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 93);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  const int lc41 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc41) {
    const int lc42 = lua_gettop(L);
    lua_pushvalue(L, 3);
    lua_pushvalue(L, 2);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc42);
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc43 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 99);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    const int lc44 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc44) {
      const int lc45 = lua_gettop(L);
      lua_pushvalue(L, 3);
      lua_pushvalue(L, 2);
      lua_call(L, 1, LUA_MULTRET);
      return (lua_gettop(L) - lc45);
      assert(lua_gettop(L) == 3);
    } else {
      enum { lc46 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      const int lc47 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc47) {
        const int lc48 = lua_gettop(L);
        lua_pushvalue(L, 3);
        lua_pushvalue(L, 2);
        lua_call(L, 1, LUA_MULTRET);
        return (lua_gettop(L) - lc48);
        assert(lua_gettop(L) == 3);
      }
      lua_settop(L, lc46);
    }
    lua_settop(L, lc43);
  }
  lua_settop(L, lc40);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, 2);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_new_hole_do(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lua_createtable(L, 1, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 109);
  lua_rawseti(L, -2, 1);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf1_hole_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 109);
  const int lc49 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc49);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_lang_assert_equal_set_do(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  enum { lc50 = 2 };
  const int lc51 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc51);
  const int lc52 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc52) {
    return 0;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc50);
  assert(lua_gettop(L) == 2);
  enum { lc53 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 96);
  const int lc54 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc54);
  const int lc55 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc55) {
    lua_pushvalue(L, 2);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 2);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 96);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc53);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 115);
  lua_pushnumber(L, 1);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, 2);
  lua_pushnumber(L, 2);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 2);
  lua_pushboolean(L, 0);
  lua_pushnumber(L, 3);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 2);
  lua_pushboolean(L, 0);
  lua_pushnumber(L, 4);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_hole_set_do(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 124);
  const int lc56 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 68);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc56), 0);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 124);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 68);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, 1);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, 2);
  assert(lua_gettop(L) == 4);
  lua_pushnumber(L, 1);
  lua_gettable(L, 4);
  lua_pushnumber(L, 1);
  lua_insert(L, -2);
  lua_settable(L, 3);
  assert(lua_gettop(L) == 4);
  lua_pushnumber(L, 2);
  lua_gettable(L, 4);
  lua_pushnumber(L, 2);
  lua_insert(L, -2);
  lua_settable(L, 3);
  assert(lua_gettop(L) == 4);
  lua_pushnumber(L, 3);
  lua_gettable(L, 4);
  lua_pushnumber(L, 3);
  lua_insert(L, -2);
  lua_settable(L, 3);
  assert(lua_gettop(L) == 4);
  lua_pushnumber(L, 4);
  lua_gettable(L, 4);
  lua_pushnumber(L, 4);
  lua_insert(L, -2);
  lua_settable(L, 3);
  assert(lua_gettop(L) == 4);
  return 0;
}
static int lcf1_lang_copy_do(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 69);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 66);
  lua_pushvalue(L, 2);
  lua_pushvalue(L, 1);
  lua_call(L, 2, 0);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, 2);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_new_error(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc57 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 94);
  const int lc58 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 59);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 100);
  const int lc59 = lua_gettop(L);
  lua_pushvalue(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 100);
  lua_pushvalue(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 96);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc59), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc58), LUA_MULTRET);
  return (lua_gettop(L) - lc57);
  assert(lua_gettop(L) == 2);
}
static int lcf1_jsArray_to_list(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 96);
  assert(lua_gettop(L) == 2);
  lua_len(L, 1);
  lua_pushnumber(L, 1);
  lc_sub(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  assert(lua_gettop(L) == 3);
  enum { lc61 = 3 };
  while (1) {
    lua_pushnumber(L, 0);
    const int lc62 = lc_le(L, -1, 3);
    lua_pop(L, 1);
    lua_pushboolean(L, lc62);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 100);
    lua_pushnumber(L, 1);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 1);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 3);
    lua_pushnumber(L, 1);
    lc_sub(L, 3, -1);
    lua_remove(L, -2);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc61);
  assert(lua_gettop(L) == 3);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, 2);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_new_list(lua_State *L) {
  enum { lc_nformalargs = 0 };
  const int lc_nactualargs = lua_gettop(L);
  const int lc_nextra = (lc_nactualargs - lc_nformalargs);
  lua_createtable(L, 1, 0);
  const int lc63 = lua_gettop(L);
  {
    int i;
    for (i = lc_nformalargs + 1; i <= lc_nactualargs; i++) {
      lua_pushvalue(L, i);
    }
  }
  while ((lua_gettop(L) > lc63)) {
    lua_rawseti(L, lc63, (0 + (lua_gettop(L) - lc63)));
  }
  assert(lua_gettop(L) - lc_nextra == 1);
  const int lc64 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 38);
  lua_pushvalue(L, (1 + lc_nextra));
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc64);
  assert(lua_gettop(L) - lc_nextra == 1);
}
static int lcf1_un_just_all(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc65 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 90);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc66 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc66) {
    lua_pushvalue(L, 1);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc65);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  assert(lua_gettop(L) == 2);
  lua_newtable(L);
  assert(lua_gettop(L) == 3);
  enum { lc67 = 3 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 90);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
    lua_pushvalue(L, 3);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 3);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 89);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc67);
  assert(lua_gettop(L) == 3);
  enum { lc68 = 3 };
  lua_getglobal(L, "ipairs");
  lua_pushvalue(L, 3);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 2);
    if (lua_isnil(L, -2)) {
      break;
    }
    lua_pushvalue(L, -2);
    lua_replace(L, -4);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 67);
    lua_pushvalue(L, 8);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 8);
    lua_pop(L, 2);
  }
  lua_settop(L, lc68);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, 2);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_delay_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 87);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 83);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
  }
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 78);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
  }
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 74);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
  }
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_just_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 90);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 35);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
  }
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_lazy_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
  }
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_do_rewrite(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 67);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 133);
  lua_pushvalue(L, 1);
  lua_call(L, 2, 0);
  assert(lua_gettop(L) == 1);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 2);
  enum { lc80 = 2 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 1, 130);
    lua_len(L, -1);
    lua_pop(L, 1);
    const int lc82 = lua_compare(L, 2, -1, LUA_OPLT);
    lua_pop(L, 1);
    lua_pushboolean(L, lc82);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 2, 67);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 130);
    lua_pushnumber(L, 1);
    lc_add(L, 2, -1);
    lua_remove(L, -2);
    lua_gettable(L, -2);
    lua_remove(L, -2);
    lua_pushvalue(L, 1);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 2);
    lua_pushnumber(L, 1);
    lc_add(L, 2, -1);
    lua_remove(L, -2);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc80);
  assert(lua_gettop(L) == 2);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_do_rewrite_force_all(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 132);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 1);
  enum { lc83 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 2, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc84 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc84) {
    lc_getupvalue(L, lua_upvalueindex(1), 4, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 130);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 133);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 1);
    const int lc85 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 2, 32);
    lua_pushvalue(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 128);
    lua_createtable(L, 2, 0);
    lua_pushboolean(L, 0);
    lua_rawseti(L, -2, 1);
    lua_pushboolean(L, 0);
    lua_rawseti(L, -2, 2);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 130);
    lua_call(L, 4, LUA_MULTRET);
    return (lua_gettop(L) - lc85);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc83);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_replace_this_with_stopped(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lua_pushboolean(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 129);
  lua_insert(L, -2);
  lua_pushnumber(L, 2);
  lua_insert(L, -2);
  lua_settable(L, -3);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 0);
  const int lc87 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 131);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 58);
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc87);
  assert(lua_gettop(L) == 0);
}
static int lcf1_make_history(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lua_newtable(L);
  assert(lua_gettop(L) == 1);
  enum { lc88 = 1 };
  lua_getglobal(L, "pairs");
  lc_getupvalue(L, lua_upvalueindex(1), 0, 134);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 1);
    if (lua_isnil(L, -1)) {
      break;
    }
    lua_pushvalue(L, -1);
    lua_replace(L, -3);
    lua_pushboolean(L, 1);
    lua_pushvalue(L, 5);
    lua_insert(L, -2);
    lua_settable(L, 1);
    assert(lua_gettop(L) == 5);
    lua_pop(L, 1);
  }
  lua_settop(L, lc88);
  assert(lua_gettop(L) == 1);
  enum { lc89 = 1 };
  lua_getglobal(L, "pairs");
  lc_getupvalue(L, lua_upvalueindex(1), 2, 128);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 1);
    if (lua_isnil(L, -1)) {
      break;
    }
    lua_pushvalue(L, -1);
    lua_replace(L, -3);
    lua_pushboolean(L, 1);
    lua_pushvalue(L, 5);
    lua_insert(L, -2);
    lua_settable(L, 1);
    assert(lua_gettop(L) == 5);
    lua_pop(L, 1);
  }
  lua_settop(L, lc89);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_force_all_inner(lua_State *L) {
  lua_checkstack(L, 29);
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc69 = 5 };
  assert((lua_gettop(L) == lc69));
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 128);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 129);
  lua_pushvalue(L, 4);
  lua_rawseti(L, -2, 130);
  enum { lc70 = 5 };
  lc_getupvalue(L, lc69, 0, 128);
  lua_pushnil(L);
  const int lc71 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc71);
  const int lc72 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc72) {
    lua_newtable(L);
    lc_setupvalue(L, lc69, 0, 128);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc70);
  assert(lua_gettop(L) == 5);
  enum { lc73 = 5 };
  lc_getupvalue(L, lc69, 0, 129);
  lua_pushnil(L);
  const int lc74 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc74);
  const int lc75 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc75) {
    lua_createtable(L, 2, 0);
    lua_pushboolean(L, 0);
    lua_rawseti(L, -2, 1);
    lua_pushboolean(L, 0);
    lua_rawseti(L, -2, 2);
    lc_setupvalue(L, lc69, 0, 129);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc73);
  assert(lua_gettop(L) == 5);
  enum { lc76 = 5 };
  lc_getupvalue(L, lc69, 0, 130);
  lua_pushnil(L);
  const int lc77 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc77);
  const int lc78 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc78) {
    lua_newtable(L);
    lc_setupvalue(L, lc69, 0, 130);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc76);
  assert(lua_gettop(L) == 5);
  lc_newclosuretable(L, lc69);
  enum { lc79 = 6 };
  assert((lua_gettop(L) == lc79));
  lua_settop(L, (lua_gettop(L) + 3));
  lua_rawseti(L, lc79, 131);
  lua_rawseti(L, lc79, 132);
  lua_rawseti(L, lc79, 133);
  assert(lua_gettop(L) == 6);
  lua_pushvalue(L, lc79);
  lua_pushcclosure(L, lcf1_do_rewrite, 1);
  lc_setupvalue(L, lc79, 0, 132);
  assert(lua_gettop(L) == 6);
  lua_pushvalue(L, lc79);
  lua_pushcclosure(L, lcf1_do_rewrite_force_all, 1);
  lc_setupvalue(L, lc79, 0, 131);
  assert(lua_gettop(L) == 6);
  lc_newclosuretable(L, lc79);
  enum { lc86 = 7 };
  assert((lua_gettop(L) == lc86));
  lua_newtable(L);
  lua_rawseti(L, lc86, 134);
  assert(lua_gettop(L) == 7);
  lua_pushvalue(L, 1);
  lc_setupvalue(L, lc86, 1, 133);
  assert(lua_gettop(L) == 7);
  lua_pushvalue(L, lc86);
  lua_pushcclosure(L, lcf1_replace_this_with_stopped, 1);
  assert(lua_gettop(L) == 8);
  lua_pushvalue(L, lc86);
  lua_pushcclosure(L, lcf1_make_history, 1);
  assert(lua_gettop(L) == 9);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 10);
  enum { lc90 = 10 };
  while (1) {
    lc_getupvalue(L, lc86, 3, 34);
    lc_getupvalue(L, lc86, 1, 133);
    lua_call(L, 1, 1);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lua_pushnumber(L, 32);
      const int lc91 = lua_compare(L, 10, -1, LUA_OPLT);
      lua_pop(L, 1);
      lua_pushboolean(L, lc91);
    }
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lc86, 5, 1);
    lc_getupvalue(L, lc86, 2, 130);
    lc_getupvalue(L, lc86, 1, 133);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 10);
    lc_getupvalue(L, lc86, 3, 31);
    lc_getupvalue(L, lc86, 1, 133);
    lua_call(L, 1, 1);
    lc_setupvalue(L, lc86, 1, 133);
    assert(lua_gettop(L) == 10);
    lua_pushnumber(L, 1);
    lc_add(L, 10, -1);
    lua_remove(L, -2);
    lua_replace(L, 10);
    assert(lua_gettop(L) == 10);
  }
  lua_settop(L, lc90);
  assert(lua_gettop(L) == 10);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 9);
  enum { lc92 = 9 };
  while (1) {
    lc_getupvalue(L, lc86, 3, 34);
    lc_getupvalue(L, lc86, 1, 133);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lc86, 3, 3);
    lc_getupvalue(L, lc86, 1, 133);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 10);
    enum { lc93 = 10 };
    lc_getupvalue(L, lc86, 2, 128);
    lua_pushvalue(L, 10);
    lua_gettable(L, -2);
    lua_remove(L, -2);
    lua_pushboolean(L, 1);
    const int lc94 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc94);
    const int lc95 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc95) {
      const int lc96 = lua_gettop(L);
      lua_pushvalue(L, 8);
      lua_call(L, 0, LUA_MULTRET);
      return (lua_gettop(L) - lc96);
      assert(lua_gettop(L) == 10);
    }
    lua_settop(L, lc93);
    assert(lua_gettop(L) == 10);
    enum { lc97 = 10 };
    lc_getupvalue(L, lc86, 0, 134);
    lua_pushvalue(L, 10);
    lua_gettable(L, -2);
    lua_remove(L, -2);
    lua_pushboolean(L, 1);
    const int lc98 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc98);
    const int lc99 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc99) {
      lua_pushboolean(L, 1);
      lc_getupvalue(L, lc86, 2, 129);
      lua_insert(L, -2);
      lua_pushnumber(L, 1);
      lua_insert(L, -2);
      lua_settable(L, -3);
      lua_pop(L, 1);
      assert(lua_gettop(L) == 10);
      enum { lc100 = 10 };
      lc_getupvalue(L, lc86, 3, 87);
      lc_getupvalue(L, lc86, 1, 133);
      lua_call(L, 1, 1);
      const int lc101 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc101) {
        const int lc102 = lua_gettop(L);
        lua_pushvalue(L, 8);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc102);
        assert(lua_gettop(L) == 10);
      } else {
        enum { lc103 = 10 };
        lc_getupvalue(L, lc86, 3, 78);
        lc_getupvalue(L, lc86, 1, 133);
        lua_call(L, 1, 1);
        const int lc104 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc104) {
          lc_getupvalue(L, lc86, 3, 77);
          lc_getupvalue(L, lc86, 1, 133);
          lua_call(L, 1, 1);
          assert(lua_gettop(L) == 11);
          lc_getupvalue(L, lc86, 3, 76);
          lc_getupvalue(L, lc86, 1, 133);
          lua_call(L, 1, 1);
          assert(lua_gettop(L) == 12);
          lua_createtable(L, 8, 0);
          lc_getupvalue(L, lc86, 3, 57);
          lua_rawseti(L, -2, 1);
          lc_getupvalue(L, lc86, 3, 56);
          lua_rawseti(L, -2, 2);
          lc_getupvalue(L, lc86, 3, 55);
          lua_rawseti(L, -2, 3);
          lc_getupvalue(L, lc86, 3, 54);
          lua_rawseti(L, -2, 4);
          lc_getupvalue(L, lc86, 3, 53);
          lua_rawseti(L, -2, 5);
          lc_getupvalue(L, lc86, 3, 52);
          lua_rawseti(L, -2, 6);
          lc_getupvalue(L, lc86, 3, 51);
          lua_rawseti(L, -2, 7);
          lc_getupvalue(L, lc86, 3, 50);
          lua_rawseti(L, -2, 8);
          assert(lua_gettop(L) == 13);
          lua_pushboolean(L, 0);
          assert(lua_gettop(L) == 14);
          enum { lc105 = 14 };
          lua_getglobal(L, "ipairs");
          lua_pushvalue(L, 13);
          lua_call(L, 1, 3);
          while (1) {
            lua_pushvalue(L, -3);
            lua_pushvalue(L, -3);
            lua_pushvalue(L, -3);
            lua_call(L, 2, 2);
            if (lua_isnil(L, -2)) {
              break;
            }
            lua_pushvalue(L, -2);
            lua_replace(L, -4);
            enum { lc106 = 19 };
            lc_getupvalue(L, lc86, 3, 4);
            lua_pushvalue(L, 19);
            lua_pushvalue(L, 11);
            lua_call(L, 2, 1);
            const int lc107 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc107) {
              lua_pushboolean(L, 1);
              lua_replace(L, 14);
              assert(lua_gettop(L) == 19);
              break;
              assert(lua_gettop(L) == 19);
            }
            lua_settop(L, lc106);
            assert(lua_gettop(L) == 19);
            lua_pop(L, 2);
          }
          lua_settop(L, lc105);
          assert(lua_gettop(L) == 14);
          enum { lc108 = 14 };
          if (lua_toboolean(L, 14)) {
            lc_getupvalue(L, lc86, 3, 124);
            lua_len(L, 12);
            lua_pushnumber(L, 1);
            const int lc110 = lua_compare(L, -2, -1, LUA_OPEQ);
            lua_pop(L, 2);
            lua_pushboolean(L, lc110);
            lua_call(L, 1, 0);
            assert(lua_gettop(L) == 14);
            lc_getupvalue(L, lc86, 3, 124);
            lc_getupvalue(L, lc86, 2, 129);
            lua_pushnumber(L, 2);
            lua_gettable(L, -2);
            lua_remove(L, -2);
            lua_pushboolean(L, 0);
            const int lc111 = lua_compare(L, -2, -1, LUA_OPEQ);
            lua_pop(L, 2);
            lua_pushboolean(L, lc111);
            lua_call(L, 1, 0);
            assert(lua_gettop(L) == 14);
            lc_getupvalue(L, lc86, 3, 32);
            lua_pushnumber(L, 1);
            lua_gettable(L, 12);
            lua_pushvalue(L, 9);
            lua_call(L, 0, 1);
            lc_getupvalue(L, lc86, 2, 129);
            lua_call(L, 3, 1);
            assert(lua_gettop(L) == 15);
            enum { lc112 = 15 };
            lc_getupvalue(L, lc86, 2, 129);
            lua_pushnumber(L, 2);
            lua_gettable(L, -2);
            lua_remove(L, -2);
            const int lc113 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc113) {
              const int lc114 = lua_gettop(L);
              lc_getupvalue(L, lc86, 1, 131);
              const int lc115 = lua_gettop(L);
              lc_getupvalue(L, lc86, 3, 79);
              lua_pushvalue(L, 11);
              lua_createtable(L, 1, 0);
              lua_pushvalue(L, 15);
              lua_rawseti(L, -2, 1);
              lua_call(L, 2, LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc115), LUA_MULTRET);
              return (lua_gettop(L) - lc114);
              assert(lua_gettop(L) == 15);
            } else {
              const int lc116 = lua_gettop(L);
              lc_getupvalue(L, lc86, 3, 125);
              lua_call(L, 0, LUA_MULTRET);
              return (lua_gettop(L) - lc116);
              assert(lua_gettop(L) == 15);
            }
            lua_settop(L, lc112);
            assert(lua_gettop(L) == 15);
          }
          lua_settop(L, lc108);
          assert(lua_gettop(L) == 14);
          enum { lc117 = 14 };
          lc_getupvalue(L, lc86, 3, 4);
          lua_pushvalue(L, 11);
          lc_getupvalue(L, lc86, 3, 49);
          lua_call(L, 2, 1);
          const int lc118 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc118) {
            const int lc119 = lua_gettop(L);
            lua_pushvalue(L, 8);
            lua_call(L, 0, LUA_MULTRET);
            return (lua_gettop(L) - lc119);
            assert(lua_gettop(L) == 14);
          } else {
            enum { lc120 = 14 };
            lc_getupvalue(L, lc86, 3, 4);
            lua_pushvalue(L, 11);
            lc_getupvalue(L, lc86, 3, 48);
            lua_call(L, 2, 1);
            const int lc121 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc121) {
              const int lc122 = lua_gettop(L);
              lua_pushvalue(L, 8);
              lua_call(L, 0, LUA_MULTRET);
              return (lua_gettop(L) - lc122);
              assert(lua_gettop(L) == 14);
            } else {
              enum { lc123 = 14 };
              lc_getupvalue(L, lc86, 3, 4);
              lua_pushvalue(L, 11);
              lc_getupvalue(L, lc86, 3, 47);
              lua_call(L, 2, 1);
              const int lc124 = lua_toboolean(L, -1);
              lua_pop(L, 1);
              if (lc124) {
                const int lc125 = lua_gettop(L);
                lua_pushvalue(L, 8);
                lua_call(L, 0, LUA_MULTRET);
                return (lua_gettop(L) - lc125);
                assert(lua_gettop(L) == 14);
              } else {
                enum { lc126 = 14 };
                lc_getupvalue(L, lc86, 3, 4);
                lua_pushvalue(L, 11);
                lc_getupvalue(L, lc86, 3, 46);
                lua_call(L, 2, 1);
                const int lc127 = lua_toboolean(L, -1);
                lua_pop(L, 1);
                if (lc127) {
                  lc_getupvalue(L, lc86, 3, 124);
                  lua_len(L, 12);
                  lua_pushnumber(L, 3);
                  const int lc129 = lua_compare(L, -2, -1, LUA_OPEQ);
                  lua_pop(L, 2);
                  lua_pushboolean(L, lc129);
                  lua_call(L, 1, 0);
                  assert(lua_gettop(L) == 14);
                  lc_getupvalue(L, lc86, 3, 124);
                  lc_getupvalue(L, lc86, 2, 129);
                  lua_pushnumber(L, 2);
                  lua_gettable(L, -2);
                  lua_remove(L, -2);
                  lua_pushboolean(L, 0);
                  const int lc130 = lua_compare(L, -2, -1, LUA_OPEQ);
                  lua_pop(L, 2);
                  lua_pushboolean(L, lc130);
                  lua_call(L, 1, 0);
                  assert(lua_gettop(L) == 14);
                  lc_getupvalue(L, lc86, 3, 32);
                  lua_pushnumber(L, 1);
                  lua_gettable(L, 12);
                  lua_pushvalue(L, 9);
                  lua_call(L, 0, 1);
                  lc_getupvalue(L, lc86, 2, 129);
                  lua_call(L, 3, 1);
                  assert(lua_gettop(L) == 15);
                  enum { lc131 = 15 };
                  lc_getupvalue(L, lc86, 2, 129);
                  lua_pushnumber(L, 2);
                  lua_gettable(L, -2);
                  lua_remove(L, -2);
                  const int lc132 = lua_toboolean(L, -1);
                  lua_pop(L, 1);
                  if (lc132) {
                    const int lc133 = lua_gettop(L);
                    lc_getupvalue(L, lc86, 1, 131);
                    const int lc134 = lua_gettop(L);
                    lc_getupvalue(L, lc86, 3, 79);
                    lc_getupvalue(L, lc86, 3, 46);
                    lua_createtable(L, 3, 0);
                    lua_pushvalue(L, 15);
                    lua_rawseti(L, -2, 1);
                    lua_pushnumber(L, 2);
                    lua_gettable(L, 12);
                    lua_rawseti(L, -2, 2);
                    lua_pushnumber(L, 3);
                    lua_gettable(L, 12);
                    lua_rawseti(L, -2, 3);
                    lua_call(L, 2, LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc134), LUA_MULTRET);
                    return (lua_gettop(L) - lc133);
                    assert(lua_gettop(L) == 15);
                  } else {
                    const int lc135 = lua_gettop(L);
                    lc_getupvalue(L, lc86, 3, 125);
                    lua_call(L, 0, LUA_MULTRET);
                    return (lua_gettop(L) - lc135);
                    assert(lua_gettop(L) == 15);
                  }
                  lua_settop(L, lc131);
                  assert(lua_gettop(L) == 15);
                }
                lua_settop(L, lc126);
              }
              lua_settop(L, lc123);
            }
            lua_settop(L, lc120);
          }
          lua_settop(L, lc117);
          assert(lua_gettop(L) == 14);
          const int lc136 = lua_gettop(L);
          lc_getupvalue(L, lc86, 3, 125);
          lua_call(L, 0, LUA_MULTRET);
          return (lua_gettop(L) - lc136);
          assert(lua_gettop(L) == 14);
        } else {
          enum { lc137 = 10 };
          lc_getupvalue(L, lc86, 3, 83);
          lc_getupvalue(L, lc86, 1, 133);
          lua_call(L, 1, 1);
          const int lc138 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc138) {
            const int lc139 = lua_gettop(L);
            lua_pushvalue(L, 8);
            lua_call(L, 0, LUA_MULTRET);
            return (lua_gettop(L) - lc139);
            assert(lua_gettop(L) == 10);
          } else {
            enum { lc140 = 10 };
            lc_getupvalue(L, lc86, 3, 74);
            lc_getupvalue(L, lc86, 1, 133);
            lua_call(L, 1, 1);
            const int lc141 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc141) {
              const int lc142 = lua_gettop(L);
              lua_pushvalue(L, 8);
              lua_call(L, 0, LUA_MULTRET);
              return (lua_gettop(L) - lc142);
              assert(lua_gettop(L) == 10);
            }
            lua_settop(L, lc140);
          }
          lua_settop(L, lc137);
        }
        lua_settop(L, lc103);
      }
      lua_settop(L, lc100);
      assert(lua_gettop(L) == 10);
      const int lc143 = lua_gettop(L);
      lc_getupvalue(L, lc86, 3, 125);
      lua_call(L, 0, LUA_MULTRET);
      return (lua_gettop(L) - lc143);
      assert(lua_gettop(L) == 10);
    }
    lua_settop(L, lc97);
    assert(lua_gettop(L) == 10);
    lua_pushboolean(L, 1);
    lc_getupvalue(L, lc86, 0, 134);
    lua_insert(L, -2);
    lua_pushvalue(L, 10);
    lua_insert(L, -2);
    lua_settable(L, -3);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 10);
    lc_getupvalue(L, lc86, 5, 1);
    lc_getupvalue(L, lc86, 2, 130);
    lc_getupvalue(L, lc86, 1, 133);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 10);
    lc_getupvalue(L, lc86, 3, 31);
    lc_getupvalue(L, lc86, 1, 133);
    lua_call(L, 1, 1);
    lc_setupvalue(L, lc86, 1, 133);
    assert(lua_gettop(L) == 10);
    lua_pop(L, 1);
  }
  lua_settop(L, lc92);
  assert(lua_gettop(L) == 9);
  const int lc144 = lua_gettop(L);
  lc_getupvalue(L, lc86, 1, 132);
  lc_getupvalue(L, lc86, 1, 133);
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc144);
  assert(lua_gettop(L) == 9);
}
static int lcf1_force1(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 36);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 2);
  lua_settop(L, (lua_gettop(L) + 1));
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 124);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 90);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 3);
  enum { lc145 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 87);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  const int lc146 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc146) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 12);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 86);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 85);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    lua_pushvalue(L, 1);
    lua_call(L, 3, 1);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc147 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 83);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    const int lc148 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc148) {
      lc_getupvalue(L, lua_upvalueindex(1), 0, 8);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 82);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 81);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 80);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      lua_pushvalue(L, 1);
      lua_call(L, 4, 1);
      lua_replace(L, 3);
      assert(lua_gettop(L) == 3);
    } else {
      enum { lc149 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 0, 78);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      const int lc150 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc150) {
        lc_getupvalue(L, lua_upvalueindex(1), 0, 9);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 77);
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 76);
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lua_pushvalue(L, 1);
        lua_call(L, 3, 1);
        lua_replace(L, 3);
        assert(lua_gettop(L) == 3);
      } else {
        enum { lc151 = 3 };
        lc_getupvalue(L, lua_upvalueindex(1), 0, 74);
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        const int lc152 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc152) {
          lc_getupvalue(L, lua_upvalueindex(1), 0, 10);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 73);
          lua_pushvalue(L, 2);
          lua_call(L, 1, 1);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 72);
          lua_pushvalue(L, 2);
          lua_call(L, 1, 1);
          lua_pushvalue(L, 1);
          lua_call(L, 3, 1);
          lua_replace(L, 3);
          assert(lua_gettop(L) == 3);
        } else {
          lua_pushvalue(L, 2);
          lua_replace(L, 3);
          assert(lua_gettop(L) == 3);
        }
        lua_settop(L, lc151);
      }
      lua_settop(L, lc149);
    }
    lua_settop(L, lc147);
  }
  lua_settop(L, lc145);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 36);
  lua_pushvalue(L, 3);
  lua_call(L, 1, 1);
  lua_replace(L, 3);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 67);
  lua_pushvalue(L, 2);
  lua_pushvalue(L, 3);
  lua_call(L, 2, 0);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, 3);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_force_all(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc153 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 32);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc153);
  assert(lua_gettop(L) == 1);
}
static int lcf1_force_uncomment_all(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc154 = 1 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 34);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      lua_pop(L, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
    }
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 30);
    const int lc155 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 104);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc155), 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc154);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_unlazy1(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc156 = 1 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 105);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc156);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 31);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 1);
  enum { lc157 = 1 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 105);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc157);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_unlazy_list_1_keepcomment(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lua_newtable(L);
  assert(lua_gettop(L) == 5);
  lua_newtable(L);
  assert(lua_gettop(L) == 6);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 36);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 7);
  lua_pushboolean(L, 1);
  assert(lua_gettop(L) == 8);
  enum { lc158 = 8 };
  while (1) {
    lua_pushboolean(L, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    enum { lc159 = 8 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 95);
    lua_pushvalue(L, 7);
    lua_call(L, 1, 1);
    const int lc160 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc160) {
      const int lc161 = lua_gettop(L);
      lua_pushvalue(L, 4);
      lua_pushvalue(L, 6);
      lua_pushvalue(L, 5);
      lua_call(L, 2, LUA_MULTRET);
      return (lua_gettop(L) - lc161);
      assert(lua_gettop(L) == 8);
    } else {
      enum { lc162 = 8 };
      lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
      lua_pushvalue(L, 7);
      lua_call(L, 1, 1);
      const int lc163 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc163) {
        lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
        const int lc164 = lua_gettop(L);
        lua_pushvalue(L, 6);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 106);
        lua_pushvalue(L, 7);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc164), 0);
        assert(lua_gettop(L) == 8);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 105);
        lua_pushvalue(L, 7);
        lua_call(L, 1, 1);
        lua_replace(L, 7);
        assert(lua_gettop(L) == 8);
      } else {
        enum { lc165 = 8 };
        lc_getupvalue(L, lua_upvalueindex(1), 0, 99);
        lua_pushvalue(L, 7);
        lua_call(L, 1, 1);
        const int lc166 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc166) {
          lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
          const int lc167 = lua_gettop(L);
          lua_pushvalue(L, 5);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 98);
          lua_pushvalue(L, 7);
          lua_call(L, 1, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc167), 0);
          assert(lua_gettop(L) == 8);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 97);
          lua_pushvalue(L, 7);
          lua_call(L, 1, 1);
          lua_replace(L, 7);
          assert(lua_gettop(L) == 8);
        } else {
          enum { lc168 = 8 };
          lc_getupvalue(L, lua_upvalueindex(1), 0, 34);
          lua_pushvalue(L, 7);
          lua_call(L, 1, 1);
          const int lc169 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc169) {
            enum { lc170 = 8 };
            if (lua_toboolean(L, 8)) {
              lua_pushboolean(L, 0);
              lua_replace(L, 8);
              assert(lua_gettop(L) == 8);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 31);
              lua_pushvalue(L, 7);
              lua_call(L, 1, 1);
              lua_replace(L, 7);
              assert(lua_gettop(L) == 8);
            } else {
              const int lc171 = lua_gettop(L);
              lua_pushvalue(L, 3);
              lua_call(L, 0, LUA_MULTRET);
              return (lua_gettop(L) - lc171);
              assert(lua_gettop(L) == 8);
            }
            lua_settop(L, lc170);
            assert(lua_gettop(L) == 8);
          } else {
            const int lc172 = lua_gettop(L);
            lua_pushvalue(L, 2);
            lua_call(L, 0, LUA_MULTRET);
            return (lua_gettop(L) - lc172);
            assert(lua_gettop(L) == 8);
          }
          lua_settop(L, lc168);
        }
        lua_settop(L, lc165);
      }
      lua_settop(L, lc162);
    }
    lua_settop(L, lc159);
    assert(lua_gettop(L) == 8);
  }
  lua_settop(L, lc158);
  assert(lua_gettop(L) == 8);
  return 0;
}
static int lcf1_name_unlazy1_p3(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc173 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 33);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc174 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc174) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 28);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc173);
  assert(lua_gettop(L) == 1);
  enum { lc175 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 33);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc176 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc176) {
    lua_pushnil(L);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc175);
  assert(lua_gettop(L) == 1);
  enum { lc177 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 103);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc178 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc178) {
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc177);
  assert(lua_gettop(L) == 1);
  enum { lc179 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 93);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc180 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc180) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc179);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 92);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 2);
  enum { lc181 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 33);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  const int lc182 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc182) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 28);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc181);
  assert(lua_gettop(L) == 2);
  enum { lc183 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 33);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  const int lc184 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc184) {
    lua_pushnil(L);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc183);
  assert(lua_gettop(L) == 2);
  enum { lc185 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 103);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc186 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc186) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc185);
  assert(lua_gettop(L) == 2);
  const int lc187 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 101);
  lua_pushvalue(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 63);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc187);
  assert(lua_gettop(L) == 2);
}
static int lcf1_make_enviroment_null_v(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lua_createtable(L, 3, 0);
  lua_pushboolean(L, 1);
  lua_rawseti(L, -2, 1);
  lua_newtable(L);
  lua_rawseti(L, -2, 2);
  lua_pushnil(L);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf1_enviroment_null_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc188 = 1 };
  lua_pushnumber(L, 1);
  lua_gettable(L, 1);
  const int lc189 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc189) {
    const int lc190 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 123);
    lua_pushnumber(L, 2);
    lua_gettable(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc190);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc188);
  assert(lua_gettop(L) == 1);
  lua_pushboolean(L, 0);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_enviroment_helper_print0(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 29);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 3);
  enum { lc191 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 103);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc192 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc192) {
    lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
    const int lc193 = lua_gettop(L);
    lua_pushvalue(L, 3);
    lua_pushliteral(L, "^");
    lc_getupvalue(L, lua_upvalueindex(1), 0, 102);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc193), 0);
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc194 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 99);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    const int lc195 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc195) {
      lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
      lua_pushvalue(L, 3);
      lua_pushliteral(L, ".");
      lua_call(L, 2, 0);
      assert(lua_gettop(L) == 3);
      lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
      const int lc196 = lua_gettop(L);
      lua_pushvalue(L, 2);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 98);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 97);
      lua_pushvalue(L, 1);
      lua_call(L, 1, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc196), 0);
      assert(lua_gettop(L) == 3);
    } else {
      enum { lc197 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 0, 95);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      const int lc198 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc198) {
        lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
        lua_pushvalue(L, 3);
        lua_pushliteral(L, "_");
        lua_call(L, 2, 0);
        assert(lua_gettop(L) == 3);
      } else {
        enum { lc199 = 3 };
        lc_getupvalue(L, lua_upvalueindex(1), 0, 93);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        const int lc200 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc200) {
          lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
          lua_pushvalue(L, 3);
          lua_pushliteral(L, "#");
          lua_call(L, 2, 0);
          assert(lua_gettop(L) == 3);
          lc_getupvalue(L, lua_upvalueindex(1), 2, 1);
          const int lc201 = lua_gettop(L);
          lua_pushvalue(L, 2);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 92);
          lua_pushvalue(L, 1);
          lua_call(L, 1, 1);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 91);
          lua_pushvalue(L, 1);
          lua_call(L, 1, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc201), 0);
          assert(lua_gettop(L) == 3);
        } else {
          const int lc202 = lua_gettop(L);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 125);
          lua_call(L, 0, LUA_MULTRET);
          return (lua_gettop(L) - lc202);
          assert(lua_gettop(L) == 3);
        }
        lua_settop(L, lc199);
      }
      lua_settop(L, lc197);
    }
    lua_settop(L, lc194);
  }
  lua_settop(L, lc191);
  assert(lua_gettop(L) == 3);
  return 0;
}
static int lcf1_enviroment_helper_print_step(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_newtable(L);
  assert(lua_gettop(L) == 2);
  lua_newtable(L);
  assert(lua_gettop(L) == 3);
  enum { lc203 = 3 };
  lua_getglobal(L, "ipairs");
  lua_pushvalue(L, 1);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 2);
    if (lua_isnil(L, -2)) {
      break;
    }
    lua_pushvalue(L, -2);
    lua_replace(L, -4);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 23);
    lua_pushvalue(L, 8);
    lua_pushvalue(L, 2);
    lua_pushvalue(L, 3);
    lua_call(L, 3, 0);
    assert(lua_gettop(L) == 8);
    lua_pop(L, 2);
  }
  lua_settop(L, lc203);
  assert(lua_gettop(L) == 3);
  lua_createtable(L, 2, 0);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 2);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_enviroment_helper_node_expand(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 22);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 2);
  lua_pushnumber(L, 1);
  lua_gettable(L, 2);
  assert(lua_gettop(L) == 3);
  lua_pushnumber(L, 2);
  lua_gettable(L, 2);
  assert(lua_gettop(L) == 4);
  lua_newtable(L);
  assert(lua_gettop(L) == 5);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 124);
  lua_len(L, 3);
  lua_pushnumber(L, 0);
  const int lc205 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc205);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 5);
  lua_createtable(L, 3, 0);
  lua_pushboolean(L, 0);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 4);
  lua_rawseti(L, -2, 2);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  lua_rawseti(L, -2, 3);
  lua_len(L, 3);
  lua_gettable(L, 3);
  lua_insert(L, -2);
  lua_settable(L, 5);
  assert(lua_gettop(L) == 5);
  lua_createtable(L, 3, 0);
  lua_pushboolean(L, 1);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 5);
  lua_rawseti(L, -2, 2);
  lua_pushnil(L);
  lua_rawseti(L, -2, 3);
  assert(lua_gettop(L) == 6);
  lua_len(L, 3);
  lua_pushnumber(L, 2);
  lc_sub(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  assert(lua_gettop(L) == 7);
  enum { lc208 = 7 };
  while (1) {
    lua_pushnumber(L, 0);
    const int lc209 = lc_le(L, -1, 7);
    lua_pop(L, 1);
    lua_pushboolean(L, lc209);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lua_newtable(L);
    assert(lua_gettop(L) == 8);
    lua_pushvalue(L, 6);
    lua_pushnumber(L, 1);
    lc_add(L, 7, -1);
    lua_remove(L, -2);
    lua_gettable(L, 3);
    lua_insert(L, -2);
    lua_settable(L, 8);
    assert(lua_gettop(L) == 8);
    lua_createtable(L, 3, 0);
    lua_pushboolean(L, 1);
    lua_rawseti(L, -2, 1);
    lua_pushvalue(L, 8);
    lua_rawseti(L, -2, 2);
    lua_pushnil(L);
    lua_rawseti(L, -2, 3);
    lua_replace(L, 6);
    assert(lua_gettop(L) == 8);
    lua_pushnumber(L, 1);
    lc_sub(L, 7, -1);
    lua_remove(L, -2);
    lua_replace(L, 7);
    assert(lua_gettop(L) == 8);
    lua_pop(L, 1);
  }
  lua_settop(L, lc208);
  assert(lua_gettop(L) == 7);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 6);
  lua_pushvalue(L, 6);
  return 1;
  assert(lua_gettop(L) == 6);
}
static int lcf1_enviroment_helper_tree_shadow_copy(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_createtable(L, 3, 0);
  lua_pushboolean(L, 1);
  lua_rawseti(L, -2, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 122);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  lua_call(L, 1, 1);
  lua_rawseti(L, -2, 2);
  lua_pushnil(L);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf242(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc241 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 19);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 141);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 140);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 137);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 141);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 139);
  lua_call(L, 5, LUA_MULTRET);
  return (lua_gettop(L) - lc241);
  assert(lua_gettop(L) == 0);
}
static int lcf245(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc244 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 19);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 21);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 135);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 136);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 137);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 138);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 139);
  lua_call(L, 5, LUA_MULTRET);
  return (lua_gettop(L) - lc244);
  assert(lua_gettop(L) == 0);
}
static int lcf1_enviroment_set_helper(lua_State *L) {
  lua_checkstack(L, 27);
  enum { lc_nformalargs = 5 };
  lua_settop(L, 5);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc210 = 6 };
  assert((lua_gettop(L) == lc210));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 135);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 136);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 137);
  lua_pushvalue(L, 4);
  lua_rawseti(L, -2, 138);
  lua_pushvalue(L, 5);
  lua_rawseti(L, -2, 139);
  enum { lc211 = 6 };
  lc_getupvalue(L, lc210, 0, 136);
  lua_len(L, -1);
  lua_pop(L, 1);
  lua_pushnumber(L, 0);
  const int lc213 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc213);
  const int lc214 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc214) {
    lc_getupvalue(L, lc210, 1, 124);
    lc_getupvalue(L, lc210, 1, 24);
    lc_getupvalue(L, lc210, 0, 135);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      lua_pop(L, 1);
      lc_getupvalue(L, lc210, 0, 135);
      lua_pushnumber(L, 1);
      lua_gettable(L, -2);
      lua_remove(L, -2);
      lua_pushboolean(L, 0);
      const int lc215 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc215);
      if (lua_toboolean(L, -1)) {
        lua_pop(L, 1);
        lc_getupvalue(L, lc210, 0, 135);
        lua_pushnumber(L, 2);
        lua_gettable(L, -2);
        lua_remove(L, -2);
        lua_pushliteral(L, "length");
        lua_gettable(L, -2);
        lua_remove(L, -2);
        lua_pushnumber(L, 0);
        const int lc216 = lua_compare(L, -2, -1, LUA_OPEQ);
        lua_pop(L, 2);
        lua_pushboolean(L, lc216);
      }
    }
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 6);
    lua_pushboolean(L, 0);
    lc_getupvalue(L, lc210, 0, 138);
    lua_insert(L, -2);
    lua_pushnumber(L, 1);
    lua_insert(L, -2);
    lua_settable(L, -3);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 6);
    lc_getupvalue(L, lc210, 0, 136);
    lc_getupvalue(L, lc210, 0, 138);
    lua_insert(L, -2);
    lua_pushnumber(L, 2);
    lua_insert(L, -2);
    lua_settable(L, -3);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 6);
    lc_getupvalue(L, lc210, 0, 137);
    lc_getupvalue(L, lc210, 0, 138);
    lua_insert(L, -2);
    lua_pushnumber(L, 3);
    lua_insert(L, -2);
    lua_settable(L, -3);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 6);
    const int lc217 = lua_gettop(L);
    lc_getupvalue(L, lc210, 1, 121);
    lc_getupvalue(L, lc210, 0, 139);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc217);
    assert(lua_gettop(L) == 6);
  }
  lua_settop(L, lc211);
  assert(lua_gettop(L) == 6);
  enum { lc218 = 6 };
  lc_getupvalue(L, lc210, 0, 135);
  lua_pushnumber(L, 1);
  lua_gettable(L, -2);
  lua_remove(L, -2);
  const int lc219 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc219) {
    lc_getupvalue(L, lc210, 1, 20);
    lc_getupvalue(L, lc210, 0, 135);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 7);
    lua_pushnumber(L, 1);
    lua_gettable(L, 7);
    lc_getupvalue(L, lc210, 0, 138);
    lua_insert(L, -2);
    lua_pushnumber(L, 1);
    lua_insert(L, -2);
    lua_settable(L, -3);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 7);
    lua_pushnumber(L, 2);
    lua_gettable(L, 7);
    lc_getupvalue(L, lc210, 0, 138);
    lua_insert(L, -2);
    lua_pushnumber(L, 2);
    lua_insert(L, -2);
    lua_settable(L, -3);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 7);
    lua_pushnumber(L, 3);
    lua_gettable(L, 7);
    lc_getupvalue(L, lc210, 0, 138);
    lua_insert(L, -2);
    lua_pushnumber(L, 3);
    lua_insert(L, -2);
    lua_settable(L, -3);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 7);
    lc_getupvalue(L, lc210, 0, 138);
    assert(lua_gettop(L) == 8);
    lc_getupvalue(L, lc210, 1, 22);
    lc_getupvalue(L, lc210, 0, 136);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 9);
    lua_pushnumber(L, 1);
    lua_gettable(L, 9);
    assert(lua_gettop(L) == 10);
    lc_newclosuretable(L, lc210);
    enum { lc220 = 11 };
    assert((lua_gettop(L) == lc220));
    lua_pushnumber(L, 2);
    lua_gettable(L, 9);
    lua_rawseti(L, lc220, 140);
    assert(lua_gettop(L) == 11);
    lc_newclosuretable(L, lc220);
    enum { lc221 = 12 };
    assert((lua_gettop(L) == lc221));
    lua_pushvalue(L, 8);
    lua_rawseti(L, lc221, 141);
    assert(lua_gettop(L) == 12);
    lua_pushnumber(L, 0);
    assert(lua_gettop(L) == 13);
    enum { lc222 = 13 };
    while (1) {
      lua_len(L, 10);
      const int lc224 = lua_compare(L, 13, -1, LUA_OPLT);
      lua_pop(L, 1);
      lua_pushboolean(L, lc224);
      if (!(lua_toboolean(L, -1))) {
        break;
      }
      lua_pop(L, 1);
      lua_pushnumber(L, 1);
      lc_add(L, 13, -1);
      lua_remove(L, -2);
      lua_gettable(L, 10);
      assert(lua_gettop(L) == 14);
      lua_pushnil(L);
      assert(lua_gettop(L) == 15);
      enum { lc225 = 15 };
      lc_getupvalue(L, lc221, 0, 141);
      lua_pushnumber(L, 2);
      lua_gettable(L, -2);
      lua_remove(L, -2);
      lua_pushvalue(L, 14);
      lua_gettable(L, -2);
      lua_remove(L, -2);
      lua_pushnil(L);
      const int lc226 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc226);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc227 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc227) {
        lc_getupvalue(L, lc221, 0, 141);
        lua_pushnumber(L, 2);
        lua_gettable(L, -2);
        lua_remove(L, -2);
        lua_pushvalue(L, 14);
        lua_gettable(L, -2);
        lua_remove(L, -2);
        assert(lua_gettop(L) == 16);
        enum { lc228 = 16 };
        lua_pushnumber(L, 0);
        lua_gettable(L, 16);
        const int lc229 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc229) {
          lc_getupvalue(L, lc221, 3, 20);
          lua_pushvalue(L, 16);
          lua_call(L, 1, 1);
          lua_replace(L, 15);
          assert(lua_gettop(L) == 16);
        } else {
          enum { lc230 = 16 };
          lua_pushnumber(L, 1);
          lua_gettable(L, 16);
          lua_pushliteral(L, "length");
          lua_gettable(L, -2);
          lua_remove(L, -2);
          lua_pushnumber(L, 0);
          const int lc231 = lua_compare(L, -2, -1, LUA_OPEQ);
          lua_pop(L, 2);
          lua_pushboolean(L, lc231);
          const int lc232 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc232) {
            lc_getupvalue(L, lc221, 3, 124);
            lua_pushvalue(L, 13);
            lua_len(L, 10);
            lua_pushnumber(L, 1);
            lc_sub(L, -2, -1);
            lua_remove(L, -2);
            lua_remove(L, -2);
            const int lc234 = lua_compare(L, -2, -1, LUA_OPEQ);
            lua_pop(L, 2);
            lua_pushboolean(L, lc234);
            lua_call(L, 1, 0);
            assert(lua_gettop(L) == 16);
            lc_getupvalue(L, lc221, 3, 25);
            lua_call(L, 0, 1);
            assert(lua_gettop(L) == 17);
            lua_pushvalue(L, 17);
            lc_getupvalue(L, lc221, 0, 141);
            lua_pushnumber(L, 2);
            lua_gettable(L, -2);
            lua_remove(L, -2);
            lua_insert(L, -2);
            lua_pushvalue(L, 14);
            lua_insert(L, -2);
            lua_settable(L, -3);
            lua_pop(L, 1);
            assert(lua_gettop(L) == 17);
            lua_pushboolean(L, 0);
            lua_pushnumber(L, 1);
            lua_insert(L, -2);
            lua_settable(L, 17);
            assert(lua_gettop(L) == 17);
            lc_getupvalue(L, lc221, 1, 140);
            lua_pushnumber(L, 2);
            lua_insert(L, -2);
            lua_settable(L, 17);
            assert(lua_gettop(L) == 17);
            lc_getupvalue(L, lc221, 2, 137);
            lua_pushnumber(L, 3);
            lua_insert(L, -2);
            lua_settable(L, 17);
            assert(lua_gettop(L) == 17);
            const int lc235 = lua_gettop(L);
            lc_getupvalue(L, lc221, 3, 121);
            lc_getupvalue(L, lc221, 2, 139);
            lua_call(L, 1, LUA_MULTRET);
            return (lua_gettop(L) - lc235);
            assert(lua_gettop(L) == 17);
          }
          lua_settop(L, lc230);
          assert(lua_gettop(L) == 16);
          lc_getupvalue(L, lc221, 3, 21);
          lua_pushvalue(L, 16);
          lua_call(L, 1, 1);
          lua_replace(L, 15);
          assert(lua_gettop(L) == 16);
        }
        lua_settop(L, lc228);
        assert(lua_gettop(L) == 16);
      } else {
        lua_createtable(L, 3, 0);
        lua_pushboolean(L, 1);
        lua_rawseti(L, -2, 1);
        lua_newtable(L);
        lua_rawseti(L, -2, 2);
        lua_pushnil(L);
        lua_rawseti(L, -2, 3);
        lua_replace(L, 15);
        assert(lua_gettop(L) == 15);
      }
      lua_settop(L, lc225);
      assert(lua_gettop(L) == 15);
      lc_getupvalue(L, lc221, 3, 124);
      lua_pushnil(L);
      const int lc236 = lua_compare(L, 15, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc236);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      lua_call(L, 1, 0);
      assert(lua_gettop(L) == 15);
      lua_pushvalue(L, 15);
      lc_getupvalue(L, lc221, 0, 141);
      lua_pushnumber(L, 2);
      lua_gettable(L, -2);
      lua_remove(L, -2);
      lua_insert(L, -2);
      lua_pushvalue(L, 14);
      lua_insert(L, -2);
      lua_settable(L, -3);
      lua_pop(L, 1);
      assert(lua_gettop(L) == 15);
      lua_pushvalue(L, 15);
      lc_setupvalue(L, lc221, 0, 141);
      assert(lua_gettop(L) == 15);
      lua_pushnumber(L, 1);
      lc_add(L, 13, -1);
      lua_remove(L, -2);
      lua_replace(L, 13);
      assert(lua_gettop(L) == 15);
      lua_pop(L, 2);
    }
    lua_settop(L, lc222);
    assert(lua_gettop(L) == 13);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 12);
    enum { lc237 = 12 };
    lc_getupvalue(L, lc221, 3, 24);
    lc_getupvalue(L, lc221, 0, 141);
    lua_call(L, 1, 1);
    const int lc238 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc238) {
      lc_getupvalue(L, lc221, 0, 141);
      assert(lua_gettop(L) == 13);
      lua_pushboolean(L, 0);
      lua_pushnumber(L, 1);
      lua_insert(L, -2);
      lua_settable(L, 13);
      assert(lua_gettop(L) == 13);
      lc_getupvalue(L, lc221, 1, 140);
      lua_pushnumber(L, 2);
      lua_insert(L, -2);
      lua_settable(L, 13);
      assert(lua_gettop(L) == 13);
      lc_getupvalue(L, lc221, 2, 137);
      lua_pushnumber(L, 3);
      lua_insert(L, -2);
      lua_settable(L, 13);
      assert(lua_gettop(L) == 13);
      const int lc239 = lua_gettop(L);
      lc_getupvalue(L, lc221, 3, 121);
      lc_getupvalue(L, lc221, 2, 139);
      lua_call(L, 1, LUA_MULTRET);
      return (lua_gettop(L) - lc239);
      assert(lua_gettop(L) == 13);
    } else {
      const int lc240 = lua_gettop(L);
      lc_getupvalue(L, lc221, 3, 120);
      lua_pushvalue(L, lc221);
      lua_pushcclosure(L, lcf242, 1);
      lua_call(L, 1, LUA_MULTRET);
      return (lua_gettop(L) - lc240);
      assert(lua_gettop(L) == 12);
    }
    lua_settop(L, lc237);
    assert(lua_gettop(L) == 12);
  } else {
    const int lc243 = lua_gettop(L);
    lc_getupvalue(L, lc210, 1, 120);
    lua_pushvalue(L, lc210);
    lua_pushcclosure(L, lcf245, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc243);
    assert(lua_gettop(L) == 6);
  }
  lua_settop(L, lc218);
  assert(lua_gettop(L) == 6);
  const int lc246 = lua_gettop(L);
  lc_getupvalue(L, lc210, 1, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc246);
  assert(lua_gettop(L) == 6);
}
static int lcf1_env_set(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lua_newtable(L);
  assert(lua_gettop(L) == 4);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 5);
  enum { lc247 = 5 };
  while (1) {
    lua_len(L, 1);
    const int lc249 = lua_compare(L, 5, -1, LUA_OPLT);
    lua_pop(L, 1);
    lua_pushboolean(L, lc249);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    enum { lc250 = 5 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 4);
    lua_pushnumber(L, 0);
    lc_add(L, 5, -1);
    lua_remove(L, -2);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 1);
    const int lc251 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc251) {
      lua_pushvalue(L, 2);
      lua_pushnumber(L, 0);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_insert(L, -2);
      lua_settable(L, 4);
      assert(lua_gettop(L) == 5);
      lua_pushvalue(L, 3);
      lua_pushnumber(L, 1);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_insert(L, -2);
      lua_settable(L, 4);
      assert(lua_gettop(L) == 5);
      lua_pushnumber(L, 2);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_replace(L, 5);
      assert(lua_gettop(L) == 5);
      enum { lc252 = 5 };
      while (1) {
        lua_len(L, 1);
        const int lc254 = lua_compare(L, 5, -1, LUA_OPLT);
        lua_pop(L, 1);
        lua_pushboolean(L, lc254);
        if (!(lua_toboolean(L, -1))) {
          break;
        }
        lua_pop(L, 1);
        lua_pushnumber(L, 0);
        lc_add(L, 5, -1);
        lua_remove(L, -2);
        lua_pushnumber(L, 1);
        lc_add(L, -2, -1);
        lua_remove(L, -2);
        lua_remove(L, -2);
        lua_gettable(L, 1);
        lua_pushnumber(L, 0);
        lc_add(L, 5, -1);
        lua_remove(L, -2);
        lua_pushnumber(L, 1);
        lc_add(L, -2, -1);
        lua_remove(L, -2);
        lua_remove(L, -2);
        lua_insert(L, -2);
        lua_settable(L, 4);
        assert(lua_gettop(L) == 5);
        lua_pushnumber(L, 1);
        lc_add(L, 5, -1);
        lua_remove(L, -2);
        lua_pushnumber(L, 1);
        lc_add(L, -2, -1);
        lua_remove(L, -2);
        lua_remove(L, -2);
        lua_gettable(L, 1);
        lua_pushnumber(L, 1);
        lc_add(L, 5, -1);
        lua_remove(L, -2);
        lua_pushnumber(L, 1);
        lc_add(L, -2, -1);
        lua_remove(L, -2);
        lua_remove(L, -2);
        lua_insert(L, -2);
        lua_settable(L, 4);
        assert(lua_gettop(L) == 5);
        lua_pushnumber(L, 2);
        lc_add(L, 5, -1);
        lua_remove(L, -2);
        lua_replace(L, 5);
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc252);
      assert(lua_gettop(L) == 5);
      assert(lua_gettop(L) == 5);
      lua_pushvalue(L, 4);
      return 1;
      assert(lua_gettop(L) == 5);
    } else {
      lua_pushnumber(L, 0);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_gettable(L, 1);
      lua_pushnumber(L, 0);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_insert(L, -2);
      lua_settable(L, 4);
      assert(lua_gettop(L) == 5);
      lua_pushnumber(L, 1);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_gettable(L, 1);
      lua_pushnumber(L, 1);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_insert(L, -2);
      lua_settable(L, 4);
      assert(lua_gettop(L) == 5);
    }
    lua_settop(L, lc250);
    assert(lua_gettop(L) == 5);
    lua_pushnumber(L, 2);
    lc_add(L, 5, -1);
    lua_remove(L, -2);
    lua_replace(L, 5);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc247);
  assert(lua_gettop(L) == 5);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 2);
  lua_len(L, 1);
  lua_pushnumber(L, 0);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lua_insert(L, -2);
  lua_settable(L, 4);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 3);
  lua_len(L, 1);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lua_insert(L, -2);
  lua_settable(L, 4);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 4);
  return 1;
  assert(lua_gettop(L) == 4);
}
static int lcf1_env_get(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 4);
  enum { lc257 = 4 };
  while (1) {
    lua_len(L, 1);
    const int lc259 = lua_compare(L, 4, -1, LUA_OPLT);
    lua_pop(L, 1);
    lua_pushboolean(L, lc259);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    enum { lc260 = 4 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 4);
    lua_pushnumber(L, 0);
    lc_add(L, 4, -1);
    lua_remove(L, -2);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 1);
    const int lc261 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc261) {
      lua_pushnumber(L, 1);
      lc_add(L, 4, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_gettable(L, 1);
      return 1;
      assert(lua_gettop(L) == 4);
    }
    lua_settop(L, lc260);
    assert(lua_gettop(L) == 4);
    lua_pushnumber(L, 2);
    lc_add(L, 4, -1);
    lua_remove(L, -2);
    lua_replace(L, 4);
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc257);
  assert(lua_gettop(L) == 4);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, 3);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_must_env_get(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 3);
  enum { lc262 = 3 };
  while (1) {
    lua_len(L, 1);
    const int lc264 = lua_compare(L, 3, -1, LUA_OPLT);
    lua_pop(L, 1);
    lua_pushboolean(L, lc264);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    enum { lc265 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 4);
    lua_pushnumber(L, 0);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 1);
    const int lc266 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc266) {
      lua_pushnumber(L, 1);
      lc_add(L, 3, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_gettable(L, 1);
      return 1;
      assert(lua_gettop(L) == 3);
    }
    lua_settop(L, lc265);
    assert(lua_gettop(L) == 3);
    lua_pushnumber(L, 2);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc262);
  assert(lua_gettop(L) == 3);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 2);
  const int lc267 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc267);
  assert(lua_gettop(L) == 2);
}
static int lcf1_env2val(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 96);
  assert(lua_gettop(L) == 2);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 3);
  enum { lc268 = 3 };
  while (1) {
    lua_len(L, 1);
    const int lc270 = lua_compare(L, 3, -1, LUA_OPLT);
    lua_pop(L, 1);
    lua_pushboolean(L, lc270);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 100);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 37);
    lua_pushnumber(L, 0);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_pushnumber(L, 1);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_call(L, 2, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 1);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 3);
    lua_pushnumber(L, 2);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc268);
  assert(lua_gettop(L) == 3);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 2);
  const int lc271 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 94);
  const int lc272 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 60);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 37);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc272), LUA_MULTRET);
  return (lua_gettop(L) - lc271);
  assert(lua_gettop(L) == 2);
}
static int lcf1_env_foreach(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 3);
  enum { lc273 = 3 };
  while (1) {
    lua_len(L, 1);
    const int lc275 = lua_compare(L, 3, -1, LUA_OPLT);
    lua_pop(L, 1);
    lua_pushboolean(L, lc275);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lua_pushvalue(L, 2);
    lua_pushnumber(L, 0);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_pushnumber(L, 1);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_pushnumber(L, 1);
    lc_add(L, -2, -1);
    lua_remove(L, -2);
    lua_remove(L, -2);
    lua_gettable(L, 1);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 3);
    lua_pushnumber(L, 2);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc273);
  assert(lua_gettop(L) == 3);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_error_v(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc281 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 39);
  const int lc282 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 64);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 37);
  const int lc283 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 43);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 37);
  const int lc284 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 47);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 14);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 142);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 144);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc284), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc283), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc282), LUA_MULTRET);
  return (lua_gettop(L) - lc281);
  assert(lua_gettop(L) == 0);
}
static int lcf288(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 143);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf358(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  enum { lc289 = 2 };
  lua_len(L, 1);
  lua_pushnumber(L, 0);
  const int lc291 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc291);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc292 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc292) {
    lua_getglobal(L, "error");
    lua_pushliteral(L, "WIP");
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc289);
  assert(lua_gettop(L) == 2);
  enum { lc293 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 3, 4);
  lua_pushnumber(L, 1);
  lua_gettable(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 42);
  lua_call(L, 2, 1);
  const int lc294 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc294) {
    enum { lc295 = 2 };
    lua_len(L, 2);
    lua_pushnumber(L, 1);
    const int lc297 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc297);
    const int lc298 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc298) {
      const int lc299 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
      lua_call(L, 0, LUA_MULTRET);
      return (lua_gettop(L) - lc299);
      assert(lua_gettop(L) == 2);
    }
    lua_settop(L, lc295);
    assert(lua_gettop(L) == 2);
    lua_pushnumber(L, 2);
    lua_gettable(L, 2);
    assert(lua_gettop(L) == 3);
    lua_newtable(L);
    assert(lua_gettop(L) == 4);
    lua_pushnumber(L, 2);
    assert(lua_gettop(L) == 5);
    enum { lc300 = 5 };
    while (1) {
      lua_len(L, 2);
      const int lc302 = lua_compare(L, 5, -1, LUA_OPLT);
      lua_pop(L, 1);
      lua_pushboolean(L, lc302);
      if (!(lua_toboolean(L, -1))) {
        break;
      }
      lua_pop(L, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 5, 1);
      lua_pushvalue(L, 4);
      lua_pushnumber(L, 1);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_gettable(L, 2);
      lua_call(L, 2, 0);
      assert(lua_gettop(L) == 5);
      lua_pushnumber(L, 1);
      lc_add(L, 5, -1);
      lua_remove(L, -2);
      lua_replace(L, 5);
      assert(lua_gettop(L) == 5);
    }
    lua_settop(L, lc300);
    assert(lua_gettop(L) == 5);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 4);
    const int lc303 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 3, 84);
    lc_getupvalue(L, lua_upvalueindex(1), 2, 142);
    lua_pushvalue(L, 3);
    lua_pushvalue(L, 4);
    lua_call(L, 3, LUA_MULTRET);
    return (lua_gettop(L) - lc303);
    assert(lua_gettop(L) == 4);
  } else {
    enum { lc304 = 2 };
    lc_getupvalue(L, lua_upvalueindex(1), 3, 4);
    lua_pushnumber(L, 1);
    lua_gettable(L, 2);
    lc_getupvalue(L, lua_upvalueindex(1), 3, 41);
    lua_call(L, 2, 1);
    const int lc305 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc305) {
      enum { lc306 = 2 };
      lua_len(L, 2);
      lua_pushnumber(L, 1);
      const int lc308 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc308);
      const int lc309 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc309) {
        const int lc310 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc310);
        assert(lua_gettop(L) == 2);
      }
      lua_settop(L, lc306);
      assert(lua_gettop(L) == 2);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 30);
      const int lc311 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 88);
      lc_getupvalue(L, lua_upvalueindex(1), 2, 142);
      lua_pushnumber(L, 2);
      lua_gettable(L, 2);
      lua_call(L, 2, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc311), 1);
      assert(lua_gettop(L) == 3);
      enum { lc312 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 93);
      lua_pushvalue(L, 3);
      lua_call(L, 1, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc313 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc313) {
        const int lc314 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc314);
        assert(lua_gettop(L) == 3);
      }
      lua_settop(L, lc312);
      assert(lua_gettop(L) == 3);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 31);
      const int lc315 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 92);
      lua_pushvalue(L, 3);
      lua_call(L, 1, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc315), 1);
      assert(lua_gettop(L) == 4);
      enum { lc316 = 4 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 34);
      lua_pushvalue(L, 4);
      lua_call(L, 1, 1);
      const int lc317 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc317) {
        lc_getupvalue(L, lua_upvalueindex(1), 2, 143);
        return 1;
        assert(lua_gettop(L) == 4);
      }
      lua_settop(L, lc316);
      assert(lua_gettop(L) == 4);
      enum { lc318 = 4 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 103);
      lua_pushvalue(L, 4);
      lua_call(L, 1, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc319 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc319) {
        const int lc320 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc320);
        assert(lua_gettop(L) == 4);
      }
      lua_settop(L, lc318);
      assert(lua_gettop(L) == 4);
      enum { lc321 = 4 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 101);
      lua_pushvalue(L, 4);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 61);
      lua_call(L, 2, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc322 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc322) {
        const int lc323 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc323);
        assert(lua_gettop(L) == 4);
      }
      lua_settop(L, lc321);
      assert(lua_gettop(L) == 4);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 31);
      const int lc324 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 91);
      lua_pushvalue(L, 3);
      lua_call(L, 1, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc324), 1);
      assert(lua_gettop(L) == 5);
      enum { lc325 = 5 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 34);
      lua_pushvalue(L, 5);
      lua_call(L, 1, 1);
      const int lc326 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc326) {
        lc_getupvalue(L, lua_upvalueindex(1), 2, 143);
        return 1;
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc325);
      assert(lua_gettop(L) == 5);
      enum { lc327 = 5 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 99);
      lua_pushvalue(L, 5);
      lua_call(L, 1, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc328 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc328) {
        const int lc329 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc329);
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc327);
      assert(lua_gettop(L) == 5);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 98);
      lua_pushvalue(L, 5);
      lua_call(L, 1, 1);
      assert(lua_gettop(L) == 6);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 31);
      const int lc330 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 97);
      lua_pushvalue(L, 5);
      lua_call(L, 1, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc330), 1);
      assert(lua_gettop(L) == 7);
      enum { lc331 = 7 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 34);
      lua_pushvalue(L, 7);
      lua_call(L, 1, 1);
      const int lc332 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc332) {
        lc_getupvalue(L, lua_upvalueindex(1), 2, 143);
        return 1;
        assert(lua_gettop(L) == 7);
      }
      lua_settop(L, lc331);
      assert(lua_gettop(L) == 7);
      enum { lc333 = 7 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 95);
      lua_pushvalue(L, 7);
      lua_call(L, 1, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc334 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc334) {
        const int lc335 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc335);
        assert(lua_gettop(L) == 7);
      }
      lua_settop(L, lc333);
      assert(lua_gettop(L) == 7);
      lua_createtable(L, 1, 0);
      const int lc336 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 14);
      lc_getupvalue(L, lua_upvalueindex(1), 2, 142);
      lua_call(L, 1, LUA_MULTRET);
      while ((lua_gettop(L) > lc336)) {
        lua_rawseti(L, lc336, (0 + (lua_gettop(L) - lc336)));
      }
      assert(lua_gettop(L) == 8);
      lua_pushnumber(L, 2);
      assert(lua_gettop(L) == 9);
      enum { lc337 = 9 };
      while (1) {
        lua_len(L, 2);
        const int lc339 = lua_compare(L, 9, -1, LUA_OPLT);
        lua_pop(L, 1);
        lua_pushboolean(L, lc339);
        if (!(lua_toboolean(L, -1))) {
          break;
        }
        lua_pop(L, 1);
        lc_getupvalue(L, lua_upvalueindex(1), 5, 1);
        lua_pushvalue(L, 8);
        lua_pushnumber(L, 1);
        lc_add(L, 9, -1);
        lua_remove(L, -2);
        lua_gettable(L, 2);
        lua_call(L, 2, 0);
        assert(lua_gettop(L) == 9);
        lua_pushnumber(L, 1);
        lc_add(L, 9, -1);
        lua_remove(L, -2);
        lua_replace(L, 9);
        assert(lua_gettop(L) == 9);
      }
      lua_settop(L, lc337);
      assert(lua_gettop(L) == 9);
      lua_pop(L, 1);
      assert(lua_gettop(L) == 8);
      const int lc340 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 75);
      lua_pushvalue(L, 6);
      lua_pushvalue(L, 8);
      lua_call(L, 2, LUA_MULTRET);
      return (lua_gettop(L) - lc340);
      assert(lua_gettop(L) == 8);
    } else {
      enum { lc341 = 2 };
      lc_getupvalue(L, lua_upvalueindex(1), 3, 4);
      lua_pushnumber(L, 1);
      lua_gettable(L, 2);
      lc_getupvalue(L, lua_upvalueindex(1), 3, 43);
      lua_call(L, 2, 1);
      const int lc342 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc342) {
        enum { lc343 = 2 };
        lua_len(L, 2);
        lua_pushnumber(L, 1);
        const int lc345 = lua_compare(L, -2, -1, LUA_OPEQ);
        lua_pop(L, 2);
        lua_pushboolean(L, lc345);
        const int lc346 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc346) {
          const int lc347 = lua_gettop(L);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 145);
          lua_call(L, 0, LUA_MULTRET);
          return (lua_gettop(L) - lc347);
          assert(lua_gettop(L) == 2);
        }
        lua_settop(L, lc343);
        assert(lua_gettop(L) == 2);
        lua_pushnumber(L, 2);
        lua_gettable(L, 2);
        assert(lua_gettop(L) == 3);
        lua_newtable(L);
        assert(lua_gettop(L) == 4);
        lua_pushnumber(L, 2);
        assert(lua_gettop(L) == 5);
        enum { lc348 = 5 };
        while (1) {
          lua_len(L, 2);
          const int lc350 = lua_compare(L, 5, -1, LUA_OPLT);
          lua_pop(L, 1);
          lua_pushboolean(L, lc350);
          if (!(lua_toboolean(L, -1))) {
            break;
          }
          lua_pop(L, 1);
          lc_getupvalue(L, lua_upvalueindex(1), 5, 1);
          const int lc351 = lua_gettop(L);
          lua_pushvalue(L, 4);
          lc_getupvalue(L, lua_upvalueindex(1), 3, 88);
          lc_getupvalue(L, lua_upvalueindex(1), 2, 142);
          lua_pushnumber(L, 1);
          lc_add(L, 5, -1);
          lua_remove(L, -2);
          lua_gettable(L, 2);
          lua_call(L, 2, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc351), 0);
          assert(lua_gettop(L) == 5);
          lua_pushnumber(L, 1);
          lc_add(L, 5, -1);
          lua_remove(L, -2);
          lua_replace(L, 5);
          assert(lua_gettop(L) == 5);
        }
        lua_settop(L, lc348);
        assert(lua_gettop(L) == 5);
        lua_pop(L, 1);
        assert(lua_gettop(L) == 4);
        const int lc352 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 3, 79);
        lua_pushvalue(L, 3);
        lua_pushvalue(L, 4);
        lua_call(L, 2, LUA_MULTRET);
        return (lua_gettop(L) - lc352);
        assert(lua_gettop(L) == 4);
      } else {
        lc_getupvalue(L, lua_upvalueindex(1), 3, 88);
        lc_getupvalue(L, lua_upvalueindex(1), 2, 142);
        lua_pushnumber(L, 1);
        lua_gettable(L, 2);
        lua_call(L, 2, 1);
        assert(lua_gettop(L) == 3);
        lua_newtable(L);
        assert(lua_gettop(L) == 4);
        lua_pushnumber(L, 1);
        assert(lua_gettop(L) == 5);
        enum { lc353 = 5 };
        while (1) {
          lua_len(L, 2);
          const int lc355 = lua_compare(L, 5, -1, LUA_OPLT);
          lua_pop(L, 1);
          lua_pushboolean(L, lc355);
          if (!(lua_toboolean(L, -1))) {
            break;
          }
          lua_pop(L, 1);
          lc_getupvalue(L, lua_upvalueindex(1), 5, 1);
          const int lc356 = lua_gettop(L);
          lua_pushvalue(L, 4);
          lc_getupvalue(L, lua_upvalueindex(1), 3, 88);
          lc_getupvalue(L, lua_upvalueindex(1), 2, 142);
          lua_pushnumber(L, 1);
          lc_add(L, 5, -1);
          lua_remove(L, -2);
          lua_gettable(L, 2);
          lua_call(L, 2, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc356), 0);
          assert(lua_gettop(L) == 5);
          lua_pushnumber(L, 1);
          lc_add(L, 5, -1);
          lua_remove(L, -2);
          lua_replace(L, 5);
          assert(lua_gettop(L) == 5);
        }
        lua_settop(L, lc353);
        assert(lua_gettop(L) == 5);
        lua_pop(L, 1);
        assert(lua_gettop(L) == 4);
        const int lc357 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 3, 75);
        lua_pushvalue(L, 3);
        lua_pushvalue(L, 4);
        lua_call(L, 2, LUA_MULTRET);
        return (lua_gettop(L) - lc357);
        assert(lua_gettop(L) == 4);
      }
      lua_settop(L, lc341);
    }
    lua_settop(L, lc304);
  }
  lua_settop(L, lc293);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_real_evaluate(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc276 = 4 };
  assert((lua_gettop(L) == lc276));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 142);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 143);
  lc_newclosuretable(L, lc276);
  enum { lc277 = 5 };
  assert((lua_gettop(L) == lc277));
  lc_getupvalue(L, lc276, 1, 31);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_rawseti(L, lc277, 144);
  assert(lua_gettop(L) == 5);
  enum { lc278 = 5 };
  lc_getupvalue(L, lc277, 2, 34);
  lc_getupvalue(L, lc277, 0, 144);
  lua_call(L, 1, 1);
  const int lc279 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc279) {
    lc_getupvalue(L, lc277, 1, 143);
    return 1;
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc278);
  assert(lua_gettop(L) == 5);
  lc_newclosuretable(L, lc277);
  enum { lc280 = 6 };
  assert((lua_gettop(L) == lc280));
  lua_pushvalue(L, lc280);
  lua_pushcclosure(L, lcf1_error_v, 1);
  lua_rawseti(L, lc280, 145);
  assert(lua_gettop(L) == 6);
  enum { lc285 = 6 };
  lc_getupvalue(L, lc280, 3, 99);
  lc_getupvalue(L, lc280, 1, 144);
  lua_call(L, 1, 1);
  const int lc286 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc286) {
    const int lc287 = lua_gettop(L);
    lc_getupvalue(L, lc280, 3, 27);
    lc_getupvalue(L, lc280, 1, 144);
    lc_getupvalue(L, lc280, 0, 145);
    lua_pushvalue(L, lc280);
    lua_pushcclosure(L, lcf288, 1);
    lua_pushvalue(L, lc280);
    lua_pushcclosure(L, lcf358, 1);
    lua_call(L, 4, LUA_MULTRET);
    return (lua_gettop(L) - lc287);
    assert(lua_gettop(L) == 6);
  } else {
    enum { lc359 = 6 };
    lc_getupvalue(L, lc280, 3, 95);
    lc_getupvalue(L, lc280, 1, 144);
    lua_call(L, 1, 1);
    const int lc360 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc360) {
      lc_getupvalue(L, lc280, 1, 144);
      return 1;
      assert(lua_gettop(L) == 6);
    }
    lua_settop(L, lc359);
  }
  lua_settop(L, lc285);
  assert(lua_gettop(L) == 6);
  lc_getupvalue(L, lc280, 3, 26);
  lc_getupvalue(L, lc280, 1, 144);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 7);
  enum { lc361 = 7 };
  lua_pushnil(L);
  const int lc362 = lua_compare(L, 7, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc362);
  const int lc363 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc363) {
    lc_getupvalue(L, lc280, 2, 143);
    return 1;
    assert(lua_gettop(L) == 7);
  }
  lua_settop(L, lc361);
  assert(lua_gettop(L) == 7);
  enum { lc364 = 7 };
  lua_pushboolean(L, 1);
  const int lc365 = lua_compare(L, 7, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc365);
  const int lc366 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc366) {
    const int lc367 = lua_gettop(L);
    lc_getupvalue(L, lc280, 3, 16);
    const int lc368 = lua_gettop(L);
    lc_getupvalue(L, lc280, 2, 142);
    lc_getupvalue(L, lc280, 1, 144);
    lc_getupvalue(L, lc280, 0, 145);
    lua_call(L, 0, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc368), LUA_MULTRET);
    return (lua_gettop(L) - lc367);
    assert(lua_gettop(L) == 7);
  }
  lua_settop(L, lc364);
  assert(lua_gettop(L) == 7);
  const int lc369 = lua_gettop(L);
  lc_getupvalue(L, lc280, 0, 145);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc369);
  assert(lua_gettop(L) == 7);
}
static int lcf2_error_v(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc371 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 39);
  const int lc372 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 64);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 37);
  const int lc373 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 43);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 37);
  const int lc374 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 48);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 37);
  const int lc375 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 146);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 38);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 147);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc375), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc374), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc373), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc372), LUA_MULTRET);
  return (lua_gettop(L) - lc371);
  assert(lua_gettop(L) == 0);
}
static int lcf1_real_apply(lua_State *L) {
  lua_checkstack(L, 25);
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc370 = 4 };
  assert((lua_gettop(L) == lc370));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 146);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 147);
  lua_pushvalue(L, lc370);
  lua_pushcclosure(L, lcf2_error_v, 1);
  assert(lua_gettop(L) == 5);
  lc_getupvalue(L, lc370, 1, 31);
  lc_getupvalue(L, lc370, 0, 146);
  lua_call(L, 1, 1);
  lc_setupvalue(L, lc370, 0, 146);
  assert(lua_gettop(L) == 5);
  enum { lc376 = 5 };
  lc_getupvalue(L, lc370, 1, 34);
  lc_getupvalue(L, lc370, 0, 146);
  lua_call(L, 1, 1);
  const int lc377 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc377) {
    lua_pushvalue(L, 3);
    return 1;
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc376);
  assert(lua_gettop(L) == 5);
  enum { lc378 = 5 };
  lc_getupvalue(L, lc370, 1, 93);
  lc_getupvalue(L, lc370, 0, 146);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc379 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc379) {
    const int lc380 = lua_gettop(L);
    lua_pushvalue(L, 5);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc380);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc378);
  assert(lua_gettop(L) == 5);
  lc_getupvalue(L, lc370, 1, 30);
  const int lc381 = lua_gettop(L);
  lc_getupvalue(L, lc370, 1, 92);
  lc_getupvalue(L, lc370, 0, 146);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc381), 1);
  assert(lua_gettop(L) == 6);
  enum { lc382 = 6 };
  lc_getupvalue(L, lc370, 1, 103);
  lua_pushvalue(L, 6);
  lua_call(L, 1, 1);
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lc_getupvalue(L, lc370, 1, 101);
    lua_pushvalue(L, 6);
    lc_getupvalue(L, lc370, 1, 62);
    lua_call(L, 2, 1);
  }
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc383 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc383) {
    const int lc384 = lua_gettop(L);
    lua_pushvalue(L, 5);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc384);
    assert(lua_gettop(L) == 6);
  }
  lua_settop(L, lc382);
  assert(lua_gettop(L) == 6);
  lc_getupvalue(L, lc370, 1, 30);
  const int lc385 = lua_gettop(L);
  lc_getupvalue(L, lc370, 1, 91);
  lc_getupvalue(L, lc370, 0, 146);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc385), 1);
  assert(lua_gettop(L) == 7);
  enum { lc386 = 7 };
  lc_getupvalue(L, lc370, 1, 99);
  lua_pushvalue(L, 7);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc387 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc387) {
    const int lc388 = lua_gettop(L);
    lua_pushvalue(L, 5);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc388);
    assert(lua_gettop(L) == 7);
  }
  lua_settop(L, lc386);
  assert(lua_gettop(L) == 7);
  lc_getupvalue(L, lc370, 1, 71);
  const int lc389 = lua_gettop(L);
  lc_getupvalue(L, lc370, 1, 98);
  lua_pushvalue(L, 7);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc389), 1);
  assert(lua_gettop(L) == 8);
  lc_getupvalue(L, lc370, 1, 30);
  const int lc390 = lua_gettop(L);
  lc_getupvalue(L, lc370, 1, 97);
  lua_pushvalue(L, 7);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc390), 1);
  assert(lua_gettop(L) == 9);
  enum { lc391 = 9 };
  lc_getupvalue(L, lc370, 1, 99);
  lua_pushvalue(L, 9);
  lua_call(L, 1, 1);
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lc_getupvalue(L, lc370, 1, 95);
    const int lc392 = lua_gettop(L);
    lc_getupvalue(L, lc370, 1, 30);
    const int lc393 = lua_gettop(L);
    lc_getupvalue(L, lc370, 1, 97);
    lua_pushvalue(L, 9);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc393), LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc392), 1);
  }
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc394 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc394) {
    const int lc395 = lua_gettop(L);
    lua_pushvalue(L, 5);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc395);
    assert(lua_gettop(L) == 9);
  }
  lua_settop(L, lc391);
  assert(lua_gettop(L) == 9);
  lc_getupvalue(L, lc370, 1, 98);
  lua_pushvalue(L, 9);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 10);
  lc_getupvalue(L, lc370, 1, 18);
  assert(lua_gettop(L) == 11);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 12);
  enum { lc396 = 12 };
  while (1) {
    lc_getupvalue(L, lc370, 1, 95);
    lua_pushvalue(L, 8);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lc370, 1, 26);
    lua_pushvalue(L, 8);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 13);
    enum { lc397 = 13 };
    lua_pushnil(L);
    const int lc398 = lua_compare(L, 13, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc398);
    const int lc399 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc399) {
      lua_pushvalue(L, 3);
      return 1;
      assert(lua_gettop(L) == 13);
    }
    lua_settop(L, lc397);
    assert(lua_gettop(L) == 13);
    enum { lc400 = 13 };
    lua_pushboolean(L, 1);
    const int lc401 = lua_compare(L, 13, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc401);
    const int lc402 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc402) {
      lc_getupvalue(L, lc370, 1, 96);
      assert(lua_gettop(L) == 14);
      lc_getupvalue(L, lc370, 0, 147);
      lua_len(L, -1);
      lua_pop(L, 1);
      lua_pushnumber(L, 1);
      lc_sub(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      assert(lua_gettop(L) == 15);
      enum { lc404 = 15 };
      while (1) {
        lua_pushboolean(L, lc_le(L, 12, 15));
        if (!(lua_toboolean(L, -1))) {
          break;
        }
        lua_pop(L, 1);
        lc_getupvalue(L, lc370, 1, 100);
        lc_getupvalue(L, lc370, 0, 147);
        lua_pushnumber(L, 1);
        lc_add(L, 15, -1);
        lua_remove(L, -2);
        lua_gettable(L, -2);
        lua_remove(L, -2);
        lua_pushvalue(L, 14);
        lua_call(L, 2, 1);
        lua_replace(L, 14);
        assert(lua_gettop(L) == 15);
        lua_pushnumber(L, 1);
        lc_sub(L, 15, -1);
        lua_remove(L, -2);
        lua_replace(L, 15);
        assert(lua_gettop(L) == 15);
      }
      lua_settop(L, lc404);
      assert(lua_gettop(L) == 15);
      lua_pop(L, 1);
      assert(lua_gettop(L) == 14);
      lc_getupvalue(L, lc370, 1, 17);
      lua_pushvalue(L, 11);
      lua_pushvalue(L, 8);
      lua_pushvalue(L, 14);
      lua_call(L, 3, 1);
      lua_replace(L, 11);
      assert(lua_gettop(L) == 14);
      lc_getupvalue(L, lc370, 0, 147);
      lua_len(L, -1);
      lua_pop(L, 1);
      lua_replace(L, 12);
      assert(lua_gettop(L) == 14);
      lc_getupvalue(L, lc370, 1, 96);
      lua_replace(L, 8);
      assert(lua_gettop(L) == 14);
    } else {
      enum { lc406 = 13 };
      lc_getupvalue(L, lc370, 1, 99);
      lua_pushvalue(L, 8);
      lua_call(L, 1, 1);
      const int lc407 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc407) {
        enum { lc408 = 13 };
        lc_getupvalue(L, lc370, 0, 147);
        lua_len(L, -1);
        lua_pop(L, 1);
        const int lc410 = lua_compare(L, 12, -1, LUA_OPLT);
        lua_pop(L, 1);
        lua_pushboolean(L, lc410);
        const int lc411 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc411) {
          lc_getupvalue(L, lc370, 0, 147);
          lua_pushnumber(L, 1);
          lc_add(L, 12, -1);
          lua_remove(L, -2);
          lua_gettable(L, -2);
          lua_remove(L, -2);
          assert(lua_gettop(L) == 14);
          lua_pushnumber(L, 1);
          lc_add(L, 12, -1);
          lua_remove(L, -2);
          lua_replace(L, 12);
          assert(lua_gettop(L) == 14);
          lc_getupvalue(L, lc370, 1, 17);
          lua_pushvalue(L, 11);
          lc_getupvalue(L, lc370, 1, 98);
          lua_pushvalue(L, 8);
          lua_call(L, 1, 1);
          lua_pushvalue(L, 14);
          lua_call(L, 3, 1);
          lua_replace(L, 11);
          assert(lua_gettop(L) == 14);
          lc_getupvalue(L, lc370, 1, 97);
          lua_pushvalue(L, 8);
          lua_call(L, 1, 1);
          lua_replace(L, 8);
          assert(lua_gettop(L) == 14);
        } else {
          const int lc412 = lua_gettop(L);
          lua_pushvalue(L, 5);
          lua_call(L, 0, LUA_MULTRET);
          return (lua_gettop(L) - lc412);
          assert(lua_gettop(L) == 13);
        }
        lua_settop(L, lc408);
        assert(lua_gettop(L) == 13);
      } else {
        const int lc413 = lua_gettop(L);
        lua_pushvalue(L, 5);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc413);
        assert(lua_gettop(L) == 13);
      }
      lua_settop(L, lc406);
    }
    lua_settop(L, lc400);
    assert(lua_gettop(L) == 13);
    lua_pop(L, 1);
  }
  lua_settop(L, lc396);
  assert(lua_gettop(L) == 12);
  enum { lc414 = 12 };
  lc_getupvalue(L, lc370, 0, 147);
  lua_len(L, -1);
  lua_pop(L, 1);
  const int lc416 = lua_compare(L, -1, 12, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc416);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc417 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc417) {
    const int lc418 = lua_gettop(L);
    lua_pushvalue(L, 5);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc418);
    assert(lua_gettop(L) == 12);
  }
  lua_settop(L, lc414);
  assert(lua_gettop(L) == 12);
  const int lc419 = lua_gettop(L);
  lc_getupvalue(L, lc370, 1, 88);
  lua_pushvalue(L, 11);
  lua_pushvalue(L, 10);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc419);
  assert(lua_gettop(L) == 12);
}
static int lcf3_error_v(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc421 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 39);
  const int lc422 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 64);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 37);
  const int lc423 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 43);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 37);
  const int lc424 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 148);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 38);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 149);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc424), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc423), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc422), LUA_MULTRET);
  return (lua_gettop(L) - lc421);
  assert(lua_gettop(L) == 0);
}
static int lcf1_real_builtin_func_apply(lua_State *L) {
  lua_checkstack(L, 20);
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc420 = 4 };
  assert((lua_gettop(L) == lc420));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 148);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 149);
  lua_pushvalue(L, lc420);
  lua_pushcclosure(L, lcf3_error_v, 1);
  assert(lua_gettop(L) == 5);
  enum { lc425 = 5 };
  lua_getglobal(L, "ipairs");
  lc_getupvalue(L, lc420, 1, 11);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 2);
    if (lua_isnil(L, -2)) {
      break;
    }
    lua_pushvalue(L, -2);
    lua_replace(L, -4);
    enum { lc426 = 10 };
    lc_getupvalue(L, lc420, 1, 4);
    lc_getupvalue(L, lc420, 0, 148);
    lua_pushnumber(L, 1);
    lua_gettable(L, 10);
    lua_call(L, 2, 1);
    const int lc427 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc427) {
      enum { lc428 = 10 };
      lc_getupvalue(L, lc420, 0, 149);
      lua_len(L, -1);
      lua_pop(L, 1);
      lua_pushnumber(L, 2);
      lua_gettable(L, 10);
      const int lc430 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc430);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc431 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc431) {
        const int lc432 = lua_gettop(L);
        lua_pushvalue(L, 5);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc432);
        assert(lua_gettop(L) == 10);
      }
      lua_settop(L, lc428);
      assert(lua_gettop(L) == 10);
      enum { lc433 = 10 };
      lua_pushnumber(L, 2);
      lua_gettable(L, 10);
      lua_pushnumber(L, 1);
      const int lc434 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc434);
      const int lc435 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc435) {
        const int lc436 = lua_gettop(L);
        lua_pushnumber(L, 3);
        lua_gettable(L, 10);
        lc_getupvalue(L, lc420, 0, 149);
        lua_pushnumber(L, 1);
        lua_gettable(L, -2);
        lua_remove(L, -2);
        lua_pushvalue(L, 5);
        lua_pushvalue(L, 3);
        lua_call(L, 3, LUA_MULTRET);
        return (lua_gettop(L) - lc436);
        assert(lua_gettop(L) == 10);
      } else {
        enum { lc437 = 10 };
        lua_pushnumber(L, 2);
        lua_gettable(L, 10);
        lua_pushnumber(L, 2);
        const int lc438 = lua_compare(L, -2, -1, LUA_OPEQ);
        lua_pop(L, 2);
        lua_pushboolean(L, lc438);
        const int lc439 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc439) {
          const int lc440 = lua_gettop(L);
          lua_pushnumber(L, 3);
          lua_gettable(L, 10);
          lc_getupvalue(L, lc420, 0, 149);
          lua_pushnumber(L, 1);
          lua_gettable(L, -2);
          lua_remove(L, -2);
          lc_getupvalue(L, lc420, 0, 149);
          lua_pushnumber(L, 2);
          lua_gettable(L, -2);
          lua_remove(L, -2);
          lua_pushvalue(L, 5);
          lua_pushvalue(L, 3);
          lua_call(L, 4, LUA_MULTRET);
          return (lua_gettop(L) - lc440);
          assert(lua_gettop(L) == 10);
        } else {
          enum { lc441 = 10 };
          lua_pushnumber(L, 2);
          lua_gettable(L, 10);
          lua_pushnumber(L, 3);
          const int lc442 = lua_compare(L, -2, -1, LUA_OPEQ);
          lua_pop(L, 2);
          lua_pushboolean(L, lc442);
          const int lc443 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc443) {
            const int lc444 = lua_gettop(L);
            lua_pushnumber(L, 3);
            lua_gettable(L, 10);
            lc_getupvalue(L, lc420, 0, 149);
            lua_pushnumber(L, 1);
            lua_gettable(L, -2);
            lua_remove(L, -2);
            lc_getupvalue(L, lc420, 0, 149);
            lua_pushnumber(L, 2);
            lua_gettable(L, -2);
            lua_remove(L, -2);
            lc_getupvalue(L, lc420, 0, 149);
            lua_pushnumber(L, 3);
            lua_gettable(L, -2);
            lua_remove(L, -2);
            lua_pushvalue(L, 5);
            lua_pushvalue(L, 3);
            lua_call(L, 5, LUA_MULTRET);
            return (lua_gettop(L) - lc444);
            assert(lua_gettop(L) == 10);
          }
          lua_settop(L, lc441);
        }
        lua_settop(L, lc437);
      }
      lua_settop(L, lc433);
      assert(lua_gettop(L) == 10);
      const int lc445 = lua_gettop(L);
      lc_getupvalue(L, lc420, 1, 125);
      lua_call(L, 0, LUA_MULTRET);
      return (lua_gettop(L) - lc445);
      assert(lua_gettop(L) == 10);
    }
    lua_settop(L, lc426);
    assert(lua_gettop(L) == 10);
    lua_pop(L, 2);
  }
  lua_settop(L, lc425);
  assert(lua_gettop(L) == 5);
  const int lc446 = lua_gettop(L);
  lua_pushvalue(L, 5);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc446);
  assert(lua_gettop(L) == 5);
}
static int lcf4_error_v(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc448 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 39);
  const int lc449 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 64);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 37);
  const int lc450 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 42);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 37);
  const int lc451 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 14);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 150);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 151);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 38);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 152);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc451), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc450), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc449), LUA_MULTRET);
  return (lua_gettop(L) - lc448);
  assert(lua_gettop(L) == 0);
}
static int lcf1_real_builtin_form_apply(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc447 = 5 };
  assert((lua_gettop(L) == lc447));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 150);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 151);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 152);
  lua_pushvalue(L, lc447);
  lua_pushcclosure(L, lcf4_error_v, 1);
  assert(lua_gettop(L) == 6);
  enum { lc452 = 6 };
  lc_getupvalue(L, lc447, 1, 4);
  lc_getupvalue(L, lc447, 0, 151);
  lc_getupvalue(L, lc447, 1, 45);
  lua_call(L, 2, 1);
  const int lc453 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc453) {
    enum { lc454 = 6 };
    lc_getupvalue(L, lc447, 0, 152);
    lua_len(L, -1);
    lua_pop(L, 1);
    lua_pushnumber(L, 1);
    const int lc456 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc456);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc457 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc457) {
      const int lc458 = lua_gettop(L);
      lua_pushvalue(L, 6);
      lua_call(L, 0, LUA_MULTRET);
      return (lua_gettop(L) - lc458);
      assert(lua_gettop(L) == 6);
    }
    lua_settop(L, lc454);
    assert(lua_gettop(L) == 6);
    lc_getupvalue(L, lc447, 0, 152);
    lua_pushnumber(L, 1);
    lua_gettable(L, -2);
    lua_remove(L, -2);
    return 1;
    assert(lua_gettop(L) == 6);
  } else {
    enum { lc459 = 6 };
    lc_getupvalue(L, lc447, 1, 4);
    lc_getupvalue(L, lc447, 0, 151);
    lc_getupvalue(L, lc447, 1, 44);
    lua_call(L, 2, 1);
    const int lc460 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc460) {
      enum { lc461 = 6 };
      lc_getupvalue(L, lc447, 0, 152);
      lua_len(L, -1);
      lua_pop(L, 1);
      lua_pushnumber(L, 2);
      const int lc463 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc463);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc464 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc464) {
        const int lc465 = lua_gettop(L);
        lua_pushvalue(L, 6);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc465);
        assert(lua_gettop(L) == 6);
      }
      lua_settop(L, lc461);
      assert(lua_gettop(L) == 6);
      const int lc466 = lua_gettop(L);
      lc_getupvalue(L, lc447, 1, 6);
      lc_getupvalue(L, lc447, 0, 150);
      lc_getupvalue(L, lc447, 0, 152);
      lua_pushnumber(L, 1);
      lua_gettable(L, -2);
      lua_remove(L, -2);
      lc_getupvalue(L, lc447, 0, 152);
      lua_pushnumber(L, 2);
      lua_gettable(L, -2);
      lua_remove(L, -2);
      lua_pushvalue(L, 6);
      lua_call(L, 4, LUA_MULTRET);
      return (lua_gettop(L) - lc466);
      assert(lua_gettop(L) == 6);
    } else {
      enum { lc467 = 6 };
      lc_getupvalue(L, lc447, 1, 4);
      lc_getupvalue(L, lc447, 0, 151);
      lc_getupvalue(L, lc447, 1, 40);
      lua_call(L, 2, 1);
      const int lc468 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc468) {
        enum { lc469 = 6 };
        lc_getupvalue(L, lc447, 0, 152);
        lua_len(L, -1);
        lua_pop(L, 1);
        lua_pushnumber(L, 2);
        const int lc471 = lua_compare(L, -2, -1, LUA_OPEQ);
        lua_pop(L, 2);
        lua_pushboolean(L, lc471);
        lua_pushboolean(L, !(lua_toboolean(L, -1)));
        lua_remove(L, -2);
        const int lc472 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc472) {
          const int lc473 = lua_gettop(L);
          lua_pushvalue(L, 6);
          lua_call(L, 0, LUA_MULTRET);
          return (lua_gettop(L) - lc473);
          assert(lua_gettop(L) == 6);
        }
        lua_settop(L, lc469);
        assert(lua_gettop(L) == 6);
        const int lc474 = lua_gettop(L);
        lc_getupvalue(L, lc447, 1, 108);
        const int lc475 = lua_gettop(L);
        lc_getupvalue(L, lc447, 0, 152);
        lua_pushnumber(L, 1);
        lua_gettable(L, -2);
        lua_remove(L, -2);
        lc_getupvalue(L, lc447, 1, 88);
        lc_getupvalue(L, lc447, 0, 150);
        lc_getupvalue(L, lc447, 0, 152);
        lua_pushnumber(L, 2);
        lua_gettable(L, -2);
        lua_remove(L, -2);
        lua_call(L, 2, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc475), LUA_MULTRET);
        return (lua_gettop(L) - lc474);
        assert(lua_gettop(L) == 6);
      }
      lua_settop(L, lc467);
    }
    lua_settop(L, lc459);
  }
  lua_settop(L, lc452);
  assert(lua_gettop(L) == 6);
  const int lc476 = lua_gettop(L);
  lua_pushvalue(L, 6);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc476);
  assert(lua_gettop(L) == 6);
}
static int lcf1_make_quote(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc477 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 42);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 45);
  lua_pushvalue(L, 1);
  lua_call(L, 3, LUA_MULTRET);
  return (lua_gettop(L) - lc477);
  assert(lua_gettop(L) == 1);
}
static int lcf493(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_pushnumber(L, 0);
  assert(lua_gettop(L) == 3);
  enum { lc488 = 3 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 1, 153);
    lua_len(L, -1);
    lua_pop(L, 1);
    const int lc490 = lua_compare(L, 3, -1, LUA_OPLT);
    lua_pop(L, 1);
    lua_pushboolean(L, lc490);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    enum { lc491 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 2, 4);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 153);
    lua_pushnumber(L, 1);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_gettable(L, -2);
    lua_remove(L, -2);
    lua_pushvalue(L, 1);
    lua_call(L, 2, 1);
    const int lc492 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc492) {
      return 0;
      assert(lua_gettop(L) == 3);
    }
    lua_settop(L, lc491);
    assert(lua_gettop(L) == 3);
    lua_pushnumber(L, 1);
    lc_add(L, 3, -1);
    lua_remove(L, -2);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc488);
  assert(lua_gettop(L) == 3);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 4, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 154);
  lua_pushvalue(L, 1);
  lua_call(L, 2, 0);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_new_lambda(lua_State *L) {
  lua_checkstack(L, 22);
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 70);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_replace(L, 2);
  assert(lua_gettop(L) == 4);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc478 = 5 };
  assert((lua_gettop(L) == lc478));
  lua_newtable(L);
  lua_rawseti(L, lc478, 153);
  assert(lua_gettop(L) == 5);
  lua_pushboolean(L, 0);
  assert(lua_gettop(L) == 6);
  lua_pushvalue(L, 2);
  assert(lua_gettop(L) == 7);
  enum { lc479 = 7 };
  while (1) {
    lc_getupvalue(L, lc478, 1, 95);
    lua_pushvalue(L, 7);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lc478, 1, 26);
    lua_pushvalue(L, 7);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 8);
    lc_getupvalue(L, lc478, 1, 124);
    lua_pushnil(L);
    const int lc480 = lua_compare(L, 8, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc480);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 8);
    enum { lc481 = 8 };
    if (lua_toboolean(L, 8)) {
      lc_getupvalue(L, lc478, 3, 1);
      lc_getupvalue(L, lc478, 0, 153);
      lua_pushvalue(L, 7);
      lua_call(L, 2, 0);
      assert(lua_gettop(L) == 8);
      lua_pushboolean(L, 1);
      lua_replace(L, 6);
      assert(lua_gettop(L) == 8);
      lc_getupvalue(L, lc478, 1, 96);
      lua_replace(L, 7);
      assert(lua_gettop(L) == 8);
    } else {
      enum { lc482 = 8 };
      lc_getupvalue(L, lc478, 1, 99);
      lua_pushvalue(L, 7);
      lua_call(L, 1, 1);
      const int lc483 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc483) {
        lc_getupvalue(L, lc478, 3, 1);
        const int lc484 = lua_gettop(L);
        lc_getupvalue(L, lc478, 0, 153);
        lc_getupvalue(L, lc478, 1, 98);
        lua_pushvalue(L, 7);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc484), 0);
        assert(lua_gettop(L) == 8);
        lc_getupvalue(L, lc478, 1, 97);
        lua_pushvalue(L, 7);
        lua_call(L, 1, 1);
        lua_replace(L, 7);
        assert(lua_gettop(L) == 8);
      } else {
        const int lc485 = lua_gettop(L);
        lua_pushvalue(L, 4);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc485);
        assert(lua_gettop(L) == 8);
      }
      lua_settop(L, lc482);
    }
    lua_settop(L, lc481);
    assert(lua_gettop(L) == 8);
    lua_pop(L, 1);
  }
  lua_settop(L, lc479);
  assert(lua_gettop(L) == 7);
  lua_settop(L, (lua_gettop(L) + 1));
  assert(lua_gettop(L) == 8);
  enum { lc486 = 8 };
  if (lua_toboolean(L, 6)) {
    lc_getupvalue(L, lc478, 1, 38);
    lc_getupvalue(L, lc478, 0, 153);
    lua_call(L, 1, 1);
    lua_replace(L, 8);
    assert(lua_gettop(L) == 8);
  } else {
    lua_pushvalue(L, 2);
    lua_replace(L, 8);
    assert(lua_gettop(L) == 8);
  }
  lua_settop(L, lc486);
  assert(lua_gettop(L) == 8);
  lc_newclosuretable(L, lc478);
  enum { lc487 = 9 };
  assert((lua_gettop(L) == lc487));
  lua_newtable(L);
  lua_rawseti(L, lc487, 154);
  assert(lua_gettop(L) == 9);
  lc_getupvalue(L, lc487, 2, 13);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, lc487);
  lua_pushcclosure(L, lcf493, 1);
  lua_call(L, 2, 0);
  assert(lua_gettop(L) == 9);
  lua_pushvalue(L, 8);
  assert(lua_gettop(L) == 10);
  lc_getupvalue(L, lc487, 0, 154);
  lua_len(L, -1);
  lua_pop(L, 1);
  lua_pushnumber(L, 1);
  lc_sub(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  assert(lua_gettop(L) == 11);
  enum { lc495 = 11 };
  while (1) {
    lua_pushnumber(L, 0);
    const int lc496 = lc_le(L, -1, 11);
    lua_pop(L, 1);
    lua_pushboolean(L, lc496);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lc487, 2, 100);
    lc_getupvalue(L, lc487, 0, 154);
    lua_pushnumber(L, 1);
    lc_add(L, 11, -1);
    lua_remove(L, -2);
    lua_gettable(L, -2);
    lua_remove(L, -2);
    lua_pushvalue(L, 10);
    lua_call(L, 2, 1);
    lua_replace(L, 10);
    assert(lua_gettop(L) == 11);
    lua_pushnumber(L, 1);
    lc_sub(L, 11, -1);
    lua_remove(L, -2);
    lua_replace(L, 11);
    assert(lua_gettop(L) == 11);
  }
  lua_settop(L, lc495);
  assert(lua_gettop(L) == 11);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 10);
  lua_pushvalue(L, 8);
  assert(lua_gettop(L) == 11);
  lc_getupvalue(L, lc487, 0, 154);
  lua_len(L, -1);
  lua_pop(L, 1);
  lua_pushnumber(L, 1);
  lc_sub(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  assert(lua_gettop(L) == 12);
  enum { lc498 = 12 };
  while (1) {
    lua_pushnumber(L, 0);
    const int lc499 = lc_le(L, -1, 12);
    lua_pop(L, 1);
    lua_pushboolean(L, lc499);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lc487, 2, 100);
    lc_getupvalue(L, lc487, 2, 7);
    const int lc500 = lua_gettop(L);
    lc_getupvalue(L, lc487, 2, 15);
    lua_pushvalue(L, 1);
    lc_getupvalue(L, lc487, 0, 154);
    lua_pushnumber(L, 1);
    lc_add(L, 12, -1);
    lua_remove(L, -2);
    lua_gettable(L, -2);
    lua_remove(L, -2);
    lua_call(L, 2, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc500), 1);
    lua_pushvalue(L, 11);
    lua_call(L, 2, 1);
    lua_replace(L, 11);
    assert(lua_gettop(L) == 12);
    lua_pushnumber(L, 1);
    lc_sub(L, 12, -1);
    lua_remove(L, -2);
    lua_replace(L, 12);
    assert(lua_gettop(L) == 12);
  }
  lua_settop(L, lc498);
  assert(lua_gettop(L) == 12);
  lua_pop(L, 1);
  assert(lua_gettop(L) == 11);
  const int lc501 = lua_gettop(L);
  lc_getupvalue(L, lc487, 2, 94);
  const int lc502 = lua_gettop(L);
  lc_getupvalue(L, lc487, 2, 62);
  lc_getupvalue(L, lc487, 2, 37);
  const int lc503 = lua_gettop(L);
  lua_pushvalue(L, 2);
  lc_getupvalue(L, lc487, 2, 100);
  lc_getupvalue(L, lc487, 2, 7);
  const int lc504 = lua_gettop(L);
  lc_getupvalue(L, lc487, 2, 94);
  const int lc505 = lua_gettop(L);
  lc_getupvalue(L, lc487, 2, 62);
  lc_getupvalue(L, lc487, 2, 37);
  lua_pushvalue(L, 10);
  lua_pushvalue(L, 3);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc505), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc504), 1);
  lua_pushvalue(L, 11);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc503), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc502), LUA_MULTRET);
  return (lua_gettop(L) - lc501);
  assert(lua_gettop(L) == 11);
}
static int lcf1_end_2(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 5);
  const int lc512 = lua_gettop(L);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc512), 1);
  assert(lua_gettop(L) == 5);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 5);
  const int lc513 = lua_gettop(L);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc513), 1);
  assert(lua_gettop(L) == 6);
  enum { lc514 = 6 };
  lua_pushvalue(L, 5);
  lua_pushboolean(L, 1);
  const int lc515 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc515);
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lua_pushvalue(L, 6);
    lua_pushboolean(L, 1);
    const int lc516 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc516);
  }
  const int lc517 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc517) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 67);
    lua_pushvalue(L, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 6);
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 6);
  } else {
    enum { lc518 = 6 };
    lua_pushboolean(L, 0);
    const int lc519 = lua_compare(L, 5, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc519);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lua_pushboolean(L, 0);
      const int lc520 = lua_compare(L, 6, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc520);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
    }
    const int lc521 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc521) {
      lua_pushnil(L);
      return 1;
      assert(lua_gettop(L) == 6);
    } else {
      lua_pushboolean(L, 0);
      return 1;
      assert(lua_gettop(L) == 6);
    }
    lua_settop(L, lc518);
  }
  lua_settop(L, lc514);
  assert(lua_gettop(L) == 6);
  return 0;
}
static int lcf1_jsbool_equal_p_inner(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  enum { lc506 = 2 };
  const int lc507 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc507);
  const int lc508 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc508) {
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc506);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 30);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 30);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_replace(L, 2);
  assert(lua_gettop(L) == 2);
  enum { lc509 = 2 };
  const int lc510 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc510);
  const int lc511 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc511) {
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc509);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf1_end_2, 1);
  assert(lua_gettop(L) == 3);
  enum { lc522 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc523 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc523) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 104);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 5);
    lua_pushvalue(L, 4);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 1);
    assert(lua_gettop(L) == 5);
    enum { lc524 = 5 };
    lua_pushboolean(L, 1);
    const int lc525 = lua_compare(L, 5, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc525);
    const int lc526 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc526) {
      lua_pushnil(L);
      lua_replace(L, 5);
      assert(lua_gettop(L) == 5);
    }
    lua_settop(L, lc524);
    assert(lua_gettop(L) == 5);
    lua_pushvalue(L, 5);
    return 1;
    assert(lua_gettop(L) == 5);
  } else {
    enum { lc527 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    const int lc528 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc528) {
      lc_getupvalue(L, lua_upvalueindex(1), 0, 104);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      assert(lua_gettop(L) == 4);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 5);
      lua_pushvalue(L, 1);
      lua_pushvalue(L, 4);
      lua_call(L, 2, 1);
      assert(lua_gettop(L) == 5);
      enum { lc529 = 5 };
      lua_pushboolean(L, 1);
      const int lc530 = lua_compare(L, 5, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc530);
      const int lc531 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc531) {
        lua_pushnil(L);
        lua_replace(L, 5);
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc529);
      assert(lua_gettop(L) == 5);
      lua_pushvalue(L, 5);
      return 1;
      assert(lua_gettop(L) == 5);
    } else {
      enum { lc532 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 0, 95);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      const int lc533 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc533) {
        enum { lc534 = 3 };
        lc_getupvalue(L, lua_upvalueindex(1), 0, 95);
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lua_pushboolean(L, !(lua_toboolean(L, -1)));
        lua_remove(L, -2);
        const int lc535 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc535) {
          lua_pushboolean(L, 0);
          return 1;
          assert(lua_gettop(L) == 3);
        }
        lua_settop(L, lc534);
        assert(lua_gettop(L) == 3);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 67);
        lua_pushvalue(L, 1);
        lua_pushvalue(L, 2);
        lua_call(L, 2, 0);
        assert(lua_gettop(L) == 3);
        lua_pushboolean(L, 1);
        return 1;
        assert(lua_gettop(L) == 3);
      } else {
        enum { lc536 = 3 };
        lc_getupvalue(L, lua_upvalueindex(1), 0, 103);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        const int lc537 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc537) {
          enum { lc538 = 3 };
          lc_getupvalue(L, lua_upvalueindex(1), 0, 103);
          lua_pushvalue(L, 2);
          lua_call(L, 1, 1);
          lua_pushboolean(L, !(lua_toboolean(L, -1)));
          lua_remove(L, -2);
          const int lc539 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc539) {
            lua_pushboolean(L, 0);
            return 1;
            assert(lua_gettop(L) == 3);
          }
          lua_settop(L, lc538);
          assert(lua_gettop(L) == 3);
          const int lc540 = lua_gettop(L);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 101);
          lua_pushvalue(L, 1);
          lua_pushvalue(L, 2);
          lua_call(L, 2, LUA_MULTRET);
          return (lua_gettop(L) - lc540);
          assert(lua_gettop(L) == 3);
        } else {
          enum { lc541 = 3 };
          lc_getupvalue(L, lua_upvalueindex(1), 0, 99);
          lua_pushvalue(L, 1);
          lua_call(L, 1, 1);
          const int lc542 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc542) {
            enum { lc543 = 3 };
            lc_getupvalue(L, lua_upvalueindex(1), 0, 99);
            lua_pushvalue(L, 2);
            lua_call(L, 1, 1);
            lua_pushboolean(L, !(lua_toboolean(L, -1)));
            lua_remove(L, -2);
            const int lc544 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc544) {
              lua_pushboolean(L, 0);
              return 1;
              assert(lua_gettop(L) == 3);
            }
            lua_settop(L, lc543);
            assert(lua_gettop(L) == 3);
            const int lc545 = lua_gettop(L);
            lua_pushvalue(L, 3);
            lua_pushvalue(L, 1);
            lua_pushvalue(L, 2);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 98);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 97);
            lua_call(L, 4, LUA_MULTRET);
            return (lua_gettop(L) - lc545);
            assert(lua_gettop(L) == 3);
          } else {
            enum { lc546 = 3 };
            lc_getupvalue(L, lua_upvalueindex(1), 0, 93);
            lua_pushvalue(L, 1);
            lua_call(L, 1, 1);
            const int lc547 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc547) {
              enum { lc548 = 3 };
              lc_getupvalue(L, lua_upvalueindex(1), 0, 93);
              lua_pushvalue(L, 2);
              lua_call(L, 1, 1);
              lua_pushboolean(L, !(lua_toboolean(L, -1)));
              lua_remove(L, -2);
              const int lc549 = lua_toboolean(L, -1);
              lua_pop(L, 1);
              if (lc549) {
                lua_pushboolean(L, 0);
                return 1;
                assert(lua_gettop(L) == 3);
              }
              lua_settop(L, lc548);
              assert(lua_gettop(L) == 3);
              const int lc550 = lua_gettop(L);
              lua_pushvalue(L, 3);
              lua_pushvalue(L, 1);
              lua_pushvalue(L, 2);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 92);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 91);
              lua_call(L, 4, LUA_MULTRET);
              return (lua_gettop(L) - lc550);
              assert(lua_gettop(L) == 3);
            }
            lua_settop(L, lc546);
          }
          lua_settop(L, lc541);
        }
        lua_settop(L, lc536);
      }
      lua_settop(L, lc532);
    }
    lua_settop(L, lc527);
  }
  lua_settop(L, lc522);
  assert(lua_gettop(L) == 3);
  const int lc551 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc551);
  assert(lua_gettop(L) == 3);
}
static int lcf1_equal_p(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 5);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_call(L, 2, 1);
  lua_pushboolean(L, 0);
  const int lc552 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc552);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_simple_print(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 36);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 1);
  lua_pushliteral(L, "");
  assert(lua_gettop(L) == 2);
  lua_pushliteral(L, "");
  assert(lua_gettop(L) == 3);
  enum { lc553 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 95);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc554 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc554) {
    lua_pushliteral(L, "()");
    return 1;
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc555 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 0, 99);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    const int lc556 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc556) {
      lua_pushliteral(L, "(");
      lua_replace(L, 2);
      assert(lua_gettop(L) == 3);
      lua_pushliteral(L, "");
      lua_replace(L, 3);
      assert(lua_gettop(L) == 3);
      enum { lc557 = 3 };
      while (1) {
        lc_getupvalue(L, lua_upvalueindex(1), 0, 99);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        if (!(lua_toboolean(L, -1))) {
          break;
        }
        lua_pop(L, 1);
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 3);
        lua_call(L, 1, 1);
        lua_getglobal(L, "tostring");
        const int lc558 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
        const int lc559 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 98);
        lua_pushvalue(L, 1);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc559), LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc558), 1);
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_replace(L, 2);
        assert(lua_gettop(L) == 3);
        lua_pushliteral(L, " ");
        lua_replace(L, 3);
        assert(lua_gettop(L) == 3);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 36);
        const int lc560 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 97);
        lua_pushvalue(L, 1);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc560), 1);
        lua_replace(L, 1);
        assert(lua_gettop(L) == 3);
      }
      lua_settop(L, lc557);
      assert(lua_gettop(L) == 3);
      enum { lc561 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 0, 95);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      const int lc562 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc562) {
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lua_pushliteral(L, ")");
        lua_concat(L, 2);
        lua_replace(L, 2);
        assert(lua_gettop(L) == 3);
      } else {
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lua_pushliteral(L, " . ");
        lua_getglobal(L, "tostring");
        const int lc563 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
        lua_pushvalue(L, 1);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc563), 1);
        lua_pushliteral(L, ")");
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_replace(L, 2);
        assert(lua_gettop(L) == 3);
      }
      lua_settop(L, lc561);
      assert(lua_gettop(L) == 3);
      lua_pushvalue(L, 2);
      return 1;
      assert(lua_gettop(L) == 3);
    } else {
      enum { lc564 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 0, 93);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      const int lc565 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc565) {
        lua_pushliteral(L, "#");
        lua_getglobal(L, "tostring");
        const int lc566 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
        const int lc567 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 100);
        const int lc568 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 92);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 91);
        lua_pushvalue(L, 1);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc568), LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc567), LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc566), 1);
        lua_concat(L, 2);
        return 1;
        assert(lua_gettop(L) == 3);
      } else {
        enum { lc569 = 3 };
        lc_getupvalue(L, lua_upvalueindex(1), 0, 103);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        const int lc570 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc570) {
          const int lc571 = lua_gettop(L);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 102);
          lua_pushvalue(L, 1);
          lua_call(L, 1, LUA_MULTRET);
          return (lua_gettop(L) - lc571);
          assert(lua_gettop(L) == 3);
        } else {
          enum { lc572 = 3 };
          lc_getupvalue(L, lua_upvalueindex(1), 0, 107);
          lua_pushvalue(L, 1);
          lua_call(L, 1, 1);
          const int lc573 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc573) {
            lua_pushliteral(L, ";(");
            lua_getglobal(L, "tostring");
            const int lc574 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
            const int lc575 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 106);
            lua_pushvalue(L, 1);
            lua_call(L, 1, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc575), LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc574), 1);
            lua_pushliteral(L, " ");
            lua_getglobal(L, "tostring");
            const int lc576 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
            const int lc577 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 105);
            lua_pushvalue(L, 1);
            lua_call(L, 1, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc577), LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc576), 1);
            lua_pushliteral(L, ")");
            lua_concat(L, 2);
            lua_concat(L, 2);
            lua_concat(L, 2);
            lua_concat(L, 2);
            return 1;
            assert(lua_gettop(L) == 3);
          } else {
            enum { lc578 = 3 };
            lc_getupvalue(L, lua_upvalueindex(1), 0, 87);
            lua_pushvalue(L, 1);
            lua_call(L, 1, 1);
            const int lc579 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc579) {
              lua_pushliteral(L, "$(");
              lua_getglobal(L, "tostring");
              const int lc580 = lua_gettop(L);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
              const int lc581 = lua_gettop(L);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 14);
              const int lc582 = lua_gettop(L);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 86);
              lua_pushvalue(L, 1);
              lua_call(L, 1, LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc582), LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc581), LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc580), 1);
              lua_pushliteral(L, " ");
              lua_getglobal(L, "tostring");
              const int lc583 = lua_gettop(L);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
              const int lc584 = lua_gettop(L);
              lc_getupvalue(L, lua_upvalueindex(1), 0, 85);
              lua_pushvalue(L, 1);
              lua_call(L, 1, LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc584), LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc583), 1);
              lua_pushliteral(L, ")");
              lua_concat(L, 2);
              lua_concat(L, 2);
              lua_concat(L, 2);
              lua_concat(L, 2);
              return 1;
              assert(lua_gettop(L) == 3);
            } else {
              enum { lc585 = 3 };
              lc_getupvalue(L, lua_upvalueindex(1), 0, 78);
              lua_pushvalue(L, 1);
              lua_call(L, 1, 1);
              const int lc586 = lua_toboolean(L, -1);
              lua_pop(L, 1);
              if (lc586) {
                lua_pushliteral(L, "%(");
                lua_getglobal(L, "tostring");
                const int lc587 = lua_gettop(L);
                lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
                const int lc588 = lua_gettop(L);
                lc_getupvalue(L, lua_upvalueindex(1), 0, 77);
                lua_pushvalue(L, 1);
                lua_call(L, 1, LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc588), LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc587), 1);
                lua_pushliteral(L, " ");
                lua_getglobal(L, "tostring");
                const int lc589 = lua_gettop(L);
                lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
                const int lc590 = lua_gettop(L);
                lc_getupvalue(L, lua_upvalueindex(1), 0, 38);
                const int lc591 = lua_gettop(L);
                lc_getupvalue(L, lua_upvalueindex(1), 0, 76);
                lua_pushvalue(L, 1);
                lua_call(L, 1, LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc591), LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc590), LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc589), 1);
                lua_pushliteral(L, ")");
                lua_concat(L, 2);
                lua_concat(L, 2);
                lua_concat(L, 2);
                lua_concat(L, 2);
                return 1;
                assert(lua_gettop(L) == 3);
              } else {
                enum { lc592 = 3 };
                lc_getupvalue(L, lua_upvalueindex(1), 0, 83);
                lua_pushvalue(L, 1);
                lua_call(L, 1, 1);
                const int lc593 = lua_toboolean(L, -1);
                lua_pop(L, 1);
                if (lc593) {
                  lua_pushliteral(L, "@(");
                  lua_getglobal(L, "tostring");
                  const int lc594 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
                  const int lc595 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 14);
                  const int lc596 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 82);
                  lua_pushvalue(L, 1);
                  lua_call(L, 1, LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc596), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc595), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc594), 1);
                  lua_pushliteral(L, " ");
                  lua_getglobal(L, "tostring");
                  const int lc597 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
                  const int lc598 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 81);
                  lua_pushvalue(L, 1);
                  lua_call(L, 1, LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc598), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc597), 1);
                  lua_pushliteral(L, " ");
                  lua_getglobal(L, "tostring");
                  const int lc599 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
                  const int lc600 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 38);
                  const int lc601 = lua_gettop(L);
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 80);
                  lua_pushvalue(L, 1);
                  lua_call(L, 1, LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc601), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc600), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc599), 1);
                  lua_pushliteral(L, ")");
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  return 1;
                  assert(lua_gettop(L) == 3);
                } else {
                  enum { lc602 = 3 };
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 74);
                  lua_pushvalue(L, 1);
                  lua_call(L, 1, 1);
                  const int lc603 = lua_toboolean(L, -1);
                  lua_pop(L, 1);
                  if (lc603) {
                    lua_pushliteral(L, "^(");
                    lua_getglobal(L, "tostring");
                    const int lc604 = lua_gettop(L);
                    lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
                    const int lc605 = lua_gettop(L);
                    lc_getupvalue(L, lua_upvalueindex(1), 0, 73);
                    lua_pushvalue(L, 1);
                    lua_call(L, 1, LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc605), LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc604), 1);
                    lua_pushliteral(L, " ");
                    lua_getglobal(L, "tostring");
                    const int lc606 = lua_gettop(L);
                    lc_getupvalue(L, lua_upvalueindex(1), 0, 3);
                    const int lc607 = lua_gettop(L);
                    lc_getupvalue(L, lua_upvalueindex(1), 0, 38);
                    const int lc608 = lua_gettop(L);
                    lc_getupvalue(L, lua_upvalueindex(1), 0, 72);
                    lua_pushvalue(L, 1);
                    lua_call(L, 1, LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc608), LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc607), LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc606), 1);
                    lua_pushliteral(L, ")");
                    lua_concat(L, 2);
                    lua_concat(L, 2);
                    lua_concat(L, 2);
                    lua_concat(L, 2);
                    return 1;
                    assert(lua_gettop(L) == 3);
                  }
                  lua_settop(L, lc602);
                }
                lua_settop(L, lc592);
              }
              lua_settop(L, lc585);
            }
            lua_settop(L, lc578);
          }
          lua_settop(L, lc572);
        }
        lua_settop(L, lc569);
      }
      lua_settop(L, lc564);
    }
    lua_settop(L, lc555);
  }
  lua_settop(L, lc553);
  assert(lua_gettop(L) == 3);
  const int lc609 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc609);
  assert(lua_gettop(L) == 3);
}
static int lcf1_run_trampoline(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushvalue(L, 1);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 2);
  enum { lc611 = 2 };
  while (1) {
    lua_pushnumber(L, 1);
    lua_gettable(L, 2);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lua_pushnumber(L, 2);
    lua_gettable(L, 2);
    lua_call(L, 0, 1);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc611);
  assert(lua_gettop(L) == 2);
  lua_pushnumber(L, 2);
  lua_gettable(L, 2);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_new_atom(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_createtable(L, 2, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 119);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 2);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf2_conslike(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 71);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  lua_call(L, 1, 1);
  lua_pushnumber(L, 2);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 71);
  lua_pushnumber(L, 3);
  lua_gettable(L, 1);
  lua_call(L, 1, 1);
  lua_pushnumber(L, 3);
  lua_insert(L, -2);
  lua_settable(L, 1);
  assert(lua_gettop(L) == 1);
  enum { lc614 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 3, 107);
  lua_pushnumber(L, 2);
  lua_gettable(L, 1);
  lua_call(L, 1, 1);
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 3, 107);
    lua_pushnumber(L, 3);
    lua_gettable(L, 1);
    lua_call(L, 1, 1);
  }
  const int lc615 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc615) {
    lc_getupvalue(L, lua_upvalueindex(1), 3, 65);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 2);
    lua_pushnumber(L, 2);
    lua_gettable(L, 1);
    assert(lua_gettop(L) == 3);
    lua_pushnumber(L, 3);
    lua_gettable(L, 1);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 157);
    lua_pushvalue(L, 3);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 5);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 157);
    lua_pushvalue(L, 4);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 6);
    lua_pushvalue(L, 5);
    lua_pushnumber(L, 2);
    lua_insert(L, -2);
    lua_settable(L, 2);
    assert(lua_gettop(L) == 6);
    lua_pushvalue(L, 6);
    lua_pushnumber(L, 3);
    lua_insert(L, -2);
    lua_settable(L, 2);
    assert(lua_gettop(L) == 6);
    lua_pushvalue(L, 2);
    return 1;
    assert(lua_gettop(L) == 6);
  } else {
    lua_pushvalue(L, 1);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc614);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_force_uncomment_all_rec(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 29);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf2_conslike, 1);
  assert(lua_gettop(L) == 3);
  enum { lc616 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 3, 93);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  const int lc617 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc617) {
    const int lc618 = lua_gettop(L);
    lua_pushvalue(L, 3);
    lua_pushvalue(L, 2);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc618);
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc619 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 3, 99);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    const int lc620 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc620) {
      const int lc621 = lua_gettop(L);
      lua_pushvalue(L, 3);
      lua_pushvalue(L, 2);
      lua_call(L, 1, LUA_MULTRET);
      return (lua_gettop(L) - lc621);
      assert(lua_gettop(L) == 3);
    }
    lua_settop(L, lc619);
  }
  lua_settop(L, lc616);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, 2);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_systemName_make(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc631 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 94);
  const int lc632 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 63);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 100);
  const int lc633 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 64);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 100);
  lua_pushvalue(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 96);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc633), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc632), LUA_MULTRET);
  return (lua_gettop(L) - lc631);
  assert(lua_gettop(L) == 1);
}
static int lcf1_make_builtin_f_new_sym_f(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc634 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 165);
  const int lc635 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 5, 160);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 62);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 159);
  lua_pushvalue(L, 1);
  lua_call(L, 3, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 7, 158);
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc635), LUA_MULTRET);
  return (lua_gettop(L) - lc634);
  assert(lua_gettop(L) == 1);
}
static int lcf1_make_builtin_f_get_sym_f(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc636 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 165);
  const int lc637 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 5, 160);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 62);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 159);
  lua_call(L, 3, 1);
  lua_pushvalue(L, 2);
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc637), LUA_MULTRET);
  return (lua_gettop(L) - lc636);
  assert(lua_gettop(L) == 2);
}
static int lcf1_make_builtin_f_p_sym_f(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc638 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 165);
  const int lc639 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  const int lc640 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 5, 160);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 62);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  const int lc641 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 4, 161);
  lc_getupvalue(L, lua_upvalueindex(1), 11, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 5, 160);
  lua_pushvalue(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 159);
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc641), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc640), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc639), LUA_MULTRET);
  return (lua_gettop(L) - lc638);
  assert(lua_gettop(L) == 1);
}
static int lcf1_list_to_jsArray(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lua_newtable(L);
  assert(lua_gettop(L) == 4);
  enum { lc664 = 4 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 15, 99);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 17, 1);
    const int lc665 = lua_gettop(L);
    lua_pushvalue(L, 4);
    lc_getupvalue(L, lua_upvalueindex(1), 15, 98);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc665), 0);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lua_upvalueindex(1), 15, 97);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc664);
  assert(lua_gettop(L) == 4);
  enum { lc666 = 4 };
  lc_getupvalue(L, lua_upvalueindex(1), 15, 95);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc667 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc667) {
    const int lc668 = lua_gettop(L);
    lua_pushvalue(L, 2);
    lua_pushvalue(L, 4);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc668);
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc666);
  assert(lua_gettop(L) == 4);
  const int lc669 = lua_gettop(L);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 1);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc669);
  assert(lua_gettop(L) == 4);
}
static int lcf672(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf673(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_pushboolean(L, 0);
  return 1;
  assert(lua_gettop(L) == 2);
}
static int lcf1_maybe_list_to_jsArray(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc671 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 169);
  lua_pushvalue(L, 1);
  lua_pushcfunction(L, lcf672);
  lua_pushcfunction(L, lcf673);
  lua_call(L, 3, LUA_MULTRET);
  return (lua_gettop(L) - lc671);
  assert(lua_gettop(L) == 1);
}
static int lcf1_un_just_comment_all(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc674 = 1 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 16, 90);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      lua_pop(L, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 16, 107);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
    }
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 16, 36);
    const int lc675 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 16, 104);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc675), 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc674);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay2delay_evaluate(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc677 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 17, 87);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc678 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc678) {
    lua_pushvalue(L, 1);
    return 1;
    assert(lua_gettop(L) == 1);
  } else {
    enum { lc679 = 1 };
    lc_getupvalue(L, lua_upvalueindex(1), 17, 83);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    const int lc680 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc680) {
      lua_getglobal(L, "error");
      lua_pushliteral(L, "WIP");
      lua_call(L, 1, 0);
      assert(lua_gettop(L) == 1);
    } else {
      enum { lc681 = 1 };
      lc_getupvalue(L, lua_upvalueindex(1), 17, 78);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      const int lc682 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc682) {
        lua_getglobal(L, "error");
        lua_pushliteral(L, "WIP");
        lua_call(L, 1, 0);
        assert(lua_gettop(L) == 1);
      } else {
        enum { lc683 = 1 };
        lc_getupvalue(L, lua_upvalueindex(1), 17, 74);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        const int lc684 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc684) {
          lua_getglobal(L, "error");
          lua_pushliteral(L, "WIP");
          lua_call(L, 1, 0);
          assert(lua_gettop(L) == 1);
        }
        lua_settop(L, lc683);
      }
      lua_settop(L, lc681);
    }
    lua_settop(L, lc679);
  }
  lua_settop(L, lc677);
  assert(lua_gettop(L) == 1);
  const int lc685 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 17, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc685);
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_env(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc686 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 17, 86);
  const int lc687 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 171);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc687), LUA_MULTRET);
  return (lua_gettop(L) - lc686);
  assert(lua_gettop(L) == 1);
}
static int lcf1_delay_x(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc688 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 17, 85);
  const int lc689 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 171);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc689), LUA_MULTRET);
  return (lua_gettop(L) - lc688);
  assert(lua_gettop(L) == 1);
}
static int lcf1_force_uncomment1(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc690 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 17, 107);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc691 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc691) {
    const int lc692 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 17, 105);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc692);
    assert(lua_gettop(L) == 1);
  } else {
    const int lc693 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 17, 31);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc693);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc690);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_enviroment_set(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_getupvalue(L, lua_upvalueindex(1), 17, 25);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 4);
  const int lc694 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 16, 155);
  const int lc695 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 17, 19);
  lua_pushvalue(L, 1);
  lua_createtable(L, 1, 0);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 4);
  lua_call(L, 5, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc695), LUA_MULTRET);
  return (lua_gettop(L) - lc694);
  assert(lua_gettop(L) == 4);
}
static int lcf1_val2env(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 1);
  enum { lc697 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 93);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc698 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc698) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc697);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
  const int lc699 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 92);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc699), 1);
  assert(lua_gettop(L) == 2);
  enum { lc700 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 103);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc701 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc701) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc700);
  assert(lua_gettop(L) == 2);
  enum { lc702 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 101);
  lua_pushvalue(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 60);
  lua_call(L, 2, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc703 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc703) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc702);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
  const int lc704 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 91);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc704), 1);
  lua_replace(L, 2);
  assert(lua_gettop(L) == 2);
  enum { lc705 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 99);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc706 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc706) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc705);
  assert(lua_gettop(L) == 2);
  enum { lc707 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 95);
  const int lc708 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
  const int lc709 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 97);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc709), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc708), 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc710 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc710) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc707);
  assert(lua_gettop(L) == 2);
  lua_newtable(L);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
  const int lc711 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 98);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc711), 1);
  assert(lua_gettop(L) == 4);
  enum { lc712 = 4 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 18, 95);
    lua_pushvalue(L, 4);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    enum { lc713 = 4 };
    lc_getupvalue(L, lua_upvalueindex(1), 18, 99);
    lua_pushvalue(L, 4);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc714 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc714) {
      lua_pushboolean(L, 0);
      return 1;
      assert(lua_gettop(L) == 4);
    }
    lua_settop(L, lc713);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
    const int lc715 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 98);
    lua_pushvalue(L, 4);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc715), 1);
    assert(lua_gettop(L) == 5);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
    const int lc716 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 97);
    lua_pushvalue(L, 4);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc716), 1);
    lua_replace(L, 4);
    assert(lua_gettop(L) == 5);
    enum { lc717 = 5 };
    lc_getupvalue(L, lua_upvalueindex(1), 18, 99);
    lua_pushvalue(L, 5);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc718 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc718) {
      lua_pushboolean(L, 0);
      return 1;
      assert(lua_gettop(L) == 5);
    }
    lua_settop(L, lc717);
    assert(lua_gettop(L) == 5);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 98);
    lua_pushvalue(L, 5);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 6);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
    const int lc719 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 97);
    lua_pushvalue(L, 5);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc719), 1);
    lua_replace(L, 5);
    assert(lua_gettop(L) == 6);
    enum { lc720 = 6 };
    lc_getupvalue(L, lua_upvalueindex(1), 18, 99);
    lua_pushvalue(L, 5);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc721 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc721) {
      lua_pushboolean(L, 0);
      return 1;
      assert(lua_gettop(L) == 6);
    }
    lua_settop(L, lc720);
    assert(lua_gettop(L) == 6);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 98);
    lua_pushvalue(L, 5);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 7);
    enum { lc722 = 7 };
    lc_getupvalue(L, lua_upvalueindex(1), 18, 95);
    const int lc723 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
    const int lc724 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 97);
    lua_pushvalue(L, 5);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc724), LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc723), 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc725 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc725) {
      lua_pushboolean(L, 0);
      return 1;
      assert(lua_gettop(L) == 7);
    }
    lua_settop(L, lc722);
    assert(lua_gettop(L) == 7);
    lua_pushboolean(L, 1);
    assert(lua_gettop(L) == 8);
    lua_pushnumber(L, 0);
    assert(lua_gettop(L) == 9);
    enum { lc726 = 9 };
    while (1) {
      lua_len(L, 3);
      const int lc728 = lua_compare(L, 9, -1, LUA_OPLT);
      lua_pop(L, 1);
      lua_pushboolean(L, lc728);
      if (!(lua_toboolean(L, -1))) {
        break;
      }
      lua_pop(L, 1);
      enum { lc729 = 9 };
      lc_getupvalue(L, lua_upvalueindex(1), 18, 4);
      lua_pushnumber(L, 0);
      lc_add(L, 9, -1);
      lua_remove(L, -2);
      lua_pushnumber(L, 1);
      lc_add(L, -2, -1);
      lua_remove(L, -2);
      lua_remove(L, -2);
      lua_gettable(L, 3);
      lua_pushvalue(L, 6);
      lua_call(L, 2, 1);
      const int lc730 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc730) {
        lua_pushvalue(L, 7);
        lua_pushnumber(L, 1);
        lc_add(L, 9, -1);
        lua_remove(L, -2);
        lua_pushnumber(L, 1);
        lc_add(L, -2, -1);
        lua_remove(L, -2);
        lua_remove(L, -2);
        lua_insert(L, -2);
        lua_settable(L, 3);
        assert(lua_gettop(L) == 9);
        lua_pushboolean(L, 0);
        lua_replace(L, 8);
        assert(lua_gettop(L) == 9);
        break;
        assert(lua_gettop(L) == 9);
      }
      lua_settop(L, lc729);
      assert(lua_gettop(L) == 9);
      lua_pushnumber(L, 2);
      lc_add(L, 9, -1);
      lua_remove(L, -2);
      lua_replace(L, 9);
      assert(lua_gettop(L) == 9);
    }
    lua_settop(L, lc726);
    assert(lua_gettop(L) == 9);
    lua_pop(L, 1);
    assert(lua_gettop(L) == 8);
    enum { lc731 = 8 };
    if (lua_toboolean(L, 8)) {
      lc_getupvalue(L, lua_upvalueindex(1), 20, 1);
      lua_pushvalue(L, 3);
      lua_pushvalue(L, 6);
      lua_pushvalue(L, 7);
      lua_call(L, 3, 0);
      assert(lua_gettop(L) == 8);
    }
    lua_settop(L, lc731);
    assert(lua_gettop(L) == 8);
    lua_pop(L, 4);
  }
  lua_settop(L, lc712);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 3);
  return 1;
  assert(lua_gettop(L) == 4);
}
static int lcf738(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 31);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 1);
  enum { lc733 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 19, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc734 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc734) {
    const int lc735 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 19, 79);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 173);
    lua_createtable(L, 1, 0);
    lua_pushvalue(L, 1);
    lua_rawseti(L, -2, 1);
    lua_call(L, 2, LUA_MULTRET);
    return (lua_gettop(L) - lc735);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc733);
  assert(lua_gettop(L) == 1);
  enum { lc736 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 174);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc737 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc737) {
    lc_getupvalue(L, lua_upvalueindex(1), 5, 168);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc736);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 167);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_make_builtin_p_func(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc732 = 3 };
  assert((lua_gettop(L) == lc732));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 173);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 174);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lc732, 0, 173);
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, lc732);
  lua_pushcclosure(L, lcf738, 1);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf747(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 31);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 2);
  enum { lc740 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 19, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc741 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc741) {
    const int lc742 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 19, 79);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 175);
    lua_createtable(L, 1, 0);
    lua_pushvalue(L, 1);
    lua_rawseti(L, -2, 1);
    lua_call(L, 2, LUA_MULTRET);
    return (lua_gettop(L) - lc742);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc740);
  assert(lua_gettop(L) == 2);
  enum { lc743 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 176);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc744 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc744) {
    const int lc745 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 177);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc745);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc743);
  assert(lua_gettop(L) == 2);
  const int lc746 = lua_gettop(L);
  lua_pushvalue(L, 2);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc746);
  assert(lua_gettop(L) == 2);
}
static int lcf1_make_builtin_get_func(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc739 = 4 };
  assert((lua_gettop(L) == lc739));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 175);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 176);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 177);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, lc739, 0, 175);
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, lc739);
  lua_pushcclosure(L, lcf747, 1);
  lua_rawseti(L, -2, 3);
  return 1;
  assert(lua_gettop(L) == 4);
}
static int lcf1_H_if(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  const int lc758 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 79);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 46);
  lua_createtable(L, 3, 0);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 1);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 3);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc758);
  assert(lua_gettop(L) == 3);
}
static int lcf1_H_and(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc760 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 178);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 7, 167);
  lua_call(L, 3, LUA_MULTRET);
  return (lua_gettop(L) - lc760);
  assert(lua_gettop(L) == 2);
}
static int lcf2_end_2(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  const int lc761 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 179);
  const int lc762 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 20, 79);
  lc_getupvalue(L, lua_upvalueindex(1), 20, 49);
  lua_createtable(L, 2, 0);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_rawseti(L, -2, 1);
  const int lc763 = lua_gettop(L);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  while ((lua_gettop(L) > lc763)) {
    lua_rawseti(L, lc763, (1 + (lua_gettop(L) - lc763)));
  }
  lua_call(L, 2, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 20, 79);
  lc_getupvalue(L, lua_upvalueindex(1), 20, 49);
  lua_createtable(L, 2, 0);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_rawseti(L, -2, 1);
  const int lc764 = lua_gettop(L);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  while ((lua_gettop(L) > lc764)) {
    lua_rawseti(L, lc764, (1 + (lua_gettop(L) - lc764)));
  }
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc762), LUA_MULTRET);
  return (lua_gettop(L) - lc761);
  assert(lua_gettop(L) == 4);
}
static int lcf786(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  enum { lc748 = 3 };
  const int lc749 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc749);
  const int lc750 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc750) {
    lc_getupvalue(L, lua_upvalueindex(1), 4, 168);
    return 1;
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc748);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 31);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 31);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_replace(L, 2);
  assert(lua_gettop(L) == 3);
  enum { lc751 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 34);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
  }
  const int lc752 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc752) {
    const int lc753 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 79);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 49);
    lua_createtable(L, 2, 0);
    lua_pushvalue(L, 1);
    lua_rawseti(L, -2, 1);
    lua_pushvalue(L, 2);
    lua_rawseti(L, -2, 2);
    lua_call(L, 2, LUA_MULTRET);
    return (lua_gettop(L) - lc753);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc751);
  assert(lua_gettop(L) == 3);
  enum { lc754 = 3 };
  const int lc755 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc755);
  const int lc756 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc756) {
    lc_getupvalue(L, lua_upvalueindex(1), 4, 168);
    return 1;
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc754);
  assert(lua_gettop(L) == 3);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc757 = 4 };
  assert((lua_gettop(L) == lc757));
  lua_pushvalue(L, lc757);
  lua_pushcclosure(L, lcf1_H_if, 1);
  lua_rawseti(L, lc757, 178);
  assert(lua_gettop(L) == 4);
  lc_newclosuretable(L, lc757);
  enum { lc759 = 5 };
  assert((lua_gettop(L) == lc759));
  lua_pushvalue(L, lc759);
  lua_pushcclosure(L, lcf1_H_and, 1);
  lua_rawseti(L, lc759, 179);
  assert(lua_gettop(L) == 5);
  lc_getupvalue(L, lc759, 20, 124);
  lc_getupvalue(L, lc759, 20, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 5);
  lua_pushvalue(L, lc759);
  lua_pushcclosure(L, lcf2_end_2, 1);
  assert(lua_gettop(L) == 6);
  enum { lc765 = 6 };
  lc_getupvalue(L, lc759, 20, 95);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc766 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc766) {
    enum { lc767 = 6 };
    lc_getupvalue(L, lc759, 20, 95);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc768 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc768) {
      lc_getupvalue(L, lc759, 7, 167);
      return 1;
      assert(lua_gettop(L) == 6);
    }
    lua_settop(L, lc767);
    assert(lua_gettop(L) == 6);
    lc_getupvalue(L, lc759, 6, 168);
    return 1;
    assert(lua_gettop(L) == 6);
  } else {
    enum { lc769 = 6 };
    lc_getupvalue(L, lc759, 20, 103);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    const int lc770 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc770) {
      enum { lc771 = 6 };
      lc_getupvalue(L, lc759, 20, 103);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc772 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc772) {
        lc_getupvalue(L, lc759, 7, 167);
        return 1;
        assert(lua_gettop(L) == 6);
      }
      lua_settop(L, lc771);
      assert(lua_gettop(L) == 6);
      enum { lc773 = 6 };
      lc_getupvalue(L, lc759, 20, 101);
      lua_pushvalue(L, 1);
      lua_pushvalue(L, 2);
      lua_call(L, 2, 1);
      const int lc774 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc774) {
        lc_getupvalue(L, lc759, 6, 168);
        return 1;
        assert(lua_gettop(L) == 6);
      } else {
        lc_getupvalue(L, lc759, 7, 167);
        return 1;
        assert(lua_gettop(L) == 6);
      }
      lua_settop(L, lc773);
      assert(lua_gettop(L) == 6);
    } else {
      enum { lc775 = 6 };
      lc_getupvalue(L, lc759, 20, 93);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      const int lc776 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc776) {
        enum { lc777 = 6 };
        lc_getupvalue(L, lc759, 20, 93);
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lua_pushboolean(L, !(lua_toboolean(L, -1)));
        lua_remove(L, -2);
        const int lc778 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc778) {
          lc_getupvalue(L, lc759, 7, 167);
          return 1;
          assert(lua_gettop(L) == 6);
        }
        lua_settop(L, lc777);
        assert(lua_gettop(L) == 6);
        const int lc779 = lua_gettop(L);
        lua_pushvalue(L, 6);
        lua_pushvalue(L, 1);
        lua_pushvalue(L, 2);
        lc_getupvalue(L, lc759, 20, 92);
        lc_getupvalue(L, lc759, 20, 91);
        lua_call(L, 4, LUA_MULTRET);
        return (lua_gettop(L) - lc779);
        assert(lua_gettop(L) == 6);
      } else {
        enum { lc780 = 6 };
        lc_getupvalue(L, lc759, 20, 99);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        const int lc781 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc781) {
          enum { lc782 = 6 };
          lc_getupvalue(L, lc759, 20, 99);
          lua_pushvalue(L, 2);
          lua_call(L, 1, 1);
          lua_pushboolean(L, !(lua_toboolean(L, -1)));
          lua_remove(L, -2);
          const int lc783 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc783) {
            lc_getupvalue(L, lc759, 7, 167);
            return 1;
            assert(lua_gettop(L) == 6);
          }
          lua_settop(L, lc782);
          assert(lua_gettop(L) == 6);
          const int lc784 = lua_gettop(L);
          lua_pushvalue(L, 6);
          lua_pushvalue(L, 1);
          lua_pushvalue(L, 2);
          lc_getupvalue(L, lc759, 20, 98);
          lc_getupvalue(L, lc759, 20, 97);
          lua_call(L, 4, LUA_MULTRET);
          return (lua_gettop(L) - lc784);
          assert(lua_gettop(L) == 6);
        }
        lua_settop(L, lc780);
      }
      lua_settop(L, lc775);
    }
    lua_settop(L, lc769);
  }
  lua_settop(L, lc765);
  assert(lua_gettop(L) == 6);
  const int lc785 = lua_gettop(L);
  lc_getupvalue(L, lc759, 20, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc785);
  assert(lua_gettop(L) == 6);
}
static int lcf794(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lua_newtable(L);
  assert(lua_gettop(L) == 4);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 5);
  enum { lc787 = 5 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 18, 99);
    lua_pushvalue(L, 5);
    lua_call(L, 1, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 20, 1);
    const int lc788 = lua_gettop(L);
    lua_pushvalue(L, 4);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 98);
    lua_pushvalue(L, 5);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc788), 0);
    assert(lua_gettop(L) == 5);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
    const int lc789 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 97);
    lua_pushvalue(L, 5);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc789), 1);
    lua_replace(L, 5);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc787);
  assert(lua_gettop(L) == 5);
  enum { lc790 = 5 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 95);
  lua_pushvalue(L, 5);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc791 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc791) {
    const int lc792 = lua_gettop(L);
    lua_pushvalue(L, 3);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc792);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc790);
  assert(lua_gettop(L) == 5);
  const int lc793 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 75);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 4);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc793);
  assert(lua_gettop(L) == 5);
}
static int lcf800(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 172);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 4);
  enum { lc795 = 4 };
  lua_pushboolean(L, 0);
  const int lc796 = lua_compare(L, 4, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc796);
  const int lc797 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc797) {
    const int lc798 = lua_gettop(L);
    lua_pushvalue(L, 3);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc798);
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc795);
  assert(lua_gettop(L) == 4);
  const int lc799 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 88);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 2);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc799);
  assert(lua_gettop(L) == 4);
}
static int lcf808(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 31);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 2);
  enum { lc801 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc802 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc802) {
    const int lc803 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 79);
    lc_getupvalue(L, lua_upvalueindex(1), 6, 166);
    lua_createtable(L, 1, 0);
    lua_pushvalue(L, 1);
    lua_rawseti(L, -2, 1);
    lua_call(L, 2, LUA_MULTRET);
    return (lua_gettop(L) - lc803);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc801);
  assert(lua_gettop(L) == 2);
  enum { lc804 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 99);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc805 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc805) {
    const int lc806 = lua_gettop(L);
    lua_pushvalue(L, 2);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc806);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc804);
  assert(lua_gettop(L) == 2);
  const int lc807 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 98);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc807);
  assert(lua_gettop(L) == 2);
}
static int lcf824(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 31);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 4);
  enum { lc809 = 4 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 34);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc810 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc810) {
    const int lc811 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 79);
    lc_getupvalue(L, lua_upvalueindex(1), 18, 46);
    lua_createtable(L, 3, 0);
    lua_pushvalue(L, 1);
    lua_rawseti(L, -2, 1);
    lua_pushvalue(L, 2);
    lua_rawseti(L, -2, 2);
    lua_pushvalue(L, 3);
    lua_rawseti(L, -2, 3);
    lua_call(L, 2, LUA_MULTRET);
    return (lua_gettop(L) - lc811);
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc809);
  assert(lua_gettop(L) == 4);
  enum { lc812 = 4 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 93);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc813 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc813) {
    const int lc814 = lua_gettop(L);
    lua_pushvalue(L, 4);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc814);
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc812);
  assert(lua_gettop(L) == 4);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 30);
  const int lc815 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 18, 92);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc815), 1);
  assert(lua_gettop(L) == 5);
  enum { lc816 = 5 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 103);
  lua_pushvalue(L, 5);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc817 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc817) {
    const int lc818 = lua_gettop(L);
    lua_pushvalue(L, 4);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc818);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc816);
  assert(lua_gettop(L) == 5);
  enum { lc819 = 5 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 101);
  lua_pushvalue(L, 5);
  lc_getupvalue(L, lua_upvalueindex(1), 9, 163);
  lua_call(L, 2, 1);
  const int lc820 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc820) {
    lua_pushvalue(L, 2);
    return 1;
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc819);
  assert(lua_gettop(L) == 5);
  enum { lc821 = 5 };
  lc_getupvalue(L, lua_upvalueindex(1), 18, 101);
  lua_pushvalue(L, 5);
  lc_getupvalue(L, lua_upvalueindex(1), 8, 164);
  lua_call(L, 2, 1);
  const int lc822 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc822) {
    lua_pushvalue(L, 3);
    return 1;
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc821);
  assert(lua_gettop(L) == 5);
  const int lc823 = lua_gettop(L);
  lua_pushvalue(L, 4);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc823);
  assert(lua_gettop(L) == 5);
}
static int lcf3_end_2(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  enum { lc832 = 4 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 180);
  const int lc833 = lua_gettop(L);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc833), 1);
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 180);
    const int lc834 = lua_gettop(L);
    lua_pushvalue(L, 4);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_pushvalue(L, 4);
    lua_pushvalue(L, 2);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc834), 1);
  }
  const int lc835 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc835) {
    lc_getupvalue(L, lua_upvalueindex(1), 19, 67);
    lua_pushvalue(L, 1);
    lua_pushvalue(L, 2);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 4);
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 4);
  } else {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc832);
  assert(lua_gettop(L) == 4);
  return 0;
}
static int lcf1_jsbool_no_force_isomorphism_p(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  enum { lc826 = 2 };
  const int lc827 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc827);
  const int lc828 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc828) {
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc826);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 36);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_replace(L, 1);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 36);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_replace(L, 2);
  assert(lua_gettop(L) == 2);
  enum { lc829 = 2 };
  const int lc830 = lua_compare(L, 1, 2, LUA_OPEQ);
  lua_pushboolean(L, lc830);
  const int lc831 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc831) {
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc829);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf3_end_2, 1);
  assert(lua_gettop(L) == 3);
  enum { lc836 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 19, 95);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc837 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc837) {
    enum { lc838 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 19, 95);
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc839 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc839) {
      lua_pushboolean(L, 0);
      return 1;
      assert(lua_gettop(L) == 3);
    }
    lua_settop(L, lc838);
    assert(lua_gettop(L) == 3);
    lc_getupvalue(L, lua_upvalueindex(1), 19, 67);
    lua_pushvalue(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 19, 96);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 3);
    lc_getupvalue(L, lua_upvalueindex(1), 19, 67);
    lua_pushvalue(L, 2);
    lc_getupvalue(L, lua_upvalueindex(1), 19, 96);
    lua_call(L, 2, 0);
    assert(lua_gettop(L) == 3);
    lua_pushboolean(L, 1);
    return 1;
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc840 = 3 };
    lc_getupvalue(L, lua_upvalueindex(1), 19, 103);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    const int lc841 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc841) {
      enum { lc842 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 19, 103);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc843 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc843) {
        lua_pushboolean(L, 0);
        return 1;
        assert(lua_gettop(L) == 3);
      }
      lua_settop(L, lc842);
      assert(lua_gettop(L) == 3);
      const int lc844 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 19, 101);
      lua_pushvalue(L, 1);
      lua_pushvalue(L, 2);
      lua_call(L, 2, LUA_MULTRET);
      return (lua_gettop(L) - lc844);
      assert(lua_gettop(L) == 3);
    } else {
      enum { lc845 = 3 };
      lc_getupvalue(L, lua_upvalueindex(1), 19, 99);
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
      const int lc846 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc846) {
        enum { lc847 = 3 };
        lc_getupvalue(L, lua_upvalueindex(1), 19, 99);
        lua_pushvalue(L, 2);
        lua_call(L, 1, 1);
        lua_pushboolean(L, !(lua_toboolean(L, -1)));
        lua_remove(L, -2);
        const int lc848 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc848) {
          lua_pushboolean(L, 0);
          return 1;
          assert(lua_gettop(L) == 3);
        }
        lua_settop(L, lc847);
        assert(lua_gettop(L) == 3);
        const int lc849 = lua_gettop(L);
        lua_pushvalue(L, 3);
        lua_pushvalue(L, 1);
        lua_pushvalue(L, 2);
        lc_getupvalue(L, lua_upvalueindex(1), 19, 98);
        lc_getupvalue(L, lua_upvalueindex(1), 19, 97);
        lua_call(L, 4, LUA_MULTRET);
        return (lua_gettop(L) - lc849);
        assert(lua_gettop(L) == 3);
      } else {
        enum { lc850 = 3 };
        lc_getupvalue(L, lua_upvalueindex(1), 19, 93);
        lua_pushvalue(L, 1);
        lua_call(L, 1, 1);
        const int lc851 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc851) {
          enum { lc852 = 3 };
          lc_getupvalue(L, lua_upvalueindex(1), 19, 93);
          lua_pushvalue(L, 2);
          lua_call(L, 1, 1);
          lua_pushboolean(L, !(lua_toboolean(L, -1)));
          lua_remove(L, -2);
          const int lc853 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc853) {
            lua_pushboolean(L, 0);
            return 1;
            assert(lua_gettop(L) == 3);
          }
          lua_settop(L, lc852);
          assert(lua_gettop(L) == 3);
          const int lc854 = lua_gettop(L);
          lua_pushvalue(L, 3);
          lua_pushvalue(L, 1);
          lua_pushvalue(L, 2);
          lc_getupvalue(L, lua_upvalueindex(1), 19, 92);
          lc_getupvalue(L, lua_upvalueindex(1), 19, 91);
          lua_call(L, 4, LUA_MULTRET);
          return (lua_gettop(L) - lc854);
          assert(lua_gettop(L) == 3);
        } else {
          enum { lc855 = 3 };
          lc_getupvalue(L, lua_upvalueindex(1), 19, 35);
          lua_pushvalue(L, 1);
          lua_call(L, 1, 1);
          const int lc856 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc856) {
            lua_pushboolean(L, 0);
            return 1;
            assert(lua_gettop(L) == 3);
          }
          lua_settop(L, lc855);
        }
        lua_settop(L, lc850);
      }
      lua_settop(L, lc845);
    }
    lua_settop(L, lc840);
  }
  lua_settop(L, lc836);
  assert(lua_gettop(L) == 3);
  const int lc857 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc857);
  assert(lua_gettop(L) == 3);
}
static int lcf1_eof(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 206);
  lua_len(L, -1);
  lua_pop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 205);
  const int lc861 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc861);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf1_get(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 124);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 0);
  lua_getglobal(L, "string");
  lua_pushliteral(L, "sub");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 206);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 205);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 205);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lua_call(L, 3, 1);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 205);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lc_setupvalue(L, lua_upvalueindex(1), 0, 205);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_put(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 124);
  lua_getglobal(L, "string");
  lua_pushliteral(L, "sub");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 206);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 205);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 205);
  lua_call(L, 3, 1);
  lua_pushvalue(L, 1);
  const int lc862 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc862);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 205);
  lua_pushnumber(L, 1);
  lc_sub(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lc_setupvalue(L, lua_upvalueindex(1), 0, 205);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_parse_error(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc863 = 1 };
  lua_pushnil(L);
  const int lc864 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc864);
  const int lc865 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc865) {
    lua_pushliteral(L, "");
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc863);
  assert(lua_gettop(L) == 1);
  lua_getglobal(L, "error");
  lua_pushliteral(L, "TheLanguage parse ERROR!");
  lua_getglobal(L, "tostring");
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_concat(L, 2);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_a_space_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushvalue(L, 1);
  lua_pushliteral(L, " ");
  const int lc866 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc866);
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lua_pushvalue(L, 1);
    lua_pushliteral(L, "\n");
    const int lc867 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc867);
  }
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lua_pushvalue(L, 1);
    lua_pushliteral(L, "\9");
    const int lc868 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc868);
  }
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lua_pushvalue(L, 1);
    lua_pushliteral(L, "\13");
    const int lc869 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc869);
  }
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_space(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  enum { lc870 = 0 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  const int lc871 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc871) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 0);
  }
  lua_settop(L, lc870);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  enum { lc872 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 200);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc873 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc873) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 1);
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc872);
  assert(lua_gettop(L) == 1);
  enum { lc874 = 1 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 200);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
      lua_call(L, 0, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
    }
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
    lua_call(L, 0, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc874);
  assert(lua_gettop(L) == 1);
  enum { lc875 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 200);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc876 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc876) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc875);
  assert(lua_gettop(L) == 1);
  lua_pushboolean(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_atom(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  enum { lc877 = 0 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  const int lc878 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc878) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 0);
  }
  lua_settop(L, lc877);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  lua_pushliteral(L, "");
  assert(lua_gettop(L) == 2);
  enum { lc879 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 190);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc880 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc880) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 2);
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc879);
  assert(lua_gettop(L) == 2);
  enum { lc881 = 2 };
  while (1) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 190);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
      lua_call(L, 0, 1);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
    }
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lua_getglobal(L, "tostring");
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    lua_getglobal(L, "tostring");
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_concat(L, 2);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 2);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
    lua_call(L, 0, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc881);
  assert(lua_gettop(L) == 2);
  enum { lc882 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 190);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc883 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc883) {
    lua_getglobal(L, "tostring");
    lua_pushvalue(L, 2);
    lua_call(L, 1, 1);
    lua_getglobal(L, "tostring");
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_concat(L, 2);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 2);
  } else {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc882);
  assert(lua_gettop(L) == 2);
  const int lc884 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 19, 156);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc884);
  assert(lua_gettop(L) == 2);
}
static int lcf1_last_add_do(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 69);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 66);
  const int lc891 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 207);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 100);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc891), 0);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, 2);
  lc_setupvalue(L, lua_upvalueindex(1), 0, 207);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_readlist(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  enum { lc885 = 0 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  const int lc886 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc886) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 0);
  }
  lua_settop(L, lc885);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  enum { lc887 = 1 };
  lua_pushliteral(L, "(");
  const int lc888 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc888);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc889 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc889) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 1);
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc887);
  assert(lua_gettop(L) == 1);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc890 = 2 };
  assert((lua_gettop(L) == lc890));
  lc_getupvalue(L, lua_upvalueindex(1), 21, 69);
  lua_call(L, 0, 1);
  lua_rawseti(L, lc890, 207);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lc890, 0, 207);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, lc890);
  lua_pushcclosure(L, lcf1_last_add_do, 1);
  assert(lua_gettop(L) == 4);
  enum { lc892 = 4 };
  while (1) {
    lua_pushboolean(L, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_getupvalue(L, lc890, 1, 199);
    lua_call(L, 0, 0);
    assert(lua_gettop(L) == 4);
    enum { lc893 = 4 };
    lc_getupvalue(L, lc890, 1, 204);
    lua_call(L, 0, 1);
    const int lc894 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc894) {
      const int lc895 = lua_gettop(L);
      lc_getupvalue(L, lc890, 1, 201);
      lua_call(L, 0, LUA_MULTRET);
      return (lua_gettop(L) - lc895);
      assert(lua_gettop(L) == 4);
    }
    lua_settop(L, lc893);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lc890, 1, 203);
    lua_call(L, 0, 1);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 4);
    enum { lc896 = 4 };
    lua_pushliteral(L, ")");
    const int lc897 = lua_compare(L, 1, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc897);
    const int lc898 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc898) {
      lc_getupvalue(L, lc890, 22, 66);
      lc_getupvalue(L, lc890, 0, 207);
      lc_getupvalue(L, lc890, 22, 96);
      lua_call(L, 2, 0);
      assert(lua_gettop(L) == 4);
      lua_pushvalue(L, 3);
      return 1;
      assert(lua_gettop(L) == 4);
    }
    lua_settop(L, lc896);
    assert(lua_gettop(L) == 4);
    enum { lc899 = 4 };
    lua_pushliteral(L, ".");
    const int lc900 = lua_compare(L, 1, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc900);
    const int lc901 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc901) {
      lc_getupvalue(L, lc890, 1, 199);
      lua_call(L, 0, 0);
      assert(lua_gettop(L) == 4);
      lc_getupvalue(L, lc890, 1, 189);
      lua_call(L, 0, 1);
      assert(lua_gettop(L) == 5);
      lc_getupvalue(L, lc890, 22, 66);
      lc_getupvalue(L, lc890, 0, 207);
      lua_pushvalue(L, 5);
      lua_call(L, 2, 0);
      assert(lua_gettop(L) == 5);
      lc_getupvalue(L, lc890, 1, 199);
      lua_call(L, 0, 0);
      assert(lua_gettop(L) == 5);
      enum { lc902 = 5 };
      lc_getupvalue(L, lc890, 1, 204);
      lua_call(L, 0, 1);
      const int lc903 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc903) {
        const int lc904 = lua_gettop(L);
        lc_getupvalue(L, lc890, 1, 201);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc904);
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc902);
      assert(lua_gettop(L) == 5);
      lc_getupvalue(L, lc890, 1, 203);
      lua_call(L, 0, 1);
      lua_replace(L, 1);
      assert(lua_gettop(L) == 5);
      enum { lc905 = 5 };
      lua_pushliteral(L, ")");
      const int lc906 = lua_compare(L, 1, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc906);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      const int lc907 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc907) {
        const int lc908 = lua_gettop(L);
        lc_getupvalue(L, lc890, 1, 201);
        lua_call(L, 0, LUA_MULTRET);
        return (lua_gettop(L) - lc908);
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc905);
      assert(lua_gettop(L) == 5);
      lua_pushvalue(L, 3);
      return 1;
      assert(lua_gettop(L) == 5);
    }
    lua_settop(L, lc899);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lc890, 1, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lc890, 1, 189);
    lua_call(L, 0, 1);
    assert(lua_gettop(L) == 5);
    lua_pushvalue(L, 4);
    lua_pushvalue(L, 5);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 5);
    lua_pop(L, 1);
  }
  lua_settop(L, lc892);
  assert(lua_gettop(L) == 4);
  return 0;
}
static int lcf1_data(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  enum { lc909 = 0 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  const int lc910 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc910) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 0);
  }
  lua_settop(L, lc909);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  enum { lc911 = 1 };
  lua_pushliteral(L, "#");
  const int lc912 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc912);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc913 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc913) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 1);
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc911);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 197);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 2);
  enum { lc914 = 2 };
  lua_pushboolean(L, 0);
  const int lc915 = lua_compare(L, 2, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc915);
  const int lc916 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc916) {
    const int lc917 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc917);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc914);
  assert(lua_gettop(L) == 2);
  enum { lc918 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 21, 99);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc919 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc919) {
    const int lc920 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc920);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc918);
  assert(lua_gettop(L) == 2);
  const int lc921 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 94);
  const int lc922 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 98);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 97);
  lua_pushvalue(L, 2);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc922), LUA_MULTRET);
  return (lua_gettop(L) - lc921);
  assert(lua_gettop(L) == 2);
}
static int lcf1_a_atom_p(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc923 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 200);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc924 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc924) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc923);
  assert(lua_gettop(L) == 1);
  enum { lc925 = 1 };
  lua_getglobal(L, "ipairs");
  lua_createtable(L, 20, 0);
  lua_pushliteral(L, "(");
  lua_rawseti(L, -2, 1);
  lua_pushliteral(L, ")");
  lua_rawseti(L, -2, 2);
  lua_pushliteral(L, "!");
  lua_rawseti(L, -2, 3);
  lua_pushliteral(L, "#");
  lua_rawseti(L, -2, 4);
  lua_pushliteral(L, ".");
  lua_rawseti(L, -2, 5);
  lua_pushliteral(L, "$");
  lua_rawseti(L, -2, 6);
  lua_pushliteral(L, "%");
  lua_rawseti(L, -2, 7);
  lua_pushliteral(L, "^");
  lua_rawseti(L, -2, 8);
  lua_pushliteral(L, "@");
  lua_rawseti(L, -2, 9);
  lua_pushliteral(L, "~");
  lua_rawseti(L, -2, 10);
  lua_pushliteral(L, "/");
  lua_rawseti(L, -2, 11);
  lua_pushliteral(L, "-");
  lua_rawseti(L, -2, 12);
  lua_pushliteral(L, ">");
  lua_rawseti(L, -2, 13);
  lua_pushliteral(L, "_");
  lua_rawseti(L, -2, 14);
  lua_pushliteral(L, ":");
  lua_rawseti(L, -2, 15);
  lua_pushliteral(L, "?");
  lua_rawseti(L, -2, 16);
  lua_pushliteral(L, "[");
  lua_rawseti(L, -2, 17);
  lua_pushliteral(L, "]");
  lua_rawseti(L, -2, 18);
  lua_pushliteral(L, "&");
  lua_rawseti(L, -2, 19);
  lua_pushliteral(L, ";");
  lua_rawseti(L, -2, 20);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 2);
    if (lua_isnil(L, -2)) {
      break;
    }
    lua_pushvalue(L, -2);
    lua_replace(L, -4);
    enum { lc926 = 6 };
    const int lc927 = lua_compare(L, 6, 1, LUA_OPEQ);
    lua_pushboolean(L, lc927);
    const int lc928 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc928) {
      lua_pushboolean(L, 0);
      return 1;
      assert(lua_gettop(L) == 6);
    }
    lua_settop(L, lc926);
    assert(lua_gettop(L) == 6);
    lua_pop(L, 2);
  }
  lua_settop(L, lc925);
  assert(lua_gettop(L) == 1);
  lua_pushboolean(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_val(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 199);
  lua_call(L, 0, 0);
  assert(lua_gettop(L) == 0);
  lua_createtable(L, 8, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 197);
  lua_rawseti(L, -2, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 182);
  lua_rawseti(L, -2, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 196);
  lua_rawseti(L, -2, 3);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 195);
  lua_rawseti(L, -2, 4);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 194);
  lua_rawseti(L, -2, 5);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 193);
  lua_rawseti(L, -2, 6);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 192);
  lua_rawseti(L, -2, 7);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 191);
  lua_rawseti(L, -2, 8);
  assert(lua_gettop(L) == 1);
  enum { lc929 = 1 };
  lua_getglobal(L, "ipairs");
  lua_pushvalue(L, 1);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 2);
    if (lua_isnil(L, -2)) {
      break;
    }
    lua_pushvalue(L, -2);
    lua_replace(L, -4);
    lua_pushvalue(L, 6);
    lua_call(L, 0, 1);
    assert(lua_gettop(L) == 7);
    enum { lc930 = 7 };
    lua_pushboolean(L, 0);
    const int lc931 = lua_compare(L, 7, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc931);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc932 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc932) {
      lua_pushvalue(L, 7);
      return 1;
      assert(lua_gettop(L) == 7);
    }
    lua_settop(L, lc930);
    assert(lua_gettop(L) == 7);
    lua_pop(L, 3);
  }
  lua_settop(L, lc929);
  assert(lua_gettop(L) == 1);
  const int lc933 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc933);
  assert(lua_gettop(L) == 1);
}
static int lcf1_un_maybe(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc934 = 1 };
  lua_pushboolean(L, 0);
  const int lc935 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc935);
  const int lc936 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc936) {
    const int lc937 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc937);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc934);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_not_eof(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf1_assert_get(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 188);
  const int lc938 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 187);
  lua_call(L, 0, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc938), 0);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 188);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
  lua_call(L, 0, 1);
  lua_pushvalue(L, 1);
  const int lc939 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc939);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_readsysname_no_pack_bracket(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 186);
  lua_pushliteral(L, "[");
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 186);
  lua_pushliteral(L, "]");
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1_readsysname_no_pack_inner_must(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc940 = 1 };
  lua_pushnil(L);
  const int lc941 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc941);
  const int lc942 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc942) {
    lua_pushboolean(L, 0);
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc940);
  assert(lua_gettop(L) == 1);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf1_readsysname_no_pack_bracket, 1);
  assert(lua_gettop(L) == 2);
  lua_settop(L, (lua_gettop(L) + 1));
  assert(lua_gettop(L) == 3);
  enum { lc943 = 3 };
  if (lua_toboolean(L, 1)) {
    lua_createtable(L, 9, 0);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 197);
    lua_rawseti(L, -2, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 198);
    lua_rawseti(L, -2, 2);
    lua_pushvalue(L, 2);
    lua_rawseti(L, -2, 3);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 196);
    lua_rawseti(L, -2, 4);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 195);
    lua_rawseti(L, -2, 5);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 194);
    lua_rawseti(L, -2, 6);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 193);
    lua_rawseti(L, -2, 7);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 192);
    lua_rawseti(L, -2, 8);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 191);
    lua_rawseti(L, -2, 9);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  } else {
    lua_createtable(L, 8, 0);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 197);
    lua_rawseti(L, -2, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 183);
    lua_rawseti(L, -2, 2);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 196);
    lua_rawseti(L, -2, 3);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 195);
    lua_rawseti(L, -2, 4);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 194);
    lua_rawseti(L, -2, 5);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 193);
    lua_rawseti(L, -2, 6);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 192);
    lua_rawseti(L, -2, 7);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 191);
    lua_rawseti(L, -2, 8);
    lua_replace(L, 3);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc943);
  assert(lua_gettop(L) == 3);
  enum { lc944 = 3 };
  lua_getglobal(L, "ipairs");
  lua_pushvalue(L, 3);
  lua_call(L, 1, 3);
  while (1) {
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_pushvalue(L, -3);
    lua_call(L, 2, 2);
    if (lua_isnil(L, -2)) {
      break;
    }
    lua_pushvalue(L, -2);
    lua_replace(L, -4);
    lua_pushvalue(L, 8);
    lua_call(L, 0, 1);
    assert(lua_gettop(L) == 9);
    enum { lc945 = 9 };
    lua_pushboolean(L, 0);
    const int lc946 = lua_compare(L, 9, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc946);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    const int lc947 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc947) {
      lua_pushvalue(L, 9);
      return 1;
      assert(lua_gettop(L) == 9);
    }
    lua_settop(L, lc945);
    assert(lua_gettop(L) == 9);
    lua_pop(L, 3);
  }
  lua_settop(L, lc944);
  assert(lua_gettop(L) == 3);
  const int lc948 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc948);
  assert(lua_gettop(L) == 3);
}
static int lcf1_may_xfx_xf(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc949 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  const int lc950 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc950) {
    lua_pushvalue(L, 1);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc949);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 2);
  enum { lc951 = 2 };
  lua_pushliteral(L, ".");
  const int lc952 = lua_compare(L, 2, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc952);
  const int lc953 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc953) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
    lua_call(L, 0, 1);
    assert(lua_gettop(L) == 3);
    const int lc954 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
    lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
    lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
    lc_getupvalue(L, lua_upvalueindex(1), 21, 62);
    lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 16, 159);
    lua_call(L, 3, 1);
    lua_pushvalue(L, 3);
    lua_call(L, 3, LUA_MULTRET);
    return (lua_gettop(L) - lc954);
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc955 = 2 };
    lua_pushliteral(L, ":");
    const int lc956 = lua_compare(L, 2, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc956);
    const int lc957 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc957) {
      lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
      lua_call(L, 0, 1);
      assert(lua_gettop(L) == 3);
      const int lc958 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
      lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
      lua_pushvalue(L, 3);
      lua_pushvalue(L, 1);
      lua_call(L, 3, LUA_MULTRET);
      return (lua_gettop(L) - lc958);
      assert(lua_gettop(L) == 3);
    } else {
      enum { lc959 = 2 };
      lua_pushliteral(L, "~");
      const int lc960 = lua_compare(L, 2, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc960);
      const int lc961 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc961) {
        const int lc962 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
        lc_getupvalue(L, lua_upvalueindex(1), 14, 161);
        lua_pushvalue(L, 1);
        lua_call(L, 2, LUA_MULTRET);
        return (lua_gettop(L) - lc962);
        assert(lua_gettop(L) == 2);
      } else {
        enum { lc963 = 2 };
        lua_pushliteral(L, "@");
        const int lc964 = lua_compare(L, 2, -1, LUA_OPEQ);
        lua_pop(L, 1);
        lua_pushboolean(L, lc964);
        const int lc965 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc965) {
          lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
          lua_call(L, 0, 1);
          assert(lua_gettop(L) == 3);
          const int lc966 = lua_gettop(L);
          lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
          lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
          lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
          lc_getupvalue(L, lua_upvalueindex(1), 21, 62);
          lc_getupvalue(L, lua_upvalueindex(1), 21, 100);
          lua_pushvalue(L, 1);
          lc_getupvalue(L, lua_upvalueindex(1), 16, 159);
          lua_call(L, 2, 1);
          lc_getupvalue(L, lua_upvalueindex(1), 16, 159);
          lua_call(L, 3, 1);
          lua_pushvalue(L, 3);
          lua_call(L, 3, LUA_MULTRET);
          return (lua_gettop(L) - lc966);
          assert(lua_gettop(L) == 3);
        } else {
          enum { lc967 = 2 };
          lua_pushliteral(L, "?");
          const int lc968 = lua_compare(L, 2, -1, LUA_OPEQ);
          lua_pop(L, 1);
          lua_pushboolean(L, lc968);
          const int lc969 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc969) {
            const int lc970 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
            const int lc971 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
            lc_getupvalue(L, lua_upvalueindex(1), 21, 62);
            lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
            lc_getupvalue(L, lua_upvalueindex(1), 14, 161);
            lua_pushvalue(L, 1);
            lua_call(L, 2, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc971), LUA_MULTRET);
            return (lua_gettop(L) - lc970);
            assert(lua_gettop(L) == 2);
          } else {
            enum { lc972 = 2 };
            lua_pushliteral(L, "/");
            const int lc973 = lua_compare(L, 2, -1, LUA_OPEQ);
            lua_pop(L, 1);
            lua_pushboolean(L, lc973);
            const int lc974 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc974) {
              lua_createtable(L, 1, 0);
              lua_pushvalue(L, 1);
              lua_rawseti(L, -2, 1);
              assert(lua_gettop(L) == 3);
              enum { lc975 = 3 };
              while (1) {
                lua_pushboolean(L, 1);
                if (!(lua_toboolean(L, -1))) {
                  break;
                }
                lua_pop(L, 1);
                lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
                lua_pushboolean(L, 1);
                lua_call(L, 1, 1);
                assert(lua_gettop(L) == 4);
                lc_getupvalue(L, lua_upvalueindex(1), 23, 1);
                lua_pushvalue(L, 3);
                lua_pushvalue(L, 4);
                lua_call(L, 2, 0);
                assert(lua_gettop(L) == 4);
                enum { lc976 = 4 };
                lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
                lua_call(L, 0, 1);
                const int lc977 = lua_toboolean(L, -1);
                lua_pop(L, 1);
                if (lc977) {
                  break;
                  assert(lua_gettop(L) == 4);
                }
                lua_settop(L, lc976);
                assert(lua_gettop(L) == 4);
                lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
                lua_call(L, 0, 1);
                assert(lua_gettop(L) == 5);
                enum { lc978 = 5 };
                lua_pushliteral(L, "/");
                const int lc979 = lua_compare(L, 5, -1, LUA_OPEQ);
                lua_pop(L, 1);
                lua_pushboolean(L, lc979);
                lua_pushboolean(L, !(lua_toboolean(L, -1)));
                lua_remove(L, -2);
                const int lc980 = lua_toboolean(L, -1);
                lua_pop(L, 1);
                if (lc980) {
                  lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
                  lua_pushvalue(L, 5);
                  lua_call(L, 1, 0);
                  assert(lua_gettop(L) == 5);
                  break;
                  assert(lua_gettop(L) == 5);
                }
                lua_settop(L, lc978);
                assert(lua_gettop(L) == 5);
                lua_pop(L, 2);
              }
              lua_settop(L, lc975);
              assert(lua_gettop(L) == 3);
              const int lc981 = lua_gettop(L);
              lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
              const int lc982 = lua_gettop(L);
              lc_getupvalue(L, lua_upvalueindex(1), 13, 162);
              lc_getupvalue(L, lua_upvalueindex(1), 21, 38);
              lua_pushvalue(L, 3);
              lua_call(L, 1, LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc982), LUA_MULTRET);
              return (lua_gettop(L) - lc981);
              assert(lua_gettop(L) == 3);
            } else {
              lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
              lua_pushvalue(L, 2);
              lua_call(L, 1, 0);
              assert(lua_gettop(L) == 2);
              lua_pushvalue(L, 1);
              return 1;
              assert(lua_gettop(L) == 2);
            }
            lua_settop(L, lc972);
          }
          lua_settop(L, lc967);
        }
        lua_settop(L, lc963);
      }
      lua_settop(L, lc959);
    }
    lua_settop(L, lc955);
  }
  lua_settop(L, lc951);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_readsysname_no_pack(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  enum { lc983 = 0 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 204);
  lua_call(L, 0, 1);
  const int lc984 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc984) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 0);
  }
  lua_settop(L, lc983);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  enum { lc985 = 1 };
  lua_pushliteral(L, "&");
  const int lc986 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc986);
  const int lc987 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc987) {
    lc_getupvalue(L, lua_upvalueindex(1), 0, 188);
    const int lc988 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 187);
    lua_call(L, 0, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc988), 0);
    assert(lua_gettop(L) == 1);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
    lua_call(L, 0, 1);
    assert(lua_gettop(L) == 2);
    enum { lc989 = 2 };
    lua_pushliteral(L, "+");
    const int lc990 = lua_compare(L, 2, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc990);
    const int lc991 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc991) {
      lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
      lua_call(L, 0, 1);
      assert(lua_gettop(L) == 3);
      const int lc992 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
      const int lc993 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 21, 61);
      lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
      lc_getupvalue(L, lua_upvalueindex(1), 21, 64);
      lua_pushvalue(L, 3);
      lua_call(L, 2, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc993), LUA_MULTRET);
      return (lua_gettop(L) - lc992);
      assert(lua_gettop(L) == 3);
    } else {
      lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
      lua_pushvalue(L, 2);
      lua_call(L, 1, 0);
      assert(lua_gettop(L) == 2);
    }
    lua_settop(L, lc989);
    assert(lua_gettop(L) == 2);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
    lua_call(L, 0, 1);
    assert(lua_gettop(L) == 3);
    const int lc994 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
    lc_getupvalue(L, lua_upvalueindex(1), 21, 61);
    lua_pushvalue(L, 3);
    lua_call(L, 2, LUA_MULTRET);
    return (lua_gettop(L) - lc994);
    assert(lua_gettop(L) == 3);
  } else {
    enum { lc995 = 1 };
    lua_pushliteral(L, ":");
    const int lc996 = lua_compare(L, 1, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc996);
    const int lc997 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc997) {
      lc_getupvalue(L, lua_upvalueindex(1), 0, 188);
      const int lc998 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 187);
      lua_call(L, 0, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc998), 0);
      assert(lua_gettop(L) == 1);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 203);
      lua_call(L, 0, 1);
      assert(lua_gettop(L) == 2);
      enum { lc999 = 2 };
      lua_pushliteral(L, "&");
      const int lc1000 = lua_compare(L, 2, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc1000);
      const int lc1001 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1001) {
        lc_getupvalue(L, lua_upvalueindex(1), 0, 186);
        lua_pushliteral(L, ">");
        lua_call(L, 1, 0);
        assert(lua_gettop(L) == 2);
        lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
        lua_call(L, 0, 1);
        assert(lua_gettop(L) == 3);
        const int lc1002 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
        lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
        const int lc1003 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 61);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 62);
        lc_getupvalue(L, lua_upvalueindex(1), 16, 159);
        lua_pushvalue(L, 3);
        lua_call(L, 3, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1003), 1);
        lc_getupvalue(L, lua_upvalueindex(1), 17, 158);
        lua_call(L, 3, LUA_MULTRET);
        return (lua_gettop(L) - lc1002);
        assert(lua_gettop(L) == 3);
      } else {
        enum { lc1004 = 2 };
        lua_pushliteral(L, ">");
        const int lc1005 = lua_compare(L, 2, -1, LUA_OPEQ);
        lua_pop(L, 1);
        lua_pushboolean(L, lc1005);
        const int lc1006 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1006) {
          lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
          lua_call(L, 0, 1);
          assert(lua_gettop(L) == 3);
          const int lc1007 = lua_gettop(L);
          lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
          lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
          lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
          lc_getupvalue(L, lua_upvalueindex(1), 21, 62);
          lc_getupvalue(L, lua_upvalueindex(1), 16, 159);
          lua_pushvalue(L, 3);
          lua_call(L, 3, 1);
          lc_getupvalue(L, lua_upvalueindex(1), 17, 158);
          lua_call(L, 3, LUA_MULTRET);
          return (lua_gettop(L) - lc1007);
          assert(lua_gettop(L) == 3);
        } else {
          lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
          lua_pushvalue(L, 2);
          lua_call(L, 1, 0);
          assert(lua_gettop(L) == 2);
        }
        lua_settop(L, lc1004);
      }
      lua_settop(L, lc999);
      assert(lua_gettop(L) == 2);
      lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
      lua_call(L, 0, 1);
      assert(lua_gettop(L) == 3);
      const int lc1008 = lua_gettop(L);
      lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
      lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
      lua_pushvalue(L, 3);
      lc_getupvalue(L, lua_upvalueindex(1), 17, 158);
      lua_call(L, 3, LUA_MULTRET);
      return (lua_gettop(L) - lc1008);
      assert(lua_gettop(L) == 3);
    } else {
      enum { lc1009 = 1 };
      lua_pushliteral(L, "+");
      const int lc1010 = lua_compare(L, 1, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc1010);
      const int lc1011 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1011) {
        lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
        lua_call(L, 0, 1);
        assert(lua_gettop(L) == 2);
        const int lc1012 = lua_gettop(L);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
        lc_getupvalue(L, lua_upvalueindex(1), 21, 64);
        lua_pushvalue(L, 2);
        lua_call(L, 2, LUA_MULTRET);
        return (lua_gettop(L) - lc1012);
        assert(lua_gettop(L) == 2);
      } else {
        enum { lc1013 = 1 };
        lua_pushliteral(L, "[");
        const int lc1014 = lua_compare(L, 1, -1, LUA_OPEQ);
        lua_pop(L, 1);
        lua_pushboolean(L, lc1014);
        const int lc1015 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1015) {
          lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
          lua_call(L, 0, 1);
          assert(lua_gettop(L) == 2);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 186);
          lua_pushliteral(L, "]");
          lua_call(L, 1, 0);
          assert(lua_gettop(L) == 2);
          const int lc1016 = lua_gettop(L);
          lc_getupvalue(L, lua_upvalueindex(1), 0, 184);
          lua_pushvalue(L, 2);
          lua_call(L, 1, LUA_MULTRET);
          return (lua_gettop(L) - lc1016);
          assert(lua_gettop(L) == 2);
        } else {
          enum { lc1017 = 1 };
          lua_pushliteral(L, "_");
          const int lc1018 = lua_compare(L, 1, -1, LUA_OPEQ);
          lua_pop(L, 1);
          lua_pushboolean(L, lc1018);
          const int lc1019 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1019) {
            lc_getupvalue(L, lua_upvalueindex(1), 0, 186);
            lua_pushliteral(L, ":");
            lua_call(L, 1, 0);
            assert(lua_gettop(L) == 1);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 185);
            lua_call(L, 0, 1);
            assert(lua_gettop(L) == 2);
            const int lc1020 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 21, 37);
            lc_getupvalue(L, lua_upvalueindex(1), 15, 160);
            lua_pushvalue(L, 2);
            lc_getupvalue(L, lua_upvalueindex(1), 16, 159);
            lua_call(L, 3, LUA_MULTRET);
            return (lua_gettop(L) - lc1020);
            assert(lua_gettop(L) == 2);
          } else {
            lc_getupvalue(L, lua_upvalueindex(1), 0, 202);
            lua_pushvalue(L, 1);
            lua_call(L, 1, 0);
            assert(lua_gettop(L) == 1);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 198);
            lua_call(L, 0, 1);
            assert(lua_gettop(L) == 2);
            enum { lc1021 = 2 };
            lua_pushboolean(L, 0);
            const int lc1022 = lua_compare(L, 2, -1, LUA_OPEQ);
            lua_pop(L, 1);
            lua_pushboolean(L, lc1022);
            const int lc1023 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc1023) {
              lua_pushboolean(L, 0);
              return 1;
              assert(lua_gettop(L) == 2);
            }
            lua_settop(L, lc1021);
            assert(lua_gettop(L) == 2);
            const int lc1024 = lua_gettop(L);
            lc_getupvalue(L, lua_upvalueindex(1), 0, 184);
            lua_pushvalue(L, 2);
            lua_call(L, 1, LUA_MULTRET);
            return (lua_gettop(L) - lc1024);
            assert(lua_gettop(L) == 2);
          }
          lua_settop(L, lc1017);
        }
        lua_settop(L, lc1013);
      }
      lua_settop(L, lc1009);
    }
    lua_settop(L, lc995);
  }
  lua_settop(L, lc985);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_readsysname(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 183);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  enum { lc1025 = 1 };
  lua_pushboolean(L, 0);
  const int lc1026 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1026);
  const int lc1027 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1027) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc1025);
  assert(lua_gettop(L) == 1);
  enum { lc1028 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 21, 103);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc1029 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1029) {
    lua_pushvalue(L, 1);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc1028);
  assert(lua_gettop(L) == 1);
  const int lc1030 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 10, 165);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc1030);
  assert(lua_gettop(L) == 1);
}
static int lcf1050(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  enum { lc1032 = 0 };
  lc_getupvalue(L, lua_upvalueindex(1), 1, 204);
  lua_call(L, 0, 1);
  const int lc1033 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1033) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 0);
  }
  lua_settop(L, lc1032);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  enum { lc1034 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 208);
  const int lc1035 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1035);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc1036 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1036) {
    lc_getupvalue(L, lua_upvalueindex(1), 1, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 1);
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc1034);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 197);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 2);
  enum { lc1037 = 2 };
  lua_pushboolean(L, 0);
  const int lc1038 = lua_compare(L, 2, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1038);
  const int lc1039 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1039) {
    const int lc1040 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1040);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc1037);
  assert(lua_gettop(L) == 2);
  enum { lc1041 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 22, 99);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc1042 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1042) {
    const int lc1043 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1043);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc1041);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 97);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 3);
  enum { lc1044 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 22, 99);
  lua_pushvalue(L, 3);
  lua_call(L, 1, 1);
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 22, 95);
    const int lc1045 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 22, 97);
    lua_pushvalue(L, 3);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc1045), 1);
  }
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc1046 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1046) {
    const int lc1047 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1047);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc1044);
  assert(lua_gettop(L) == 3);
  const int lc1048 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 209);
  const int lc1049 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 98);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 98);
  lua_pushvalue(L, 3);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1049), LUA_MULTRET);
  return (lua_gettop(L) - lc1048);
  assert(lua_gettop(L) == 3);
}
static int lcf1_make_read_two(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1031 = 3 };
  assert((lua_gettop(L) == lc1031));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 208);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 209);
  lua_pushvalue(L, lc1031);
  lua_pushcclosure(L, lcf1050, 1);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1073(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  enum { lc1052 = 0 };
  lc_getupvalue(L, lua_upvalueindex(1), 1, 204);
  lua_call(L, 0, 1);
  const int lc1053 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1053) {
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 0);
  }
  lua_settop(L, lc1052);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 203);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 1);
  enum { lc1054 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 210);
  const int lc1055 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1055);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc1056 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1056) {
    lc_getupvalue(L, lua_upvalueindex(1), 1, 202);
    lua_pushvalue(L, 1);
    lua_call(L, 1, 0);
    assert(lua_gettop(L) == 1);
    lua_pushboolean(L, 0);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc1054);
  assert(lua_gettop(L) == 1);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 197);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) == 2);
  enum { lc1057 = 2 };
  lua_pushboolean(L, 0);
  const int lc1058 = lua_compare(L, 2, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1058);
  const int lc1059 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1059) {
    const int lc1060 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1060);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc1057);
  assert(lua_gettop(L) == 2);
  enum { lc1061 = 2 };
  lc_getupvalue(L, lua_upvalueindex(1), 22, 99);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc1062 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1062) {
    const int lc1063 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1063);
    assert(lua_gettop(L) == 2);
  }
  lua_settop(L, lc1061);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 97);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 3);
  enum { lc1064 = 3 };
  lc_getupvalue(L, lua_upvalueindex(1), 22, 99);
  lua_pushvalue(L, 3);
  lua_call(L, 1, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc1065 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1065) {
    const int lc1066 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1066);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc1064);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 97);
  lua_pushvalue(L, 3);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 4);
  enum { lc1067 = 4 };
  lc_getupvalue(L, lua_upvalueindex(1), 22, 99);
  lua_pushvalue(L, 4);
  lua_call(L, 1, 1);
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lc_getupvalue(L, lua_upvalueindex(1), 22, 95);
    const int lc1068 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 22, 97);
    lua_pushvalue(L, 4);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc1068), 1);
  }
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  const int lc1069 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1069) {
    const int lc1070 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1070);
    assert(lua_gettop(L) == 4);
  }
  lua_settop(L, lc1067);
  assert(lua_gettop(L) == 4);
  const int lc1071 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 211);
  const int lc1072 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 98);
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 98);
  lua_pushvalue(L, 3);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 22, 98);
  lua_pushvalue(L, 4);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1072), LUA_MULTRET);
  return (lua_gettop(L) - lc1071);
  assert(lua_gettop(L) == 4);
}
static int lcf1_make_read_three(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1051 = 3 };
  assert((lua_gettop(L) == lc1051));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 210);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 211);
  lua_pushvalue(L, lc1051);
  lua_pushcclosure(L, lcf1073, 1);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1079(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 172);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 3);
  enum { lc1074 = 3 };
  lua_pushboolean(L, 0);
  const int lc1075 = lua_compare(L, 3, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1075);
  const int lc1076 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1076) {
    const int lc1077 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1077);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc1074);
  assert(lua_gettop(L) == 3);
  const int lc1078 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 88);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 2);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc1078);
  assert(lua_gettop(L) == 3);
}
static int lcf1080(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1082(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc1081 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc1081);
  assert(lua_gettop(L) == 2);
}
static int lcf1084(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 169);
  lua_pushvalue(L, 2);
  lua_pushcfunction(L, lcf1080);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf1082, 1);
  lua_call(L, 3, 1);
  assert(lua_gettop(L) == 3);
  const int lc1083 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 79);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 3);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc1083);
  assert(lua_gettop(L) == 3);
}
static int lcf1085(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1087(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc1086 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc1086);
  assert(lua_gettop(L) == 2);
}
static int lcf1093(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 169);
  lua_pushvalue(L, 3);
  lua_pushcfunction(L, lcf1085);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf1087, 1);
  lua_call(L, 3, 1);
  assert(lua_gettop(L) == 4);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 172);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 5);
  enum { lc1088 = 5 };
  lua_pushboolean(L, 0);
  const int lc1089 = lua_compare(L, 5, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1089);
  const int lc1090 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1090) {
    const int lc1091 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1091);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc1088);
  assert(lua_gettop(L) == 5);
  const int lc1092 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 84);
  lua_pushvalue(L, 5);
  lua_pushvalue(L, 2);
  lua_pushvalue(L, 4);
  lua_call(L, 3, LUA_MULTRET);
  return (lua_gettop(L) - lc1092);
  assert(lua_gettop(L) == 5);
}
static int lcf1094(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_pushvalue(L, 1);
  return 1;
  assert(lua_gettop(L) == 1);
}
static int lcf1096(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc1095 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 201);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc1095);
  assert(lua_gettop(L) == 2);
}
static int lcf1098(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 169);
  lua_pushvalue(L, 2);
  lua_pushcfunction(L, lcf1094);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf1096, 1);
  lua_call(L, 3, 1);
  assert(lua_gettop(L) == 3);
  const int lc1097 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 75);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 3);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc1097);
  assert(lua_gettop(L) == 3);
}
static int lcf1100(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc1099 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 21, 108);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc1099);
  assert(lua_gettop(L) == 2);
}
static int lcf1_complex_parse(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc859 = 2 };
  assert((lua_gettop(L) == lc859));
  lua_settop(L, (lua_gettop(L) + 25));
  lua_rawseti(L, lc859, 182);
  lua_rawseti(L, lc859, 183);
  lua_rawseti(L, lc859, 184);
  lua_rawseti(L, lc859, 185);
  lua_rawseti(L, lc859, 186);
  lua_rawseti(L, lc859, 187);
  lua_rawseti(L, lc859, 188);
  lua_rawseti(L, lc859, 189);
  lua_rawseti(L, lc859, 190);
  lua_rawseti(L, lc859, 191);
  lua_rawseti(L, lc859, 192);
  lua_rawseti(L, lc859, 193);
  lua_rawseti(L, lc859, 194);
  lua_rawseti(L, lc859, 195);
  lua_rawseti(L, lc859, 196);
  lua_rawseti(L, lc859, 197);
  lua_rawseti(L, lc859, 198);
  lua_rawseti(L, lc859, 199);
  lua_rawseti(L, lc859, 200);
  lua_rawseti(L, lc859, 201);
  lua_rawseti(L, lc859, 202);
  lua_rawseti(L, lc859, 203);
  lua_rawseti(L, lc859, 204);
  lua_rawseti(L, lc859, 205);
  lua_rawseti(L, lc859, 206);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_eof, 1);
  lc_setupvalue(L, lc859, 0, 204);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_get, 1);
  lc_setupvalue(L, lc859, 0, 203);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_put, 1);
  lc_setupvalue(L, lc859, 0, 202);
  assert(lua_gettop(L) == 2);
  lua_pushcfunction(L, lcf1_parse_error);
  lc_setupvalue(L, lc859, 0, 201);
  assert(lua_gettop(L) == 2);
  lua_pushcfunction(L, lcf1_a_space_p);
  lc_setupvalue(L, lc859, 0, 200);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_space, 1);
  lc_setupvalue(L, lc859, 0, 199);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_atom, 1);
  lc_setupvalue(L, lc859, 0, 198);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_readlist, 1);
  lc_setupvalue(L, lc859, 0, 197);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_data, 1);
  lc_setupvalue(L, lc859, 0, 196);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_a_atom_p, 1);
  lc_setupvalue(L, lc859, 0, 190);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_val, 1);
  lc_setupvalue(L, lc859, 0, 189);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_un_maybe, 1);
  lc_setupvalue(L, lc859, 0, 188);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_not_eof, 1);
  lc_setupvalue(L, lc859, 0, 187);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_assert_get, 1);
  lc_setupvalue(L, lc859, 0, 186);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_readsysname_no_pack_inner_must, 1);
  lc_setupvalue(L, lc859, 0, 185);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_may_xfx_xf, 1);
  lc_setupvalue(L, lc859, 0, 184);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_readsysname_no_pack, 1);
  lc_setupvalue(L, lc859, 0, 183);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_readsysname, 1);
  lc_setupvalue(L, lc859, 0, 182);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, 1);
  lc_setupvalue(L, lc859, 0, 206);
  assert(lua_gettop(L) == 2);
  lua_pushnumber(L, 0);
  lc_setupvalue(L, lc859, 0, 205);
  assert(lua_gettop(L) == 2);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_make_read_two, 1);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1_make_read_three, 1);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 3);
  lua_pushliteral(L, "$");
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1079, 1);
  lua_call(L, 2, 1);
  lc_setupvalue(L, lc859, 0, 195);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 3);
  lua_pushliteral(L, "%");
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1084, 1);
  lua_call(L, 2, 1);
  lc_setupvalue(L, lc859, 0, 194);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 4);
  lua_pushliteral(L, "@");
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1093, 1);
  lua_call(L, 2, 1);
  lc_setupvalue(L, lc859, 0, 193);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 3);
  lua_pushliteral(L, "^");
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1098, 1);
  lua_call(L, 2, 1);
  lc_setupvalue(L, lc859, 0, 192);
  assert(lua_gettop(L) == 4);
  lua_pushvalue(L, 3);
  lua_pushliteral(L, ";");
  lua_pushvalue(L, lc859);
  lua_pushcclosure(L, lcf1100, 1);
  lua_call(L, 2, 1);
  lc_setupvalue(L, lc859, 0, 191);
  assert(lua_gettop(L) == 4);
  const int lc1101 = lua_gettop(L);
  lc_getupvalue(L, lc859, 0, 189);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc1101);
  assert(lua_gettop(L) == 4);
}
static int lcf1_inner_bracket(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc1108 = 1 };
  lc_getupvalue(L, lua_upvalueindex(1), 0, 214);
  const int lc1109 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1109) {
    lua_pushliteral(L, "[");
    lua_getglobal(L, "tostring");
    lua_pushvalue(L, 1);
    lua_call(L, 1, 1);
    lua_pushliteral(L, "]");
    lua_concat(L, 2);
    lua_concat(L, 2);
    return 1;
    assert(lua_gettop(L) == 1);
  } else {
    lua_pushvalue(L, 1);
    return 1;
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc1108);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_print_sys_name(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1104 = 3 };
  assert((lua_gettop(L) == lc1104));
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 214);
  enum { lc1105 = 3 };
  lc_getupvalue(L, lc1104, 23, 103);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  const int lc1106 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1106) {
    const int lc1107 = lua_gettop(L);
    lc_getupvalue(L, lc1104, 23, 102);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc1107);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc1105);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, lc1104);
  lua_pushcclosure(L, lcf1_inner_bracket, 1);
  assert(lua_gettop(L) == 4);
  lc_getupvalue(L, lc1104, 7, 170);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 5);
  enum { lc1110 = 5 };
  lua_pushboolean(L, 0);
  const int lc1111 = lua_compare(L, 5, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1111);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lua_len(L, 5);
    lua_pushnumber(L, 3);
    const int lc1113 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc1113);
  }
  if (lua_toboolean(L, -1)) {
    lua_pop(L, 1);
    lc_getupvalue(L, lc1104, 4, 180);
    lua_pushnumber(L, 1);
    lua_gettable(L, 5);
    lc_getupvalue(L, lc1104, 17, 160);
    lua_call(L, 2, 1);
  }
  const int lc1114 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1114) {
    lc_getupvalue(L, lc1104, 7, 170);
    lua_pushnumber(L, 2);
    lua_gettable(L, 5);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 6);
    enum { lc1115 = 6 };
    lua_pushboolean(L, 0);
    const int lc1116 = lua_compare(L, 6, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc1116);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lua_len(L, 6);
      lua_pushnumber(L, 3);
      const int lc1118 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc1118);
    }
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lc_getupvalue(L, lc1104, 4, 180);
      lua_pushnumber(L, 1);
      lua_gettable(L, 6);
      lc_getupvalue(L, lc1104, 23, 62);
      lua_call(L, 2, 1);
    }
    const int lc1119 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1119) {
      lua_pushnumber(L, 2);
      lua_gettable(L, 6);
      assert(lua_gettop(L) == 7);
      lc_getupvalue(L, lc1104, 7, 170);
      lua_pushvalue(L, 7);
      lua_call(L, 1, 1);
      assert(lua_gettop(L) == 8);
      enum { lc1120 = 8 };
      lua_pushboolean(L, 0);
      const int lc1121 = lua_compare(L, 8, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc1121);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      if (lua_toboolean(L, -1)) {
        lua_pop(L, 1);
        lua_len(L, 8);
        lua_pushnumber(L, 1);
        const int lc1123 = lua_compare(L, -2, -1, LUA_OPEQ);
        lua_pop(L, 2);
        lua_pushboolean(L, lc1123);
      }
      if (lua_toboolean(L, -1)) {
        lua_pop(L, 1);
        lc_getupvalue(L, lc1104, 4, 180);
        lua_pushnumber(L, 3);
        lua_gettable(L, 6);
        lc_getupvalue(L, lc1104, 18, 159);
        lua_call(L, 2, 1);
      }
      const int lc1124 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1124) {
        const int lc1125 = lua_gettop(L);
        lua_pushvalue(L, 4);
        lua_getglobal(L, "tostring");
        const int lc1126 = lua_gettop(L);
        lc_getupvalue(L, lc1104, 1, 213);
        lua_pushnumber(L, 1);
        lua_gettable(L, 8);
        lua_pushboolean(L, 1);
        lua_call(L, 2, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1126), 1);
        lua_pushliteral(L, ".");
        lua_getglobal(L, "tostring");
        const int lc1127 = lua_gettop(L);
        lc_getupvalue(L, lc1104, 1, 213);
        lua_pushnumber(L, 3);
        lua_gettable(L, 5);
        lua_pushboolean(L, 1);
        lua_call(L, 2, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1127), 1);
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_call(L, 1, LUA_MULTRET);
        return (lua_gettop(L) - lc1125);
        assert(lua_gettop(L) == 8);
      } else {
        enum { lc1128 = 8 };
        lc_getupvalue(L, lc1104, 23, 99);
        lua_pushvalue(L, 7);
        lua_call(L, 1, 1);
        if (lua_toboolean(L, -1)) {
          lua_pop(L, 1);
          lc_getupvalue(L, lc1104, 4, 180);
          lc_getupvalue(L, lc1104, 23, 97);
          lua_pushvalue(L, 7);
          lua_call(L, 1, 1);
          lc_getupvalue(L, lc1104, 18, 159);
          lua_call(L, 2, 1);
        }
        if (lua_toboolean(L, -1)) {
          lua_pop(L, 1);
          lc_getupvalue(L, lc1104, 4, 180);
          lua_pushnumber(L, 3);
          lua_gettable(L, 6);
          lc_getupvalue(L, lc1104, 18, 159);
          lua_call(L, 2, 1);
        }
        const int lc1129 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1129) {
          const int lc1130 = lua_gettop(L);
          lua_pushvalue(L, 4);
          lua_getglobal(L, "tostring");
          const int lc1131 = lua_gettop(L);
          lc_getupvalue(L, lc1104, 1, 213);
          lc_getupvalue(L, lc1104, 23, 98);
          lua_pushvalue(L, 7);
          lua_call(L, 1, 1);
          lua_pushboolean(L, 1);
          lua_call(L, 2, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc1131), 1);
          lua_pushliteral(L, "@");
          lua_getglobal(L, "tostring");
          const int lc1132 = lua_gettop(L);
          lc_getupvalue(L, lc1104, 1, 213);
          lua_pushnumber(L, 3);
          lua_gettable(L, 5);
          lua_pushboolean(L, 1);
          lua_call(L, 2, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc1132), 1);
          lua_concat(L, 2);
          lua_concat(L, 2);
          lua_call(L, 1, LUA_MULTRET);
          return (lua_gettop(L) - lc1130);
          assert(lua_gettop(L) == 8);
        } else {
          enum { lc1133 = 8 };
          lc_getupvalue(L, lc1104, 4, 180);
          lua_pushvalue(L, 7);
          lc_getupvalue(L, lc1104, 18, 159);
          lua_call(L, 2, 1);
          if (lua_toboolean(L, -1)) {
            lua_pop(L, 1);
            lc_getupvalue(L, lc1104, 4, 180);
            lua_pushnumber(L, 3);
            lua_gettable(L, 5);
            lc_getupvalue(L, lc1104, 19, 158);
            lua_call(L, 2, 1);
          }
          const int lc1134 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1134) {
            const int lc1135 = lua_gettop(L);
            lua_pushvalue(L, 4);
            lua_pushliteral(L, ":>");
            lua_getglobal(L, "tostring");
            const int lc1136 = lua_gettop(L);
            lc_getupvalue(L, lc1104, 1, 213);
            lua_pushnumber(L, 3);
            lua_gettable(L, 6);
            lua_pushboolean(L, 1);
            lua_call(L, 2, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc1136), 1);
            lua_concat(L, 2);
            lua_call(L, 1, LUA_MULTRET);
            return (lua_gettop(L) - lc1135);
            assert(lua_gettop(L) == 8);
          }
          lua_settop(L, lc1133);
        }
        lua_settop(L, lc1128);
      }
      lua_settop(L, lc1120);
      assert(lua_gettop(L) == 8);
    }
    lua_settop(L, lc1115);
    assert(lua_gettop(L) == 6);
    lc_getupvalue(L, lc1104, 7, 170);
    lua_pushnumber(L, 3);
    lua_gettable(L, 5);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 7);
    enum { lc1137 = 7 };
    lc_getupvalue(L, lc1104, 4, 180);
    lua_pushnumber(L, 2);
    lua_gettable(L, 5);
    lc_getupvalue(L, lc1104, 23, 62);
    lua_call(L, 2, 1);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lua_pushboolean(L, 0);
      const int lc1138 = lua_compare(L, 7, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc1138);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
    }
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lua_len(L, 7);
      lua_pushnumber(L, 2);
      const int lc1140 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc1140);
    }
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lc_getupvalue(L, lc1104, 4, 180);
      lua_pushnumber(L, 1);
      lua_gettable(L, 7);
      lc_getupvalue(L, lc1104, 16, 161);
      lua_call(L, 2, 1);
    }
    const int lc1141 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1141) {
      const int lc1142 = lua_gettop(L);
      lua_pushvalue(L, 4);
      lua_getglobal(L, "tostring");
      const int lc1143 = lua_gettop(L);
      lc_getupvalue(L, lc1104, 1, 213);
      lua_pushnumber(L, 2);
      lua_gettable(L, 7);
      lua_pushboolean(L, 1);
      lua_call(L, 2, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc1143), 1);
      lua_pushliteral(L, "?");
      lua_concat(L, 2);
      lua_call(L, 1, LUA_MULTRET);
      return (lua_gettop(L) - lc1142);
      assert(lua_gettop(L) == 7);
    }
    lua_settop(L, lc1137);
    assert(lua_gettop(L) == 7);
    enum { lc1144 = 7 };
    lua_pushboolean(L, 0);
    const int lc1145 = lua_compare(L, 6, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc1145);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lua_len(L, 6);
      lua_pushnumber(L, 2);
      const int lc1147 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc1147);
    }
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lc_getupvalue(L, lc1104, 4, 180);
      lua_pushnumber(L, 3);
      lua_gettable(L, 5);
      lc_getupvalue(L, lc1104, 19, 158);
      lua_call(L, 2, 1);
    }
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lc_getupvalue(L, lc1104, 4, 180);
      lua_pushnumber(L, 1);
      lua_gettable(L, 6);
      lc_getupvalue(L, lc1104, 23, 61);
      lua_call(L, 2, 1);
    }
    const int lc1148 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1148) {
      lc_getupvalue(L, lc1104, 7, 170);
      lua_pushnumber(L, 2);
      lua_gettable(L, 6);
      lua_call(L, 1, 1);
      assert(lua_gettop(L) == 8);
      enum { lc1149 = 8 };
      lua_pushboolean(L, 0);
      const int lc1150 = lua_compare(L, 8, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc1150);
      lua_pushboolean(L, !(lua_toboolean(L, -1)));
      lua_remove(L, -2);
      if (lua_toboolean(L, -1)) {
        lua_pop(L, 1);
        lua_len(L, 8);
        lua_pushnumber(L, 3);
        const int lc1152 = lua_compare(L, -2, -1, LUA_OPEQ);
        lua_pop(L, 2);
        lua_pushboolean(L, lc1152);
      }
      if (lua_toboolean(L, -1)) {
        lua_pop(L, 1);
        lc_getupvalue(L, lc1104, 4, 180);
        lua_pushnumber(L, 1);
        lua_gettable(L, 8);
        lc_getupvalue(L, lc1104, 23, 62);
        lua_call(L, 2, 1);
      }
      if (lua_toboolean(L, -1)) {
        lua_pop(L, 1);
        lc_getupvalue(L, lc1104, 4, 180);
        lua_pushnumber(L, 2);
        lua_gettable(L, 8);
        lc_getupvalue(L, lc1104, 18, 159);
        lua_call(L, 2, 1);
      }
      const int lc1153 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1153) {
        const int lc1154 = lua_gettop(L);
        lua_pushvalue(L, 4);
        lua_pushliteral(L, ":&>");
        lua_getglobal(L, "tostring");
        const int lc1155 = lua_gettop(L);
        lc_getupvalue(L, lc1104, 1, 213);
        lua_pushnumber(L, 3);
        lua_gettable(L, 8);
        lua_pushboolean(L, 1);
        lua_call(L, 2, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1155), 1);
        lua_concat(L, 2);
        lua_call(L, 1, LUA_MULTRET);
        return (lua_gettop(L) - lc1154);
        assert(lua_gettop(L) == 8);
      }
      lua_settop(L, lc1149);
      assert(lua_gettop(L) == 8);
    }
    lua_settop(L, lc1144);
    assert(lua_gettop(L) == 7);
    lua_settop(L, (lua_gettop(L) + 1));
    assert(lua_gettop(L) == 8);
    enum { lc1156 = 8 };
    lc_getupvalue(L, lc1104, 4, 180);
    lua_pushnumber(L, 3);
    lua_gettable(L, 5);
    lc_getupvalue(L, lc1104, 18, 159);
    lua_call(L, 2, 1);
    const int lc1157 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1157) {
      lua_pushliteral(L, "_");
      lua_replace(L, 8);
      assert(lua_gettop(L) == 8);
    } else {
      enum { lc1158 = 8 };
      lc_getupvalue(L, lc1104, 4, 180);
      lua_pushnumber(L, 3);
      lua_gettable(L, 5);
      lc_getupvalue(L, lc1104, 19, 158);
      lua_call(L, 2, 1);
      const int lc1159 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1159) {
        lua_pushliteral(L, "");
        lua_replace(L, 8);
        assert(lua_gettop(L) == 8);
      } else {
        lc_getupvalue(L, lc1104, 1, 213);
        lua_pushnumber(L, 3);
        lua_gettable(L, 5);
        lua_pushboolean(L, 1);
        lua_call(L, 2, 1);
        lua_replace(L, 8);
        assert(lua_gettop(L) == 8);
      }
      lua_settop(L, lc1158);
    }
    lua_settop(L, lc1156);
    assert(lua_gettop(L) == 8);
    const int lc1160 = lua_gettop(L);
    lua_pushvalue(L, 4);
    lua_getglobal(L, "tostring");
    lua_pushvalue(L, 8);
    lua_call(L, 1, 1);
    lua_pushliteral(L, ":");
    lua_getglobal(L, "tostring");
    const int lc1161 = lua_gettop(L);
    lc_getupvalue(L, lc1104, 1, 213);
    lua_pushnumber(L, 2);
    lua_gettable(L, 5);
    lua_pushboolean(L, 1);
    lua_call(L, 2, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc1161), 1);
    lua_concat(L, 2);
    lua_concat(L, 2);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc1160);
    assert(lua_gettop(L) == 8);
  } else {
    enum { lc1162 = 5 };
    lua_pushboolean(L, 0);
    const int lc1163 = lua_compare(L, 5, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc1163);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (lua_toboolean(L, -1)) {
      lua_pop(L, 1);
      lua_len(L, 5);
      lua_pushnumber(L, 2);
      const int lc1165 = lua_compare(L, -2, -1, LUA_OPEQ);
      lua_pop(L, 2);
      lua_pushboolean(L, lc1165);
    }
    const int lc1166 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1166) {
      enum { lc1167 = 5 };
      lc_getupvalue(L, lc1104, 4, 180);
      lua_pushnumber(L, 1);
      lua_gettable(L, 5);
      lc_getupvalue(L, lc1104, 23, 61);
      lua_call(L, 2, 1);
      const int lc1168 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1168) {
        lc_getupvalue(L, lc1104, 7, 170);
        lua_pushnumber(L, 2);
        lua_gettable(L, 5);
        lua_call(L, 1, 1);
        assert(lua_gettop(L) == 6);
        enum { lc1169 = 6 };
        lua_pushboolean(L, 0);
        const int lc1170 = lua_compare(L, 6, -1, LUA_OPEQ);
        lua_pop(L, 1);
        lua_pushboolean(L, lc1170);
        lua_pushboolean(L, !(lua_toboolean(L, -1)));
        lua_remove(L, -2);
        if (lua_toboolean(L, -1)) {
          lua_pop(L, 1);
          lua_len(L, 6);
          lua_pushnumber(L, 2);
          const int lc1172 = lua_compare(L, -2, -1, LUA_OPEQ);
          lua_pop(L, 2);
          lua_pushboolean(L, lc1172);
        }
        if (lua_toboolean(L, -1)) {
          lua_pop(L, 1);
          lc_getupvalue(L, lc1104, 4, 180);
          lua_pushnumber(L, 1);
          lua_gettable(L, 6);
          lc_getupvalue(L, lc1104, 23, 64);
          lua_call(L, 2, 1);
        }
        const int lc1173 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1173) {
          const int lc1174 = lua_gettop(L);
          lua_pushvalue(L, 4);
          lua_pushliteral(L, "&+");
          lua_getglobal(L, "tostring");
          const int lc1175 = lua_gettop(L);
          lc_getupvalue(L, lc1104, 1, 213);
          lua_pushnumber(L, 2);
          lua_gettable(L, 6);
          lua_pushboolean(L, 1);
          lua_call(L, 2, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc1175), 1);
          lua_concat(L, 2);
          lua_call(L, 1, LUA_MULTRET);
          return (lua_gettop(L) - lc1174);
          assert(lua_gettop(L) == 6);
        }
        lua_settop(L, lc1169);
        assert(lua_gettop(L) == 6);
        const int lc1176 = lua_gettop(L);
        lua_pushvalue(L, 4);
        lua_pushliteral(L, "&");
        lua_getglobal(L, "tostring");
        const int lc1177 = lua_gettop(L);
        lc_getupvalue(L, lc1104, 1, 213);
        lua_pushnumber(L, 2);
        lua_gettable(L, 5);
        lua_pushboolean(L, 1);
        lua_call(L, 2, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1177), 1);
        lua_concat(L, 2);
        lua_call(L, 1, LUA_MULTRET);
        return (lua_gettop(L) - lc1176);
        assert(lua_gettop(L) == 6);
      } else {
        enum { lc1178 = 5 };
        lc_getupvalue(L, lc1104, 4, 180);
        lua_pushnumber(L, 1);
        lua_gettable(L, 5);
        lc_getupvalue(L, lc1104, 16, 161);
        lua_call(L, 2, 1);
        const int lc1179 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1179) {
          const int lc1180 = lua_gettop(L);
          lua_pushvalue(L, 4);
          lua_getglobal(L, "tostring");
          const int lc1181 = lua_gettop(L);
          lc_getupvalue(L, lc1104, 1, 213);
          lua_pushnumber(L, 2);
          lua_gettable(L, 5);
          lua_pushboolean(L, 1);
          lua_call(L, 2, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc1181), 1);
          lua_pushliteral(L, "~");
          lua_concat(L, 2);
          lua_call(L, 1, LUA_MULTRET);
          return (lua_gettop(L) - lc1180);
          assert(lua_gettop(L) == 5);
        } else {
          enum { lc1182 = 5 };
          lc_getupvalue(L, lc1104, 4, 180);
          lua_pushnumber(L, 1);
          lua_gettable(L, 5);
          lc_getupvalue(L, lc1104, 23, 64);
          lua_call(L, 2, 1);
          const int lc1183 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1183) {
            const int lc1184 = lua_gettop(L);
            lua_pushvalue(L, 4);
            lua_pushliteral(L, "+");
            lua_getglobal(L, "tostring");
            const int lc1185 = lua_gettop(L);
            lc_getupvalue(L, lc1104, 1, 213);
            lua_pushnumber(L, 2);
            lua_gettable(L, 5);
            lua_pushboolean(L, 1);
            lua_call(L, 2, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc1185), 1);
            lua_concat(L, 2);
            lua_call(L, 1, LUA_MULTRET);
            return (lua_gettop(L) - lc1184);
            assert(lua_gettop(L) == 5);
          } else {
            enum { lc1186 = 5 };
            lc_getupvalue(L, lc1104, 4, 180);
            lua_pushnumber(L, 1);
            lua_gettable(L, 5);
            lc_getupvalue(L, lc1104, 15, 162);
            lua_call(L, 2, 1);
            const int lc1187 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc1187) {
              lc_getupvalue(L, lc1104, 7, 170);
              lua_pushnumber(L, 2);
              lua_gettable(L, 5);
              lua_call(L, 1, 1);
              assert(lua_gettop(L) == 6);
              enum { lc1188 = 6 };
              lua_pushboolean(L, 0);
              const int lc1189 = lua_compare(L, 6, -1, LUA_OPEQ);
              lua_pop(L, 1);
              lua_pushboolean(L, lc1189);
              lua_pushboolean(L, !(lua_toboolean(L, -1)));
              lua_remove(L, -2);
              if (lua_toboolean(L, -1)) {
                lua_pop(L, 1);
                lua_pushnumber(L, 1);
                lua_len(L, 6);
                const int lc1191 = lua_compare(L, -2, -1, LUA_OPLT);
                lua_pop(L, 2);
                lua_pushboolean(L, lc1191);
              }
              const int lc1192 = lua_toboolean(L, -1);
              lua_pop(L, 1);
              if (lc1192) {
                lc_getupvalue(L, lc1104, 1, 213);
                lua_pushnumber(L, 1);
                lua_gettable(L, 6);
                lua_pushboolean(L, 1);
                lua_call(L, 2, 1);
                assert(lua_gettop(L) == 7);
                lua_pushnumber(L, 1);
                assert(lua_gettop(L) == 8);
                enum { lc1193 = 8 };
                while (1) {
                  lua_len(L, 6);
                  const int lc1195 = lua_compare(L, 8, -1, LUA_OPLT);
                  lua_pop(L, 1);
                  lua_pushboolean(L, lc1195);
                  if (!(lua_toboolean(L, -1))) {
                    break;
                  }
                  lua_pop(L, 1);
                  lua_getglobal(L, "tostring");
                  lua_pushvalue(L, 7);
                  lua_call(L, 1, 1);
                  lua_pushliteral(L, "/");
                  lua_getglobal(L, "tostring");
                  const int lc1196 = lua_gettop(L);
                  lc_getupvalue(L, lc1104, 1, 213);
                  lua_pushnumber(L, 1);
                  lc_add(L, 8, -1);
                  lua_remove(L, -2);
                  lua_gettable(L, 6);
                  lua_pushboolean(L, 1);
                  lua_call(L, 2, LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1196), 1);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_replace(L, 7);
                  assert(lua_gettop(L) == 8);
                  lua_pushnumber(L, 1);
                  lc_add(L, 8, -1);
                  lua_remove(L, -2);
                  lua_replace(L, 8);
                  assert(lua_gettop(L) == 8);
                }
                lua_settop(L, lc1193);
                assert(lua_gettop(L) == 8);
                lua_pop(L, 1);
                assert(lua_gettop(L) == 7);
                const int lc1197 = lua_gettop(L);
                lua_pushvalue(L, 4);
                lua_pushvalue(L, 7);
                lua_call(L, 1, LUA_MULTRET);
                return (lua_gettop(L) - lc1197);
                assert(lua_gettop(L) == 7);
              }
              lua_settop(L, lc1188);
              assert(lua_gettop(L) == 6);
            }
            lua_settop(L, lc1186);
          }
          lua_settop(L, lc1182);
        }
        lua_settop(L, lc1178);
      }
      lua_settop(L, lc1167);
      assert(lua_gettop(L) == 5);
    }
    lua_settop(L, lc1162);
  }
  lua_settop(L, lc1110);
  assert(lua_gettop(L) == 5);
  enum { lc1198 = 5 };
  lc_getupvalue(L, lc1104, 0, 214);
  const int lc1199 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1199) {
    const int lc1200 = lua_gettop(L);
    lc_getupvalue(L, lc1104, 23, 3);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc1200);
    assert(lua_gettop(L) == 5);
  } else {
    const int lc1201 = lua_gettop(L);
    lc_getupvalue(L, lc1104, 23, 3);
    const int lc1202 = lua_gettop(L);
    lc_getupvalue(L, lc1104, 12, 165);
    lua_pushvalue(L, 1);
    lua_call(L, 1, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc1202), LUA_MULTRET);
    return (lua_gettop(L) - lc1201);
    assert(lua_gettop(L) == 5);
  }
  lua_settop(L, lc1198);
  assert(lua_gettop(L) == 5);
  return 0;
}
static int lcf1_complex_print(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1103 = 2 };
  assert((lua_gettop(L) == lc1103));
  lua_pushvalue(L, lc1103);
  lua_pushcclosure(L, lcf1_print_sys_name, 1);
  lua_rawseti(L, lc1103, 213);
  assert(lua_gettop(L) == 2);
  lc_getupvalue(L, lc1103, 2, 181);
  const int lc1203 = lua_gettop(L);
  lc_getupvalue(L, lc1103, 22, 3);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1203), 1);
  assert(lua_gettop(L) == 3);
  lua_pushliteral(L, "");
  assert(lua_gettop(L) == 4);
  lua_pushliteral(L, "");
  assert(lua_gettop(L) == 5);
  enum { lc1204 = 5 };
  lc_getupvalue(L, lc1103, 22, 95);
  lua_pushvalue(L, 3);
  lua_call(L, 1, 1);
  const int lc1205 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1205) {
    lua_pushliteral(L, "()");
    return 1;
    assert(lua_gettop(L) == 5);
  } else {
    enum { lc1206 = 5 };
    lc_getupvalue(L, lc1103, 22, 99);
    lua_pushvalue(L, 3);
    lua_call(L, 1, 1);
    const int lc1207 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1207) {
      lua_pushliteral(L, "(");
      lua_replace(L, 4);
      assert(lua_gettop(L) == 5);
      lua_pushliteral(L, "");
      lua_replace(L, 5);
      assert(lua_gettop(L) == 5);
      enum { lc1208 = 5 };
      while (1) {
        lc_getupvalue(L, lc1103, 22, 99);
        lua_pushvalue(L, 3);
        lua_call(L, 1, 1);
        if (!(lua_toboolean(L, -1))) {
          break;
        }
        lua_pop(L, 1);
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 4);
        lua_call(L, 1, 1);
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 5);
        lua_call(L, 1, 1);
        lua_getglobal(L, "tostring");
        const int lc1209 = lua_gettop(L);
        lc_getupvalue(L, lc1103, 1, 212);
        const int lc1210 = lua_gettop(L);
        lc_getupvalue(L, lc1103, 22, 98);
        lua_pushvalue(L, 3);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1210), LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1209), 1);
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_replace(L, 4);
        assert(lua_gettop(L) == 5);
        lua_pushliteral(L, " ");
        lua_replace(L, 5);
        assert(lua_gettop(L) == 5);
        lc_getupvalue(L, lc1103, 22, 97);
        lua_pushvalue(L, 3);
        lua_call(L, 1, 1);
        lua_replace(L, 3);
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc1208);
      assert(lua_gettop(L) == 5);
      enum { lc1211 = 5 };
      lc_getupvalue(L, lc1103, 22, 95);
      lua_pushvalue(L, 3);
      lua_call(L, 1, 1);
      const int lc1212 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1212) {
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 4);
        lua_call(L, 1, 1);
        lua_pushliteral(L, ")");
        lua_concat(L, 2);
        lua_replace(L, 4);
        assert(lua_gettop(L) == 5);
      } else {
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 4);
        lua_call(L, 1, 1);
        lua_pushliteral(L, " . ");
        lua_getglobal(L, "tostring");
        const int lc1213 = lua_gettop(L);
        lc_getupvalue(L, lc1103, 1, 212);
        lua_pushvalue(L, 3);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1213), 1);
        lua_pushliteral(L, ")");
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_replace(L, 4);
        assert(lua_gettop(L) == 5);
      }
      lua_settop(L, lc1211);
      assert(lua_gettop(L) == 5);
      lua_pushvalue(L, 4);
      return 1;
      assert(lua_gettop(L) == 5);
    } else {
      enum { lc1214 = 5 };
      lc_getupvalue(L, lc1103, 22, 93);
      lua_pushvalue(L, 3);
      lua_call(L, 1, 1);
      const int lc1215 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1215) {
        lc_getupvalue(L, lc1103, 22, 92);
        lua_pushvalue(L, 3);
        lua_call(L, 1, 1);
        assert(lua_gettop(L) == 6);
        lc_getupvalue(L, lc1103, 22, 91);
        lua_pushvalue(L, 3);
        lua_call(L, 1, 1);
        assert(lua_gettop(L) == 7);
        lc_getupvalue(L, lc1103, 6, 170);
        lua_pushvalue(L, 7);
        lua_call(L, 1, 1);
        assert(lua_gettop(L) == 8);
        enum { lc1216 = 8 };
        lua_pushboolean(L, 0);
        const int lc1217 = lua_compare(L, 8, -1, LUA_OPEQ);
        lua_pop(L, 1);
        lua_pushboolean(L, lc1217);
        lua_pushboolean(L, !(lua_toboolean(L, -1)));
        lua_remove(L, -2);
        if (lua_toboolean(L, -1)) {
          lua_pop(L, 1);
          lua_len(L, 8);
          lua_pushnumber(L, 2);
          const int lc1219 = lua_compare(L, -2, -1, LUA_OPEQ);
          lua_pop(L, 2);
          lua_pushboolean(L, lc1219);
        }
        if (lua_toboolean(L, -1)) {
          lua_pop(L, 1);
          lc_getupvalue(L, lc1103, 3, 180);
          lua_pushvalue(L, 6);
          lc_getupvalue(L, lc1103, 22, 63);
          lua_call(L, 2, 1);
        }
        if (lua_toboolean(L, -1)) {
          lua_pop(L, 1);
          lc_getupvalue(L, lc1103, 3, 180);
          lua_pushnumber(L, 1);
          lua_gettable(L, 8);
          lc_getupvalue(L, lc1103, 22, 64);
          lua_call(L, 2, 1);
        }
        const int lc1220 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1220) {
          const int lc1221 = lua_gettop(L);
          lc_getupvalue(L, lc1103, 0, 213);
          lua_pushnumber(L, 2);
          lua_gettable(L, 8);
          lua_pushboolean(L, 0);
          lua_call(L, 2, LUA_MULTRET);
          return (lua_gettop(L) - lc1221);
          assert(lua_gettop(L) == 8);
        }
        lua_settop(L, lc1216);
        assert(lua_gettop(L) == 8);
        lua_pushliteral(L, "#");
        lua_getglobal(L, "tostring");
        const int lc1222 = lua_gettop(L);
        lc_getupvalue(L, lc1103, 1, 212);
        const int lc1223 = lua_gettop(L);
        lc_getupvalue(L, lc1103, 22, 100);
        lua_pushvalue(L, 6);
        lua_pushvalue(L, 7);
        lua_call(L, 2, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1223), LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1222), 1);
        lua_concat(L, 2);
        return 1;
        assert(lua_gettop(L) == 8);
      } else {
        enum { lc1224 = 5 };
        lc_getupvalue(L, lc1103, 22, 103);
        lua_pushvalue(L, 3);
        lua_call(L, 1, 1);
        const int lc1225 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1225) {
          const int lc1226 = lua_gettop(L);
          lc_getupvalue(L, lc1103, 22, 102);
          lua_pushvalue(L, 3);
          lua_call(L, 1, LUA_MULTRET);
          return (lua_gettop(L) - lc1226);
          assert(lua_gettop(L) == 5);
        } else {
          enum { lc1227 = 5 };
          lc_getupvalue(L, lc1103, 22, 107);
          lua_pushvalue(L, 3);
          lua_call(L, 1, 1);
          const int lc1228 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1228) {
            lua_pushliteral(L, ";(");
            lua_getglobal(L, "tostring");
            const int lc1229 = lua_gettop(L);
            lc_getupvalue(L, lc1103, 1, 212);
            const int lc1230 = lua_gettop(L);
            lc_getupvalue(L, lc1103, 22, 106);
            lua_pushvalue(L, 3);
            lua_call(L, 1, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc1230), LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc1229), 1);
            lua_pushliteral(L, " ");
            lua_getglobal(L, "tostring");
            const int lc1231 = lua_gettop(L);
            lc_getupvalue(L, lc1103, 1, 212);
            const int lc1232 = lua_gettop(L);
            lc_getupvalue(L, lc1103, 22, 105);
            lua_pushvalue(L, 3);
            lua_call(L, 1, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc1232), LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc1231), 1);
            lua_pushliteral(L, ")");
            lua_concat(L, 2);
            lua_concat(L, 2);
            lua_concat(L, 2);
            lua_concat(L, 2);
            return 1;
            assert(lua_gettop(L) == 5);
          } else {
            enum { lc1233 = 5 };
            lc_getupvalue(L, lc1103, 22, 87);
            lua_pushvalue(L, 3);
            lua_call(L, 1, 1);
            const int lc1234 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc1234) {
              lua_pushliteral(L, "$(");
              lua_getglobal(L, "tostring");
              const int lc1235 = lua_gettop(L);
              lc_getupvalue(L, lc1103, 1, 212);
              const int lc1236 = lua_gettop(L);
              lc_getupvalue(L, lc1103, 22, 14);
              const int lc1237 = lua_gettop(L);
              lc_getupvalue(L, lc1103, 22, 86);
              lua_pushvalue(L, 3);
              lua_call(L, 1, LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc1237), LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc1236), LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc1235), 1);
              lua_pushliteral(L, " ");
              lua_getglobal(L, "tostring");
              const int lc1238 = lua_gettop(L);
              lc_getupvalue(L, lc1103, 1, 212);
              const int lc1239 = lua_gettop(L);
              lc_getupvalue(L, lc1103, 22, 85);
              lua_pushvalue(L, 3);
              lua_call(L, 1, LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc1239), LUA_MULTRET);
              lua_call(L, (lua_gettop(L) - lc1238), 1);
              lua_pushliteral(L, ")");
              lua_concat(L, 2);
              lua_concat(L, 2);
              lua_concat(L, 2);
              lua_concat(L, 2);
              return 1;
              assert(lua_gettop(L) == 5);
            } else {
              enum { lc1240 = 5 };
              lc_getupvalue(L, lc1103, 22, 78);
              lua_pushvalue(L, 3);
              lua_call(L, 1, 1);
              const int lc1241 = lua_toboolean(L, -1);
              lua_pop(L, 1);
              if (lc1241) {
                lua_pushliteral(L, "%(");
                lua_getglobal(L, "tostring");
                const int lc1242 = lua_gettop(L);
                lc_getupvalue(L, lc1103, 1, 212);
                const int lc1243 = lua_gettop(L);
                lc_getupvalue(L, lc1103, 22, 77);
                lua_pushvalue(L, 3);
                lua_call(L, 1, LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc1243), LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc1242), 1);
                lua_pushliteral(L, " ");
                lua_getglobal(L, "tostring");
                const int lc1244 = lua_gettop(L);
                lc_getupvalue(L, lc1103, 1, 212);
                const int lc1245 = lua_gettop(L);
                lc_getupvalue(L, lc1103, 22, 38);
                const int lc1246 = lua_gettop(L);
                lc_getupvalue(L, lc1103, 22, 76);
                lua_pushvalue(L, 3);
                lua_call(L, 1, LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc1246), LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc1245), LUA_MULTRET);
                lua_call(L, (lua_gettop(L) - lc1244), 1);
                lua_pushliteral(L, ")");
                lua_concat(L, 2);
                lua_concat(L, 2);
                lua_concat(L, 2);
                lua_concat(L, 2);
                return 1;
                assert(lua_gettop(L) == 5);
              } else {
                enum { lc1247 = 5 };
                lc_getupvalue(L, lc1103, 22, 83);
                lua_pushvalue(L, 3);
                lua_call(L, 1, 1);
                const int lc1248 = lua_toboolean(L, -1);
                lua_pop(L, 1);
                if (lc1248) {
                  lua_pushliteral(L, "@(");
                  lua_getglobal(L, "tostring");
                  const int lc1249 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 1, 212);
                  const int lc1250 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 22, 14);
                  const int lc1251 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 22, 82);
                  lua_pushvalue(L, 3);
                  lua_call(L, 1, LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1251), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1250), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1249), 1);
                  lua_pushliteral(L, " ");
                  lua_getglobal(L, "tostring");
                  const int lc1252 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 1, 212);
                  const int lc1253 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 22, 81);
                  lua_pushvalue(L, 3);
                  lua_call(L, 1, LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1253), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1252), 1);
                  lua_pushliteral(L, " ");
                  lua_getglobal(L, "tostring");
                  const int lc1254 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 1, 212);
                  const int lc1255 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 22, 38);
                  const int lc1256 = lua_gettop(L);
                  lc_getupvalue(L, lc1103, 22, 80);
                  lua_pushvalue(L, 3);
                  lua_call(L, 1, LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1256), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1255), LUA_MULTRET);
                  lua_call(L, (lua_gettop(L) - lc1254), 1);
                  lua_pushliteral(L, ")");
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  lua_concat(L, 2);
                  return 1;
                  assert(lua_gettop(L) == 5);
                } else {
                  enum { lc1257 = 5 };
                  lc_getupvalue(L, lc1103, 22, 74);
                  lua_pushvalue(L, 3);
                  lua_call(L, 1, 1);
                  const int lc1258 = lua_toboolean(L, -1);
                  lua_pop(L, 1);
                  if (lc1258) {
                    lua_pushliteral(L, "^(");
                    lua_getglobal(L, "tostring");
                    const int lc1259 = lua_gettop(L);
                    lc_getupvalue(L, lc1103, 1, 212);
                    const int lc1260 = lua_gettop(L);
                    lc_getupvalue(L, lc1103, 22, 73);
                    lua_pushvalue(L, 3);
                    lua_call(L, 1, LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc1260), LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc1259), 1);
                    lua_pushliteral(L, " ");
                    lua_getglobal(L, "tostring");
                    const int lc1261 = lua_gettop(L);
                    lc_getupvalue(L, lc1103, 1, 212);
                    const int lc1262 = lua_gettop(L);
                    lc_getupvalue(L, lc1103, 22, 38);
                    const int lc1263 = lua_gettop(L);
                    lc_getupvalue(L, lc1103, 22, 72);
                    lua_pushvalue(L, 3);
                    lua_call(L, 1, LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc1263), LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc1262), LUA_MULTRET);
                    lua_call(L, (lua_gettop(L) - lc1261), 1);
                    lua_pushliteral(L, ")");
                    lua_concat(L, 2);
                    lua_concat(L, 2);
                    lua_concat(L, 2);
                    lua_concat(L, 2);
                    return 1;
                    assert(lua_gettop(L) == 5);
                  }
                  lua_settop(L, lc1257);
                }
                lua_settop(L, lc1247);
              }
              lua_settop(L, lc1240);
            }
            lua_settop(L, lc1233);
          }
          lua_settop(L, lc1227);
        }
        lua_settop(L, lc1224);
      }
      lua_settop(L, lc1214);
    }
    lua_settop(L, lc1206);
  }
  lua_settop(L, lc1204);
  assert(lua_gettop(L) == 5);
  const int lc1264 = lua_gettop(L);
  lc_getupvalue(L, lc1103, 22, 125);
  lua_call(L, 0, LUA_MULTRET);
  return (lua_gettop(L) - lc1264);
  assert(lua_gettop(L) == 5);
}
static int lcf1_is_eof(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 218);
  lua_pushnumber(L, 0);
  const int lc1267 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc1267);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf1_is_not_eof(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 217);
  lua_call(L, 0, 1);
  lua_pushboolean(L, !(lua_toboolean(L, -1)));
  lua_remove(L, -2);
  return 1;
  assert(lua_gettop(L) == 0);
}
static int lcf2_parse_error(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc1270 = 1 };
  lua_pushnil(L);
  const int lc1271 = lua_compare(L, 1, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1271);
  const int lc1272 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1272) {
    lua_pushliteral(L, "");
    lua_replace(L, 1);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc1270);
  assert(lua_gettop(L) == 1);
  lua_getglobal(L, "error");
  lua_pushliteral(L, "MT parse ERROR ");
  lua_getglobal(L, "tostring");
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_concat(L, 2);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_parse_assert(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  enum { lc1274 = 1 };
  lua_pushboolean(L, !(lua_toboolean(L, 1)));
  const int lc1275 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1275) {
    const int lc1276 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 1, 219);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1276);
    assert(lua_gettop(L) == 1);
  }
  lua_settop(L, lc1274);
  assert(lua_gettop(L) == 1);
  return 0;
}
static int lcf1_get_do(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 220);
  const int lc1277 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 216);
  lua_call(L, 0, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1277), 0);
  assert(lua_gettop(L) == 0);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 218);
  lua_pushnumber(L, 1);
  lc_sub(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lc_setupvalue(L, lua_upvalueindex(1), 2, 218);
  assert(lua_gettop(L) == 0);
  const int lc1278 = lua_gettop(L);
  lua_getglobal(L, "string");
  lua_pushliteral(L, "sub");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 215);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 218);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 218);
  lua_pushnumber(L, 1);
  lc_add(L, -2, -1);
  lua_remove(L, -2);
  lua_remove(L, -2);
  lua_call(L, 3, LUA_MULTRET);
  return (lua_gettop(L) - lc1278);
  assert(lua_gettop(L) == 0);
}
static int lcf3_conslike(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_getglobal(L, "table");
  lua_pushliteral(L, "remove");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 221);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 2);
  lua_getglobal(L, "table");
  lua_pushliteral(L, "remove");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 221);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 3);
  enum { lc1280 = 3 };
  lua_pushvalue(L, 3);
  lua_pushnil(L);
  const int lc1281 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc1281);
  if (!(lua_toboolean(L, -1))) {
    lua_pop(L, 1);
    lua_pushvalue(L, 2);
    lua_pushnil(L);
    const int lc1282 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc1282);
  }
  const int lc1283 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1283) {
    const int lc1284 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 2, 219);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1284);
    assert(lua_gettop(L) == 3);
  } else {
    const int lc1285 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 27, 2);
    const int lc1286 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 0, 221);
    lua_pushvalue(L, 1);
    lua_pushvalue(L, 3);
    lua_pushvalue(L, 2);
    lua_call(L, 2, LUA_MULTRET);
    lua_call(L, (lua_gettop(L) - lc1286), LUA_MULTRET);
    return (lua_gettop(L) - lc1285);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc1280);
  assert(lua_gettop(L) == 3);
  return 0;
}
static int lcf1310(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_getupvalue(L, lua_upvalueindex(1), 8, 172);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  assert(lua_gettop(L) == 3);
  enum { lc1305 = 3 };
  lua_pushboolean(L, 0);
  const int lc1306 = lua_compare(L, 3, -1, LUA_OPEQ);
  lua_pop(L, 1);
  lua_pushboolean(L, lc1306);
  const int lc1307 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1307) {
    const int lc1308 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 2, 219);
    lua_call(L, 0, LUA_MULTRET);
    return (lua_gettop(L) - lc1308);
    assert(lua_gettop(L) == 3);
  } else {
    const int lc1309 = lua_gettop(L);
    lc_getupvalue(L, lua_upvalueindex(1), 26, 88);
    lua_pushvalue(L, 3);
    lua_pushvalue(L, 2);
    lua_call(L, 2, LUA_MULTRET);
    return (lua_gettop(L) - lc1309);
    assert(lua_gettop(L) == 3);
  }
  lua_settop(L, lc1305);
  assert(lua_gettop(L) == 3);
  return 0;
}
static int lcf1_machinetext_parse(lua_State *L) {
  lua_checkstack(L, 21);
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1265 = 2 };
  assert((lua_gettop(L) == lc1265));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 215);
  lc_newclosuretable(L, lc1265);
  enum { lc1266 = 3 };
  assert((lua_gettop(L) == lc1266));
  lua_settop(L, (lua_gettop(L) + 3));
  lua_rawseti(L, lc1266, 216);
  lua_rawseti(L, lc1266, 217);
  lua_rawseti(L, lc1266, 218);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, lc1266);
  lua_pushcclosure(L, lcf1_is_eof, 1);
  lc_setupvalue(L, lc1266, 0, 217);
  assert(lua_gettop(L) == 3);
  lua_pushvalue(L, lc1266);
  lua_pushcclosure(L, lcf1_is_not_eof, 1);
  lc_setupvalue(L, lc1266, 0, 216);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lc1266, 1, 215);
  lua_len(L, -1);
  lua_pop(L, 1);
  lc_setupvalue(L, lc1266, 0, 218);
  assert(lua_gettop(L) == 3);
  lc_newclosuretable(L, lc1266);
  enum { lc1269 = 4 };
  assert((lua_gettop(L) == lc1269));
  lua_pushcfunction(L, lcf2_parse_error);
  lua_rawseti(L, lc1269, 219);
  assert(lua_gettop(L) == 4);
  lc_newclosuretable(L, lc1269);
  enum { lc1273 = 5 };
  assert((lua_gettop(L) == lc1273));
  lua_pushvalue(L, lc1273);
  lua_pushcclosure(L, lcf1_parse_assert, 1);
  lua_rawseti(L, lc1273, 220);
  assert(lua_gettop(L) == 5);
  lua_pushvalue(L, lc1273);
  lua_pushcclosure(L, lcf1_get_do, 1);
  assert(lua_gettop(L) == 6);
  lc_newclosuretable(L, lc1273);
  enum { lc1279 = 7 };
  assert((lua_gettop(L) == lc1279));
  lua_newtable(L);
  lua_rawseti(L, lc1279, 221);
  assert(lua_gettop(L) == 7);
  lua_pushvalue(L, lc1279);
  lua_pushcclosure(L, lcf3_conslike, 1);
  assert(lua_gettop(L) == 8);
  enum { lc1287 = 8 };
  while (1) {
    lc_getupvalue(L, lc1279, 3, 216);
    lua_call(L, 0, 1);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lua_pushvalue(L, 6);
    lua_call(L, 0, 1);
    assert(lua_gettop(L) == 9);
    enum { lc1288 = 9 };
    lua_pushliteral(L, "^");
    const int lc1289 = lua_compare(L, 9, -1, LUA_OPEQ);
    lua_pop(L, 1);
    lua_pushboolean(L, lc1289);
    const int lc1290 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1290) {
      lua_pushliteral(L, "");
      assert(lua_gettop(L) == 10);
      enum { lc1291 = 10 };
      while (1) {
        lua_pushboolean(L, 1);
        if (!(lua_toboolean(L, -1))) {
          break;
        }
        lua_pop(L, 1);
        lua_pushvalue(L, 6);
        lua_call(L, 0, 1);
        assert(lua_gettop(L) == 11);
        enum { lc1292 = 11 };
        lua_pushliteral(L, "^");
        const int lc1293 = lua_compare(L, 11, -1, LUA_OPEQ);
        lua_pop(L, 1);
        lua_pushboolean(L, lc1293);
        const int lc1294 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1294) {
          break;
          assert(lua_gettop(L) == 11);
        }
        lua_settop(L, lc1292);
        assert(lua_gettop(L) == 11);
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 11);
        lua_call(L, 1, 1);
        lua_getglobal(L, "tostring");
        lua_pushvalue(L, 10);
        lua_call(L, 1, 1);
        lua_concat(L, 2);
        lua_replace(L, 10);
        assert(lua_gettop(L) == 11);
        lua_pop(L, 1);
      }
      lua_settop(L, lc1291);
      assert(lua_gettop(L) == 10);
      lc_getupvalue(L, lc1279, 27, 2);
      const int lc1295 = lua_gettop(L);
      lc_getupvalue(L, lc1279, 0, 221);
      lc_getupvalue(L, lc1279, 24, 156);
      lua_pushvalue(L, 10);
      lua_call(L, 1, LUA_MULTRET);
      lua_call(L, (lua_gettop(L) - lc1295), 0);
      assert(lua_gettop(L) == 10);
    } else {
      enum { lc1296 = 9 };
      lua_pushliteral(L, ".");
      const int lc1297 = lua_compare(L, 9, -1, LUA_OPEQ);
      lua_pop(L, 1);
      lua_pushboolean(L, lc1297);
      const int lc1298 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1298) {
        lua_pushvalue(L, 8);
        lc_getupvalue(L, lc1279, 26, 100);
        lua_call(L, 1, 0);
        assert(lua_gettop(L) == 9);
      } else {
        enum { lc1299 = 9 };
        lua_pushliteral(L, "#");
        const int lc1300 = lua_compare(L, 9, -1, LUA_OPEQ);
        lua_pop(L, 1);
        lua_pushboolean(L, lc1300);
        const int lc1301 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1301) {
          lua_pushvalue(L, 8);
          lc_getupvalue(L, lc1279, 26, 94);
          lua_call(L, 1, 0);
          assert(lua_gettop(L) == 9);
        } else {
          enum { lc1302 = 9 };
          lua_pushliteral(L, "$");
          const int lc1303 = lua_compare(L, 9, -1, LUA_OPEQ);
          lua_pop(L, 1);
          lua_pushboolean(L, lc1303);
          const int lc1304 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1304) {
            lua_pushvalue(L, 8);
            lua_pushvalue(L, lc1279);
            lua_pushcclosure(L, lcf1310, 1);
            lua_call(L, 1, 0);
            assert(lua_gettop(L) == 9);
          } else {
            enum { lc1311 = 9 };
            lua_pushliteral(L, "_");
            const int lc1312 = lua_compare(L, 9, -1, LUA_OPEQ);
            lua_pop(L, 1);
            lua_pushboolean(L, lc1312);
            const int lc1313 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc1313) {
              lc_getupvalue(L, lc1279, 27, 2);
              lc_getupvalue(L, lc1279, 0, 221);
              lc_getupvalue(L, lc1279, 26, 96);
              lua_call(L, 2, 0);
              assert(lua_gettop(L) == 9);
            } else {
              const int lc1314 = lua_gettop(L);
              lc_getupvalue(L, lc1279, 2, 219);
              lua_call(L, 0, LUA_MULTRET);
              return (lua_gettop(L) - lc1314);
              assert(lua_gettop(L) == 9);
            }
            lua_settop(L, lc1311);
          }
          lua_settop(L, lc1302);
        }
        lua_settop(L, lc1299);
      }
      lua_settop(L, lc1296);
    }
    lua_settop(L, lc1288);
    assert(lua_gettop(L) == 9);
    lua_pop(L, 1);
  }
  lua_settop(L, lc1287);
  assert(lua_gettop(L) == 8);
  lc_getupvalue(L, lc1279, 1, 220);
  const int lc1315 = lua_gettop(L);
  lc_getupvalue(L, lc1279, 3, 217);
  lua_call(L, 0, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1315), 0);
  assert(lua_gettop(L) == 8);
  lc_getupvalue(L, lc1279, 1, 220);
  lc_getupvalue(L, lc1279, 0, 221);
  lua_len(L, -1);
  lua_pop(L, 1);
  lua_pushnumber(L, 1);
  const int lc1317 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc1317);
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 8);
  lc_getupvalue(L, lc1279, 0, 221);
  lua_pushnumber(L, 1);
  lua_gettable(L, -2);
  lua_remove(L, -2);
  return 1;
  assert(lua_gettop(L) == 8);
}
static int lcf4_conslike(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lua_getglobal(L, "tostring");
  lc_getupvalue(L, lua_upvalueindex(1), 1, 222);
  lua_call(L, 1, 1);
  lua_getglobal(L, "tostring");
  lua_pushvalue(L, 2);
  lua_call(L, 1, 1);
  lua_concat(L, 2);
  lc_setupvalue(L, lua_upvalueindex(1), 1, 222);
  assert(lua_gettop(L) == 4);
  const int lc1324 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 25, 1);
  const int lc1325 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 223);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 1);
  lua_call(L, 1, 1);
  lua_pushvalue(L, 4);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1325), LUA_MULTRET);
  return (lua_gettop(L) - lc1324);
  assert(lua_gettop(L) == 4);
}
static int lcf1339(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc1337 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 23, 14);
  const int lc1338 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 23, 86);
  lua_pushvalue(L, 1);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1338), LUA_MULTRET);
  return (lua_gettop(L) - lc1337);
  assert(lua_gettop(L) == 1);
}
static int lcf1_machinetext_print(lua_State *L) {
  lua_checkstack(L, 21);
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  lua_createtable(L, 1, 0);
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 1);
  assert(lua_gettop(L) == 2);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1318 = 3 };
  assert((lua_gettop(L) == lc1318));
  lua_pushliteral(L, "");
  lua_rawseti(L, lc1318, 222);
  assert(lua_gettop(L) == 3);
  enum { lc1319 = 3 };
  while (1) {
    lua_len(L, 2);
    lua_pushnumber(L, 0);
    const int lc1321 = lua_compare(L, -2, -1, LUA_OPEQ);
    lua_pop(L, 2);
    lua_pushboolean(L, lc1321);
    lua_pushboolean(L, !(lua_toboolean(L, -1)));
    lua_remove(L, -2);
    if (!(lua_toboolean(L, -1))) {
      break;
    }
    lua_pop(L, 1);
    lc_newclosuretable(L, lc1318);
    enum { lc1322 = 4 };
    assert((lua_gettop(L) == lc1322));
    lua_newtable(L);
    lua_rawseti(L, lc1322, 223);
    assert(lua_gettop(L) == 4);
    enum { lc1323 = 4 };
    lua_getglobal(L, "ipairs");
    lua_pushvalue(L, 2);
    lua_call(L, 1, 3);
    while (1) {
      lua_pushvalue(L, -3);
      lua_pushvalue(L, -3);
      lua_pushvalue(L, -3);
      lua_call(L, 2, 2);
      if (lua_isnil(L, -2)) {
        break;
      }
      lua_pushvalue(L, -2);
      lua_replace(L, -4);
      lc_getupvalue(L, lc1322, 23, 36);
      lua_pushvalue(L, 9);
      lua_call(L, 1, 1);
      lua_replace(L, 9);
      assert(lua_gettop(L) == 9);
      lua_pushvalue(L, lc1322);
      lua_pushcclosure(L, lcf4_conslike, 1);
      assert(lua_gettop(L) == 10);
      enum { lc1326 = 10 };
      lc_getupvalue(L, lc1322, 23, 103);
      lua_pushvalue(L, 9);
      lua_call(L, 1, 1);
      const int lc1327 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1327) {
        lua_getglobal(L, "tostring");
        lc_getupvalue(L, lc1322, 1, 222);
        lua_call(L, 1, 1);
        lua_getglobal(L, "tostring");
        lua_pushliteral(L, "^");
        lua_getglobal(L, "tostring");
        const int lc1328 = lua_gettop(L);
        lc_getupvalue(L, lc1322, 23, 102);
        lua_pushvalue(L, 9);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1328), 1);
        lua_pushliteral(L, "^");
        lua_concat(L, 2);
        lua_concat(L, 2);
        lua_call(L, 1, 1);
        lua_concat(L, 2);
        lc_setupvalue(L, lc1322, 1, 222);
        assert(lua_gettop(L) == 10);
      } else {
        enum { lc1329 = 10 };
        lc_getupvalue(L, lc1322, 23, 99);
        lua_pushvalue(L, 9);
        lua_call(L, 1, 1);
        const int lc1330 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1330) {
          lua_pushvalue(L, 10);
          lua_pushvalue(L, 9);
          lua_pushliteral(L, ".");
          lc_getupvalue(L, lc1322, 23, 98);
          lc_getupvalue(L, lc1322, 23, 97);
          lua_call(L, 4, 0);
          assert(lua_gettop(L) == 10);
        } else {
          enum { lc1331 = 10 };
          lc_getupvalue(L, lc1322, 23, 95);
          lua_pushvalue(L, 9);
          lua_call(L, 1, 1);
          const int lc1332 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1332) {
            lua_getglobal(L, "tostring");
            lc_getupvalue(L, lc1322, 1, 222);
            lua_call(L, 1, 1);
            lua_getglobal(L, "tostring");
            lua_pushliteral(L, "_");
            lua_call(L, 1, 1);
            lua_concat(L, 2);
            lc_setupvalue(L, lc1322, 1, 222);
            assert(lua_gettop(L) == 10);
          } else {
            enum { lc1333 = 10 };
            lc_getupvalue(L, lc1322, 23, 93);
            lua_pushvalue(L, 9);
            lua_call(L, 1, 1);
            const int lc1334 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc1334) {
              lua_pushvalue(L, 10);
              lua_pushvalue(L, 9);
              lua_pushliteral(L, "#");
              lc_getupvalue(L, lc1322, 23, 92);
              lc_getupvalue(L, lc1322, 23, 91);
              lua_call(L, 4, 0);
              assert(lua_gettop(L) == 10);
            } else {
              enum { lc1335 = 10 };
              lc_getupvalue(L, lc1322, 23, 35);
              lua_pushvalue(L, 9);
              lua_call(L, 1, 1);
              const int lc1336 = lua_toboolean(L, -1);
              lua_pop(L, 1);
              if (lc1336) {
                lc_getupvalue(L, lc1322, 6, 171);
                lua_pushvalue(L, 9);
                lua_call(L, 1, 1);
                assert(lua_gettop(L) == 11);
                lua_pushvalue(L, 10);
                lua_pushvalue(L, 11);
                lua_pushliteral(L, "$");
                lua_pushvalue(L, lc1322);
                lua_pushcclosure(L, lcf1339, 1);
                lc_getupvalue(L, lc1322, 23, 85);
                lua_call(L, 4, 0);
                assert(lua_gettop(L) == 11);
              } else {
                const int lc1340 = lua_gettop(L);
                lc_getupvalue(L, lc1322, 23, 125);
                lua_call(L, 0, LUA_MULTRET);
                return (lua_gettop(L) - lc1340);
                assert(lua_gettop(L) == 10);
              }
              lua_settop(L, lc1335);
            }
            lua_settop(L, lc1333);
          }
          lua_settop(L, lc1331);
        }
        lua_settop(L, lc1329);
      }
      lua_settop(L, lc1326);
      assert(lua_gettop(L) == 10);
      lua_pop(L, 3);
    }
    lua_settop(L, lc1323);
    assert(lua_gettop(L) == 4);
    lc_getupvalue(L, lc1322, 0, 223);
    lua_replace(L, 2);
    assert(lua_gettop(L) == 4);
    lua_pop(L, 1);
  }
  lua_settop(L, lc1319);
  assert(lua_gettop(L) == 3);
  lc_getupvalue(L, lc1318, 0, 222);
  return 1;
  assert(lua_gettop(L) == 3);
}
static int lcf1_new_effect_bind(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc1351 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 23, 94);
  const int lc1352 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 225);
  lc_getupvalue(L, lua_upvalueindex(1), 23, 37);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1352), LUA_MULTRET);
  return (lua_gettop(L) - lc1351);
  assert(lua_gettop(L) == 2);
}
static int lcf1_new_effect_return(lua_State *L) {
  enum { lc_nformalargs = 1 };
  lua_settop(L, 1);
  const int lc1353 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 23, 94);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 224);
  lua_pushvalue(L, 1);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc1353);
  assert(lua_gettop(L) == 1);
}
static int lcf1_make_bind(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lua_getglobal(L, "error");
  lua_pushliteral(L, "WIP");
  lua_call(L, 1, 0);
  assert(lua_gettop(L) == 2);
  return 0;
}
static int lcf1_r(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc1374 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 227);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 233);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 234);
  lua_call(L, 2, LUA_MULTRET);
  return (lua_gettop(L) - lc1374);
  assert(lua_gettop(L) == 0);
}
static int lcf2_r(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc1380 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 226);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 235);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 236);
  lc_getupvalue(L, lua_upvalueindex(1), 30, 75);
  lc_getupvalue(L, lua_upvalueindex(1), 5, 231);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 237);
  lua_call(L, 2, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 238);
  lua_call(L, 4, LUA_MULTRET);
  return (lua_gettop(L) - lc1380);
  assert(lua_gettop(L) == 0);
}
static int lcf3_r(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc1400 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 7, 226);
  lc_getupvalue(L, lua_upvalueindex(1), 4, 239);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 240);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 241);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 243);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 242);
  lua_call(L, 5, LUA_MULTRET);
  return (lua_gettop(L) - lc1400);
  assert(lua_gettop(L) == 0);
}
static int lcf4_r(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc1409 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 9, 226);
  const int lc1410 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 6, 244);
  lc_getupvalue(L, lua_upvalueindex(1), 5, 245);
  lc_getupvalue(L, lua_upvalueindex(1), 4, 246);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 248);
  lc_getupvalue(L, lua_upvalueindex(1), 33, 94);
  const int lc1411 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 33, 62);
  lc_getupvalue(L, lua_upvalueindex(1), 33, 37);
  const int lc1412 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 33, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 250);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 7, 232);
  const int lc1413 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 33, 37);
  lc_getupvalue(L, lua_upvalueindex(1), 33, 7);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 247);
  lua_call(L, 1, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 250);
  lua_call(L, 2, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 33, 7);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 249);
  lua_call(L, 1, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1413), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1412), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1411), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1410), LUA_MULTRET);
  return (lua_gettop(L) - lc1409);
  assert(lua_gettop(L) == 0);
}
static int lcf1420(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc1419 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 228);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 229);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 230);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 227);
  lua_call(L, 3, LUA_MULTRET);
  return (lua_gettop(L) - lc1419);
  assert(lua_gettop(L) == 0);
}
static int lcf1426(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc1425 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 3, 226);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 227);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 228);
  lc_getupvalue(L, lua_upvalueindex(1), 27, 75);
  lc_getupvalue(L, lua_upvalueindex(1), 2, 231);
  lua_createtable(L, 1, 0);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 251);
  lua_rawseti(L, -2, 1);
  lua_call(L, 2, 1);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 252);
  lua_call(L, 4, LUA_MULTRET);
  return (lua_gettop(L) - lc1425);
  assert(lua_gettop(L) == 0);
}
static int lcf1427(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1423 = 3 };
  assert((lua_gettop(L) == lc1423));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 251);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 252);
  const int lc1424 = lua_gettop(L);
  lc_getupvalue(L, lc1423, 27, 120);
  lua_pushvalue(L, lc1423);
  lua_pushcclosure(L, lcf1426, 1);
  lua_call(L, 1, LUA_MULTRET);
  return (lua_gettop(L) - lc1424);
  assert(lua_gettop(L) == 3);
}
static int lcf1428(lua_State *L) {
  enum { lc_nformalargs = 0 };
  lua_settop(L, 0);
  const int lc1422 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 228);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 229);
  lc_getupvalue(L, lua_upvalueindex(1), 1, 230);
  lua_pushvalue(L, lua_upvalueindex(1));
  lua_pushcclosure(L, lcf1427, 1);
  lua_call(L, 3, LUA_MULTRET);
  return (lua_gettop(L) - lc1422);
  assert(lua_gettop(L) == 0);
}
static int lcf1_run_monad_helper(lua_State *L) {
  lua_checkstack(L, 31);
  enum { lc_nformalargs = 5 };
  lua_settop(L, 5);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1355 = 6 };
  assert((lua_gettop(L) == lc1355));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 227);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 228);
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 229);
  lua_pushvalue(L, 4);
  lua_rawseti(L, -2, 230);
  lua_pushvalue(L, 5);
  lua_rawseti(L, -2, 231);
  enum { lc1356 = 6 };
  lc_getupvalue(L, lc1355, 0, 231);
  lua_pushnil(L);
  const int lc1357 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc1357);
  const int lc1358 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1358) {
    lua_pushboolean(L, 0);
    lc_setupvalue(L, lc1355, 0, 231);
    assert(lua_gettop(L) == 6);
  }
  lua_settop(L, lc1356);
  assert(lua_gettop(L) == 6);
  lc_newclosuretable(L, lc1355);
  enum { lc1359 = 7 };
  assert((lua_gettop(L) == lc1359));
  lua_pushcfunction(L, lcf1_make_bind);
  lua_rawseti(L, lc1359, 232);
  assert(lua_gettop(L) == 7);
  lc_getupvalue(L, lc1359, 26, 30);
  lc_getupvalue(L, lc1359, 1, 229);
  lua_call(L, 1, 1);
  lc_setupvalue(L, lc1359, 1, 229);
  assert(lua_gettop(L) == 7);
  enum { lc1360 = 7 };
  lc_getupvalue(L, lc1359, 26, 93);
  lc_getupvalue(L, lc1359, 1, 229);
  lua_call(L, 1, 1);
  const int lc1361 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1361) {
    lc_getupvalue(L, lc1359, 26, 92);
    lc_getupvalue(L, lc1359, 1, 229);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 8);
    lc_getupvalue(L, lc1359, 26, 91);
    lc_getupvalue(L, lc1359, 1, 229);
    lua_call(L, 1, 1);
    assert(lua_gettop(L) == 9);
    enum { lc1362 = 9 };
    lc_getupvalue(L, lc1359, 26, 4);
    lua_pushvalue(L, 8);
    lc_getupvalue(L, lc1359, 4, 224);
    lua_call(L, 2, 1);
    const int lc1363 = lua_toboolean(L, -1);
    lua_pop(L, 1);
    if (lc1363) {
      lc_getupvalue(L, lc1359, 26, 30);
      lua_pushvalue(L, 9);
      lua_call(L, 1, 1);
      lua_replace(L, 9);
      assert(lua_gettop(L) == 9);
      enum { lc1364 = 9 };
      lc_getupvalue(L, lc1359, 26, 99);
      lua_pushvalue(L, 9);
      lua_call(L, 1, 1);
      const int lc1365 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1365) {
        lc_getupvalue(L, lc1359, 26, 98);
        lua_pushvalue(L, 9);
        lua_call(L, 1, 1);
        assert(lua_gettop(L) == 10);
        lc_getupvalue(L, lc1359, 26, 30);
        const int lc1366 = lua_gettop(L);
        lc_getupvalue(L, lc1359, 26, 97);
        lua_pushvalue(L, 9);
        lua_call(L, 1, LUA_MULTRET);
        lua_call(L, (lua_gettop(L) - lc1366), 1);
        assert(lua_gettop(L) == 11);
        enum { lc1367 = 11 };
        lc_getupvalue(L, lc1359, 26, 95);
        lua_pushvalue(L, 11);
        lua_call(L, 1, 1);
        const int lc1368 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1368) {
          enum { lc1369 = 11 };
          lc_getupvalue(L, lc1359, 1, 231);
          lua_pushboolean(L, 0);
          const int lc1370 = lua_compare(L, -2, -1, LUA_OPEQ);
          lua_pop(L, 2);
          lua_pushboolean(L, lc1370);
          const int lc1371 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1371) {
            lc_newclosuretable(L, lc1359);
            enum { lc1372 = 12 };
            assert((lua_gettop(L) == lc1372));
            lua_pushvalue(L, 10);
            lua_rawseti(L, lc1372, 233);
            assert(lua_gettop(L) == 12);
            lc_newclosuretable(L, lc1372);
            enum { lc1373 = 13 };
            assert((lua_gettop(L) == lc1373));
            lc_getupvalue(L, lc1372, 2, 230);
            lua_rawseti(L, lc1373, 234);
            assert(lua_gettop(L) == 13);
            lua_pushvalue(L, lc1373);
            lua_pushcclosure(L, lcf1_r, 1);
            assert(lua_gettop(L) == 14);
            const int lc1375 = lua_gettop(L);
            lc_getupvalue(L, lc1373, 28, 120);
            lua_pushvalue(L, 14);
            lua_call(L, 1, LUA_MULTRET);
            return (lua_gettop(L) - lc1375);
            assert(lua_gettop(L) == 14);
          } else {
            lc_newclosuretable(L, lc1359);
            enum { lc1376 = 12 };
            assert((lua_gettop(L) == lc1376));
            lua_settop(L, (lua_gettop(L) + 1));
            lua_rawseti(L, lc1376, 235);
            assert(lua_gettop(L) == 12);
            lc_getupvalue(L, lc1376, 2, 227);
            lc_setupvalue(L, lc1376, 0, 235);
            assert(lua_gettop(L) == 12);
            lc_newclosuretable(L, lc1376);
            enum { lc1377 = 13 };
            assert((lua_gettop(L) == lc1377));
            lua_settop(L, (lua_gettop(L) + 1));
            lua_rawseti(L, lc1377, 236);
            assert(lua_gettop(L) == 13);
            lc_getupvalue(L, lc1377, 3, 228);
            lc_setupvalue(L, lc1377, 0, 236);
            assert(lua_gettop(L) == 13);
            lc_newclosuretable(L, lc1377);
            enum { lc1378 = 14 };
            assert((lua_gettop(L) == lc1378));
            lua_pushvalue(L, 10);
            lua_rawseti(L, lc1378, 237);
            assert(lua_gettop(L) == 14);
            lc_newclosuretable(L, lc1378);
            enum { lc1379 = 15 };
            assert((lua_gettop(L) == lc1379));
            lc_getupvalue(L, lc1378, 4, 230);
            lua_rawseti(L, lc1379, 238);
            assert(lua_gettop(L) == 15);
            lua_pushvalue(L, lc1379);
            lua_pushcclosure(L, lcf2_r, 1);
            assert(lua_gettop(L) == 16);
            const int lc1381 = lua_gettop(L);
            lc_getupvalue(L, lc1379, 30, 120);
            lua_pushvalue(L, 16);
            lua_call(L, 1, LUA_MULTRET);
            return (lua_gettop(L) - lc1381);
            assert(lua_gettop(L) == 16);
          }
          lua_settop(L, lc1369);
          assert(lua_gettop(L) == 11);
        }
        lua_settop(L, lc1367);
        assert(lua_gettop(L) == 11);
      }
      lua_settop(L, lc1364);
      assert(lua_gettop(L) == 9);
    } else {
      enum { lc1382 = 9 };
      lc_getupvalue(L, lc1359, 26, 4);
      lua_pushvalue(L, 8);
      lc_getupvalue(L, lc1359, 3, 225);
      lua_call(L, 2, 1);
      const int lc1383 = lua_toboolean(L, -1);
      lua_pop(L, 1);
      if (lc1383) {
        lc_getupvalue(L, lc1359, 26, 30);
        lua_pushvalue(L, 9);
        lua_call(L, 1, 1);
        lua_replace(L, 9);
        assert(lua_gettop(L) == 9);
        enum { lc1384 = 9 };
        lc_getupvalue(L, lc1359, 26, 99);
        lua_pushvalue(L, 9);
        lua_call(L, 1, 1);
        const int lc1385 = lua_toboolean(L, -1);
        lua_pop(L, 1);
        if (lc1385) {
          lc_getupvalue(L, lc1359, 26, 98);
          lua_pushvalue(L, 9);
          lua_call(L, 1, 1);
          assert(lua_gettop(L) == 10);
          lc_getupvalue(L, lc1359, 26, 30);
          const int lc1386 = lua_gettop(L);
          lc_getupvalue(L, lc1359, 26, 97);
          lua_pushvalue(L, 9);
          lua_call(L, 1, LUA_MULTRET);
          lua_call(L, (lua_gettop(L) - lc1386), 1);
          assert(lua_gettop(L) == 11);
          enum { lc1387 = 11 };
          lc_getupvalue(L, lc1359, 26, 99);
          lua_pushvalue(L, 11);
          lua_call(L, 1, 1);
          const int lc1388 = lua_toboolean(L, -1);
          lua_pop(L, 1);
          if (lc1388) {
            lc_getupvalue(L, lc1359, 26, 98);
            lua_pushvalue(L, 11);
            lua_call(L, 1, 1);
            assert(lua_gettop(L) == 12);
            lc_getupvalue(L, lc1359, 26, 30);
            const int lc1389 = lua_gettop(L);
            lc_getupvalue(L, lc1359, 26, 97);
            lua_pushvalue(L, 11);
            lua_call(L, 1, LUA_MULTRET);
            lua_call(L, (lua_gettop(L) - lc1389), 1);
            assert(lua_gettop(L) == 13);
            enum { lc1390 = 13 };
            lc_getupvalue(L, lc1359, 26, 95);
            lua_pushvalue(L, 13);
            lua_call(L, 1, 1);
            const int lc1391 = lua_toboolean(L, -1);
            lua_pop(L, 1);
            if (lc1391) {
              enum { lc1392 = 13 };
              lc_getupvalue(L, lc1359, 1, 231);
              lua_pushboolean(L, 0);
              const int lc1393 = lua_compare(L, -2, -1, LUA_OPEQ);
              lua_pop(L, 2);
              lua_pushboolean(L, lc1393);
              const int lc1394 = lua_toboolean(L, -1);
              lua_pop(L, 1);
              if (lc1394) {
                lc_newclosuretable(L, lc1359);
                enum { lc1395 = 14 };
                assert((lua_gettop(L) == lc1395));
                lua_settop(L, (lua_gettop(L) + 1));
                lua_rawseti(L, lc1395, 239);
                assert(lua_gettop(L) == 14);
                lc_getupvalue(L, lc1395, 2, 227);
                lc_setupvalue(L, lc1395, 0, 239);
                assert(lua_gettop(L) == 14);
                lc_newclosuretable(L, lc1395);
                enum { lc1396 = 15 };
                assert((lua_gettop(L) == lc1396));
                lua_settop(L, (lua_gettop(L) + 1));
                lua_rawseti(L, lc1396, 240);
                assert(lua_gettop(L) == 15);
                lc_getupvalue(L, lc1396, 3, 228);
                lc_setupvalue(L, lc1396, 0, 240);
                assert(lua_gettop(L) == 15);
                lc_newclosuretable(L, lc1396);
                enum { lc1397 = 16 };
                assert((lua_gettop(L) == lc1397));
                lua_pushvalue(L, 10);
                lua_rawseti(L, lc1397, 241);
                assert(lua_gettop(L) == 16);
                lc_newclosuretable(L, lc1397);
                enum { lc1398 = 17 };
                assert((lua_gettop(L) == lc1398));
                lua_pushvalue(L, 12);
                lua_rawseti(L, lc1398, 242);
                assert(lua_gettop(L) == 17);
                lc_newclosuretable(L, lc1398);
                enum { lc1399 = 18 };
                assert((lua_gettop(L) == lc1399));
                lc_getupvalue(L, lc1398, 5, 230);
                lua_rawseti(L, lc1399, 243);
                assert(lua_gettop(L) == 18);
                lua_pushvalue(L, lc1399);
                lua_pushcclosure(L, lcf3_r, 1);
                assert(lua_gettop(L) == 19);
                const int lc1401 = lua_gettop(L);
                lc_getupvalue(L, lc1399, 31, 120);
                lua_pushvalue(L, 19);
                lua_call(L, 1, LUA_MULTRET);
                return (lua_gettop(L) - lc1401);
                assert(lua_gettop(L) == 19);
              } else {
                lc_newclosuretable(L, lc1359);
                enum { lc1402 = 14 };
                assert((lua_gettop(L) == lc1402));
                lua_settop(L, (lua_gettop(L) + 1));
                lua_rawseti(L, lc1402, 244);
                assert(lua_gettop(L) == 14);
                lc_getupvalue(L, lc1402, 2, 227);
                lc_setupvalue(L, lc1402, 0, 244);
                assert(lua_gettop(L) == 14);
                lc_newclosuretable(L, lc1402);
                enum { lc1403 = 15 };
                assert((lua_gettop(L) == lc1403));
                lua_settop(L, (lua_gettop(L) + 1));
                lua_rawseti(L, lc1403, 245);
                assert(lua_gettop(L) == 15);
                lc_getupvalue(L, lc1403, 3, 228);
                lc_setupvalue(L, lc1403, 0, 245);
                assert(lua_gettop(L) == 15);
                lc_newclosuretable(L, lc1403);
                enum { lc1404 = 16 };
                assert((lua_gettop(L) == lc1404));
                lua_pushvalue(L, 10);
                lua_rawseti(L, lc1404, 246);
                assert(lua_gettop(L) == 16);
                lc_newclosuretable(L, lc1404);
                enum { lc1405 = 17 };
                assert((lua_gettop(L) == lc1405));
                lua_pushvalue(L, 12);
                lua_rawseti(L, lc1405, 247);
                assert(lua_gettop(L) == 17);
                lc_newclosuretable(L, lc1405);
                enum { lc1406 = 18 };
                assert((lua_gettop(L) == lc1406));
                lc_getupvalue(L, lc1405, 5, 230);
                lua_rawseti(L, lc1406, 248);
                assert(lua_gettop(L) == 18);
                lc_newclosuretable(L, lc1406);
                enum { lc1407 = 19 };
                assert((lua_gettop(L) == lc1407));
                lc_getupvalue(L, lc1406, 6, 231);
                lua_rawseti(L, lc1407, 249);
                assert(lua_gettop(L) == 19);
                lc_newclosuretable(L, lc1407);
                enum { lc1408 = 20 };
                assert((lua_gettop(L) == lc1408));
                lc_getupvalue(L, lc1407, 30, 156);
                lua_pushliteral(L, "序甲");
                lua_call(L, 1, 1);
                lua_rawseti(L, lc1408, 250);
                assert(lua_gettop(L) == 20);
                lua_pushvalue(L, lc1408);
                lua_pushcclosure(L, lcf4_r, 1);
                assert(lua_gettop(L) == 21);
                const int lc1414 = lua_gettop(L);
                lc_getupvalue(L, lc1408, 33, 120);
                lua_pushvalue(L, 21);
                lua_call(L, 1, LUA_MULTRET);
                return (lua_gettop(L) - lc1414);
                assert(lua_gettop(L) == 21);
              }
              lua_settop(L, lc1392);
              assert(lua_gettop(L) == 13);
            }
            lua_settop(L, lc1390);
            assert(lua_gettop(L) == 13);
          }
          lua_settop(L, lc1387);
          assert(lua_gettop(L) == 11);
        }
        lua_settop(L, lc1384);
        assert(lua_gettop(L) == 9);
      }
      lua_settop(L, lc1382);
    }
    lua_settop(L, lc1362);
    assert(lua_gettop(L) == 9);
  }
  lua_settop(L, lc1360);
  assert(lua_gettop(L) == 7);
  enum { lc1415 = 7 };
  lc_getupvalue(L, lc1359, 1, 231);
  lua_pushboolean(L, 0);
  const int lc1416 = lua_compare(L, -2, -1, LUA_OPEQ);
  lua_pop(L, 2);
  lua_pushboolean(L, lc1416);
  const int lc1417 = lua_toboolean(L, -1);
  lua_pop(L, 1);
  if (lc1417) {
    const int lc1418 = lua_gettop(L);
    lc_getupvalue(L, lc1359, 26, 120);
    lua_pushvalue(L, lc1359);
    lua_pushcclosure(L, lcf1420, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc1418);
    assert(lua_gettop(L) == 7);
  } else {
    const int lc1421 = lua_gettop(L);
    lc_getupvalue(L, lc1359, 26, 120);
    lua_pushvalue(L, lc1359);
    lua_pushcclosure(L, lcf1428, 1);
    lua_call(L, 1, LUA_MULTRET);
    return (lua_gettop(L) - lc1421);
    assert(lua_gettop(L) == 7);
  }
  lua_settop(L, lc1415);
  assert(lua_gettop(L) == 7);
  return 0;
}
static int lcf1_run_monad_trampoline(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  const int lc1429 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 226);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 4);
  lua_call(L, 4, LUA_MULTRET);
  return (lua_gettop(L) - lc1429);
  assert(lua_gettop(L) == 4);
}
static int lcf1435(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc1433 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 25, 121);
  const int lc1434 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 253);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1434), LUA_MULTRET);
  return (lua_gettop(L) - lc1433);
  assert(lua_gettop(L) == 2);
}
static int lcf1441(lua_State *L) {
  enum { lc_nformalargs = 2 };
  lua_settop(L, 2);
  const int lc1439 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 25, 155);
  const int lc1440 = lua_gettop(L);
  lc_getupvalue(L, lua_upvalueindex(1), 0, 255);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1440), LUA_MULTRET);
  return (lua_gettop(L) - lc1439);
  assert(lua_gettop(L) == 2);
}
static int lcf1442(lua_State *L) {
  enum { lc_nformalargs = 3 };
  lua_settop(L, 3);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1436 = 4 };
  assert((lua_gettop(L) == lc1436));
  lua_pushvalue(L, 3);
  lua_rawseti(L, -2, 255);
  const int lc1437 = lua_gettop(L);
  lc_getupvalue(L, lc1436, 26, 121);
  const int lc1438 = lua_gettop(L);
  lc_getupvalue(L, lc1436, 1, 254);
  lua_pushvalue(L, 1);
  lua_pushvalue(L, 2);
  lua_pushvalue(L, lc1436);
  lua_pushcclosure(L, lcf1441, 1);
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1438), LUA_MULTRET);
  return (lua_gettop(L) - lc1437);
  assert(lua_gettop(L) == 4);
}
static int lcf1_run_monad_stackoverflow(lua_State *L) {
  enum { lc_nformalargs = 4 };
  lua_settop(L, 4);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1430 = 5 };
  assert((lua_gettop(L) == lc1430));
  lua_pushvalue(L, 1);
  lua_rawseti(L, -2, 253);
  lua_pushvalue(L, 2);
  lua_rawseti(L, -2, 254);
  const int lc1431 = lua_gettop(L);
  lc_getupvalue(L, lc1430, 24, 155);
  const int lc1432 = lua_gettop(L);
  lc_getupvalue(L, lc1430, 1, 226);
  lua_pushvalue(L, lc1430);
  lua_pushcclosure(L, lcf1435, 1);
  lua_pushvalue(L, lc1430);
  lua_pushcclosure(L, lcf1442, 1);
  lua_pushvalue(L, 3);
  lua_pushvalue(L, 4);
  lua_call(L, 4, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1432), LUA_MULTRET);
  return (lua_gettop(L) - lc1431);
  assert(lua_gettop(L) == 5);
}
static int lcf_main(lua_State *L) {
  lua_checkstack(L, 74);
  enum { lc_nformalargs = 0 };
  const int lc_nactualargs = lua_gettop(L);
  const int lc_nextra = (lc_nactualargs - lc_nformalargs);
  lc_newclosuretable(L, lua_upvalueindex(1));
  enum { lc1 = 1 };
  assert((lua_gettop(L) == (lc1 + lc_nextra)));
  lua_pushcfunction(L, lcf1___TS__ArrayPush);
  lua_rawseti(L, (lc1 + lc_nextra), 1);
  assert(lua_gettop(L) - lc_nextra == 1);
  lc_newclosuretable(L, (lc1 + lc_nextra));
  enum { lc6 = 2 };
  assert((lua_gettop(L) == (lc6 + lc_nextra)));
  lua_pushcfunction(L, lcf1___TS__ArrayUnshift);
  lua_rawseti(L, (lc6 + lc_nextra), 2);
  assert(lua_gettop(L) - lc_nextra == 2);
  lc_newclosuretable(L, (lc6 + lc_nextra));
  enum { lc12 = 3 };
  assert((lua_gettop(L) == (lc12 + lc_nextra)));
  lua_settop(L, (lua_gettop(L) + 123));
  lua_rawseti(L, (lc12 + lc_nextra), 3);
  lua_rawseti(L, (lc12 + lc_nextra), 4);
  lua_rawseti(L, (lc12 + lc_nextra), 5);
  lua_rawseti(L, (lc12 + lc_nextra), 6);
  lua_rawseti(L, (lc12 + lc_nextra), 7);
  lua_rawseti(L, (lc12 + lc_nextra), 8);
  lua_rawseti(L, (lc12 + lc_nextra), 9);
  lua_rawseti(L, (lc12 + lc_nextra), 10);
  lua_rawseti(L, (lc12 + lc_nextra), 11);
  lua_rawseti(L, (lc12 + lc_nextra), 12);
  lua_rawseti(L, (lc12 + lc_nextra), 13);
  lua_rawseti(L, (lc12 + lc_nextra), 14);
  lua_rawseti(L, (lc12 + lc_nextra), 15);
  lua_rawseti(L, (lc12 + lc_nextra), 16);
  lua_rawseti(L, (lc12 + lc_nextra), 17);
  lua_rawseti(L, (lc12 + lc_nextra), 18);
  lua_rawseti(L, (lc12 + lc_nextra), 19);
  lua_rawseti(L, (lc12 + lc_nextra), 20);
  lua_rawseti(L, (lc12 + lc_nextra), 21);
  lua_rawseti(L, (lc12 + lc_nextra), 22);
  lua_rawseti(L, (lc12 + lc_nextra), 23);
  lua_rawseti(L, (lc12 + lc_nextra), 24);
  lua_rawseti(L, (lc12 + lc_nextra), 25);
  lua_rawseti(L, (lc12 + lc_nextra), 26);
  lua_rawseti(L, (lc12 + lc_nextra), 27);
  lua_rawseti(L, (lc12 + lc_nextra), 28);
  lua_rawseti(L, (lc12 + lc_nextra), 29);
  lua_rawseti(L, (lc12 + lc_nextra), 30);
  lua_rawseti(L, (lc12 + lc_nextra), 31);
  lua_rawseti(L, (lc12 + lc_nextra), 32);
  lua_rawseti(L, (lc12 + lc_nextra), 33);
  lua_rawseti(L, (lc12 + lc_nextra), 34);
  lua_rawseti(L, (lc12 + lc_nextra), 35);
  lua_rawseti(L, (lc12 + lc_nextra), 36);
  lua_rawseti(L, (lc12 + lc_nextra), 37);
  lua_rawseti(L, (lc12 + lc_nextra), 38);
  lua_rawseti(L, (lc12 + lc_nextra), 39);
  lua_rawseti(L, (lc12 + lc_nextra), 40);
  lua_rawseti(L, (lc12 + lc_nextra), 41);
  lua_rawseti(L, (lc12 + lc_nextra), 42);
  lua_rawseti(L, (lc12 + lc_nextra), 43);
  lua_rawseti(L, (lc12 + lc_nextra), 44);
  lua_rawseti(L, (lc12 + lc_nextra), 45);
  lua_rawseti(L, (lc12 + lc_nextra), 46);
  lua_rawseti(L, (lc12 + lc_nextra), 47);
  lua_rawseti(L, (lc12 + lc_nextra), 48);
  lua_rawseti(L, (lc12 + lc_nextra), 49);
  lua_rawseti(L, (lc12 + lc_nextra), 50);
  lua_rawseti(L, (lc12 + lc_nextra), 51);
  lua_rawseti(L, (lc12 + lc_nextra), 52);
  lua_rawseti(L, (lc12 + lc_nextra), 53);
  lua_rawseti(L, (lc12 + lc_nextra), 54);
  lua_rawseti(L, (lc12 + lc_nextra), 55);
  lua_rawseti(L, (lc12 + lc_nextra), 56);
  lua_rawseti(L, (lc12 + lc_nextra), 57);
  lua_rawseti(L, (lc12 + lc_nextra), 58);
  lua_rawseti(L, (lc12 + lc_nextra), 59);
  lua_rawseti(L, (lc12 + lc_nextra), 60);
  lua_rawseti(L, (lc12 + lc_nextra), 61);
  lua_rawseti(L, (lc12 + lc_nextra), 62);
  lua_rawseti(L, (lc12 + lc_nextra), 63);
  lua_rawseti(L, (lc12 + lc_nextra), 64);
  lua_rawseti(L, (lc12 + lc_nextra), 65);
  lua_rawseti(L, (lc12 + lc_nextra), 66);
  lua_rawseti(L, (lc12 + lc_nextra), 67);
  lua_rawseti(L, (lc12 + lc_nextra), 68);
  lua_rawseti(L, (lc12 + lc_nextra), 69);
  lua_rawseti(L, (lc12 + lc_nextra), 70);
  lua_rawseti(L, (lc12 + lc_nextra), 71);
  lua_rawseti(L, (lc12 + lc_nextra), 72);
  lua_rawseti(L, (lc12 + lc_nextra), 73);
  lua_rawseti(L, (lc12 + lc_nextra), 74);
  lua_rawseti(L, (lc12 + lc_nextra), 75);
  lua_rawseti(L, (lc12 + lc_nextra), 76);
  lua_rawseti(L, (lc12 + lc_nextra), 77);
  lua_rawseti(L, (lc12 + lc_nextra), 78);
  lua_rawseti(L, (lc12 + lc_nextra), 79);
  lua_rawseti(L, (lc12 + lc_nextra), 80);
  lua_rawseti(L, (lc12 + lc_nextra), 81);
  lua_rawseti(L, (lc12 + lc_nextra), 82);
  lua_rawseti(L, (lc12 + lc_nextra), 83);
  lua_rawseti(L, (lc12 + lc_nextra), 84);
  lua_rawseti(L, (lc12 + lc_nextra), 85);
  lua_rawseti(L, (lc12 + lc_nextra), 86);
  lua_rawseti(L, (lc12 + lc_nextra), 87);
  lua_rawseti(L, (lc12 + lc_nextra), 88);
  lua_rawseti(L, (lc12 + lc_nextra), 89);
  lua_rawseti(L, (lc12 + lc_nextra), 90);
  lua_rawseti(L, (lc12 + lc_nextra), 91);
  lua_rawseti(L, (lc12 + lc_nextra), 92);
  lua_rawseti(L, (lc12 + lc_nextra), 93);
  lua_rawseti(L, (lc12 + lc_nextra), 94);
  lua_rawseti(L, (lc12 + lc_nextra), 95);
  lua_rawseti(L, (lc12 + lc_nextra), 96);
  lua_rawseti(L, (lc12 + lc_nextra), 97);
  lua_rawseti(L, (lc12 + lc_nextra), 98);
  lua_rawseti(L, (lc12 + lc_nextra), 99);
  lua_rawseti(L, (lc12 + lc_nextra), 100);
  lua_rawseti(L, (lc12 + lc_nextra), 101);
  lua_rawseti(L, (lc12 + lc_nextra), 102);
  lua_rawseti(L, (lc12 + lc_nextra), 103);
  lua_rawseti(L, (lc12 + lc_nextra), 104);
  lua_rawseti(L, (lc12 + lc_nextra), 105);
  lua_rawseti(L, (lc12 + lc_nextra), 106);
  lua_rawseti(L, (lc12 + lc_nextra), 107);
  lua_rawseti(L, (lc12 + lc_nextra), 108);
  lua_rawseti(L, (lc12 + lc_nextra), 109);
  lua_rawseti(L, (lc12 + lc_nextra), 110);
  lua_rawseti(L, (lc12 + lc_nextra), 111);
  lua_rawseti(L, (lc12 + lc_nextra), 112);
  lua_rawseti(L, (lc12 + lc_nextra), 113);
  lua_rawseti(L, (lc12 + lc_nextra), 114);
  lua_rawseti(L, (lc12 + lc_nextra), 115);
  lua_rawseti(L, (lc12 + lc_nextra), 116);
  lua_rawseti(L, (lc12 + lc_nextra), 117);
  lua_rawseti(L, (lc12 + lc_nextra), 118);
  lua_rawseti(L, (lc12 + lc_nextra), 119);
  lua_rawseti(L, (lc12 + lc_nextra), 120);
  lua_rawseti(L, (lc12 + lc_nextra), 121);
  lua_rawseti(L, (lc12 + lc_nextra), 122);
  lua_rawseti(L, (lc12 + lc_nextra), 123);
  lua_rawseti(L, (lc12 + lc_nextra), 124);
  lua_rawseti(L, (lc12 + lc_nextra), 125);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_LANG_ERROR);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 125);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_LANG_ASSERT, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 124);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_recordstring_null_p);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 123);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_recordstring_shadow_copy);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 122);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_trampoline_return);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 121);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_trampoline_delay);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 120);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_comment, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 108);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_comment_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 107);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_comment_comment);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 106);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_comment_x);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 105);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_un_comment_all, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 104);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_atom_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 103);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_un_atom);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 102);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_atom_equal_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 101);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_construction, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 100);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_construction_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 99);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_construction_head);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 98);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_construction_tail);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 97);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_null_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 95);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_data, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 94);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_data_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 93);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_data_name);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 92);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_data_list);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 91);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_just_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 90);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_un_just);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 89);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_evaluate, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 88);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_evaluate_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 87);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_evaluate_env);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 86);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_evaluate_x);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 85);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_builtin_form_apply, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 84);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_builtin_form_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 83);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_builtin_form_env);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 82);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_builtin_form_f);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 81);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_builtin_form_xs);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 80);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_builtin_func_apply, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 79);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_builtin_func_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 78);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_builtin_func_f);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 77);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_builtin_func_xs);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 76);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_apply, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 75);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_apply_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 74);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_apply_f);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 73);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_delay_apply_xs);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 72);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_force_all_rec, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 71);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_hole_do, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 69);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_hole_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 68);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_lang_assert_equal_set_do, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 67);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_hole_set_do, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 66);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_lang_copy_do, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 65);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_error, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 39);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_jsArray_to_list, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 38);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_list, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 37);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_un_just_all, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 36);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 35);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_just_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 34);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_lazy_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 33);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_force_all_inner, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 32);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_force1, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 31);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_force_all, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 30);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_force_uncomment_all, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 29);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_unlazy1, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 28);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_unlazy_list_1_keepcomment, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 27);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_name_unlazy1_p3, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 26);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_make_enviroment_null_v);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 25);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_enviroment_null_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 24);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_enviroment_helper_print0, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 23);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_enviroment_helper_print_step, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 22);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_enviroment_helper_node_expand, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 21);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_enviroment_helper_tree_shadow_copy, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 20);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_enviroment_set_helper, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 19);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_env_set, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 17);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_env_get, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 16);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_must_env_get, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 15);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_env2val, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 14);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushcfunction(L, lcf1_env_foreach);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 13);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_real_evaluate, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 12);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_real_apply, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 10);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_real_builtin_func_apply, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 9);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_real_builtin_form_apply, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 8);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_make_quote, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 7);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_lambda, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 6);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_jsbool_equal_p_inner, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 5);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_equal_p, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 4);
  assert(lua_gettop(L) - lc_nextra == 3);
  lua_pushvalue(L, (lc12 + lc_nextra));
  lua_pushcclosure(L, lcf1_simple_print, 1);
  lc_setupvalue(L, (lc12 + lc_nextra), 0, 3);
  assert(lua_gettop(L) - lc_nextra == 3);
  lc_newclosuretable(L, (lc12 + lc_nextra));
  enum { lc610 = 4 };
  assert((lua_gettop(L) == (lc610 + lc_nextra)));
  lua_pushcfunction(L, lcf1_run_trampoline);
  lua_rawseti(L, (lc610 + lc_nextra), 155);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 0);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 119);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 1);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 118);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 2);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 117);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 3);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 116);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 4);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 115);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 5);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 114);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 6);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 113);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 7);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 112);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 8);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 111);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 10);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 110);
  assert(lua_gettop(L) - lc_nextra == 4);
  lua_pushnumber(L, 9);
  lc_setupvalue(L, (lc610 + lc_nextra), 1, 109);
  assert(lua_gettop(L) - lc_nextra == 4);
  lc_newclosuretable(L, (lc610 + lc_nextra));
  enum { lc612 = 5 };
  assert((lua_gettop(L) == (lc612 + lc_nextra)));
  lua_pushvalue(L, (lc612 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_atom, 1);
  lua_rawseti(L, (lc612 + lc_nextra), 156);
  assert(lua_gettop(L) - lc_nextra == 5);
  lua_createtable(L, 1, 0);
  lc_getupvalue(L, (lc612 + lc_nextra), 2, 117);
  lua_rawseti(L, -2, 1);
  lc_setupvalue(L, (lc612 + lc_nextra), 2, 96);
  assert(lua_gettop(L) - lc_nextra == 5);
  lc_newclosuretable(L, (lc612 + lc_nextra));
  enum { lc613 = 6 };
  assert((lua_gettop(L) == (lc613 + lc_nextra)));
  lua_pushvalue(L, (lc613 + lc_nextra));
  lua_pushcclosure(L, lcf1_force_uncomment_all_rec, 1);
  lua_rawseti(L, (lc613 + lc_nextra), 157);
  assert(lua_gettop(L) - lc_nextra == 6);
  lc_getupvalue(L, (lc613 + lc_nextra), 0, 157);
  lc_setupvalue(L, (lc613 + lc_nextra), 3, 70);
  assert(lua_gettop(L) - lc_nextra == 6);
  lc_getupvalue(L, (lc613 + lc_nextra), 1, 156);
  lua_pushliteral(L, "太始初核");
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc613 + lc_nextra), 3, 64);
  assert(lua_gettop(L) - lc_nextra == 6);
  lc_getupvalue(L, (lc613 + lc_nextra), 1, 156);
  lua_pushliteral(L, "符名");
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc613 + lc_nextra), 3, 63);
  assert(lua_gettop(L) - lc_nextra == 6);
  lc_getupvalue(L, (lc613 + lc_nextra), 1, 156);
  lua_pushliteral(L, "化滅");
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc613 + lc_nextra), 3, 62);
  assert(lua_gettop(L) - lc_nextra == 6);
  lc_getupvalue(L, (lc613 + lc_nextra), 1, 156);
  lua_pushliteral(L, "式形");
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc613 + lc_nextra), 3, 61);
  assert(lua_gettop(L) - lc_nextra == 6);
  lc_getupvalue(L, (lc613 + lc_nextra), 1, 156);
  lua_pushliteral(L, "等同");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 7);
  lc_getupvalue(L, (lc613 + lc_nextra), 1, 156);
  lua_pushliteral(L, "解算");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 8);
  lc_newclosuretable(L, (lc613 + lc_nextra));
  enum { lc622 = 9 };
  assert((lua_gettop(L) == (lc622 + lc_nextra)));
  lc_getupvalue(L, (lc613 + lc_nextra), 1, 156);
  lua_pushliteral(L, "特定其物");
  lua_call(L, 1, 1);
  lua_rawseti(L, (lc622 + lc_nextra), 158);
  assert(lua_gettop(L) - lc_nextra == 9);
  lc_newclosuretable(L, (lc622 + lc_nextra));
  enum { lc623 = 10 };
  assert((lua_gettop(L) == (lc623 + lc_nextra)));
  lc_getupvalue(L, (lc622 + lc_nextra), 2, 156);
  lua_pushliteral(L, "省略一物");
  lua_call(L, 1, 1);
  lua_rawseti(L, (lc623 + lc_nextra), 159);
  assert(lua_gettop(L) - lc_nextra == 10);
  lc_getupvalue(L, (lc623 + lc_nextra), 3, 156);
  lua_pushliteral(L, "映表");
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc623 + lc_nextra), 5, 60);
  assert(lua_gettop(L) - lc_nextra == 10);
  lc_getupvalue(L, (lc623 + lc_nextra), 3, 156);
  lua_pushliteral(L, "如若");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 11);
  lc_newclosuretable(L, (lc623 + lc_nextra));
  enum { lc624 = 12 };
  assert((lua_gettop(L) == (lc624 + lc_nextra)));
  lc_getupvalue(L, (lc623 + lc_nextra), 3, 156);
  lua_pushliteral(L, "一類何物");
  lua_call(L, 1, 1);
  lua_rawseti(L, (lc624 + lc_nextra), 160);
  assert(lua_gettop(L) - lc_nextra == 12);
  lc_newclosuretable(L, (lc624 + lc_nextra));
  enum { lc625 = 13 };
  assert((lua_gettop(L) == (lc625 + lc_nextra)));
  lc_getupvalue(L, (lc624 + lc_nextra), 4, 156);
  lua_pushliteral(L, "是非");
  lua_call(L, 1, 1);
  lua_rawseti(L, (lc625 + lc_nextra), 161);
  assert(lua_gettop(L) - lc_nextra == 13);
  lc_newclosuretable(L, (lc625 + lc_nextra));
  enum { lc626 = 14 };
  assert((lua_gettop(L) == (lc626 + lc_nextra)));
  lc_getupvalue(L, (lc625 + lc_nextra), 5, 156);
  lua_pushliteral(L, "其子");
  lua_call(L, 1, 1);
  lua_rawseti(L, (lc626 + lc_nextra), 162);
  assert(lua_gettop(L) - lc_nextra == 14);
  lc_newclosuretable(L, (lc626 + lc_nextra));
  enum { lc627 = 15 };
  assert((lua_gettop(L) == (lc627 + lc_nextra)));
  lc_getupvalue(L, (lc626 + lc_nextra), 6, 156);
  lua_pushliteral(L, "爻陽");
  lua_call(L, 1, 1);
  lua_rawseti(L, (lc627 + lc_nextra), 163);
  assert(lua_gettop(L) - lc_nextra == 15);
  lc_newclosuretable(L, (lc627 + lc_nextra));
  enum { lc628 = 16 };
  assert((lua_gettop(L) == (lc628 + lc_nextra)));
  lc_getupvalue(L, (lc627 + lc_nextra), 7, 156);
  lua_pushliteral(L, "爻陰");
  lua_call(L, 1, 1);
  lua_rawseti(L, (lc628 + lc_nextra), 164);
  assert(lua_gettop(L) - lc_nextra == 16);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "引用");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 17);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "應用");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 18);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "間空");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 19);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "連頸");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 20);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "構物");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 21);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "謬誤");
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc628 + lc_nextra), 10, 59);
  assert(lua_gettop(L) - lc_nextra == 21);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "詞素");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 22);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "列序");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 23);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "首始");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 24);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "尾末");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 25);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "之物");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 26);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "宇宙亡矣");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 27);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "效應");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 28);
  lc_getupvalue(L, (lc628 + lc_nextra), 8, 156);
  lua_pushliteral(L, "註疏");
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 29);
  lc_getupvalue(L, (lc628 + lc_nextra), 10, 39);
  const int lc629 = lua_gettop(L);
  lc_getupvalue(L, (lc628 + lc_nextra), 10, 64);
  lc_getupvalue(L, (lc628 + lc_nextra), 10, 37);
  lua_pushvalue(L, (27 + lc_nextra));
  lc_getupvalue(L, (lc628 + lc_nextra), 5, 159);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc629), 1);
  lc_setupvalue(L, (lc628 + lc_nextra), 10, 58);
  assert(lua_gettop(L) - lc_nextra == 29);
  lc_newclosuretable(L, (lc628 + lc_nextra));
  enum { lc630 = 30 };
  assert((lua_gettop(L) == (lc630 + lc_nextra)));
  lua_pushvalue(L, (lc630 + lc_nextra));
  lua_pushcclosure(L, lcf1_systemName_make, 1);
  lua_rawseti(L, (lc630 + lc_nextra), 165);
  assert(lua_gettop(L) - lc_nextra == 30);
  lua_pushvalue(L, (lc630 + lc_nextra));
  lua_pushcclosure(L, lcf1_make_builtin_f_new_sym_f, 1);
  assert(lua_gettop(L) - lc_nextra == 31);
  lua_pushvalue(L, (lc630 + lc_nextra));
  lua_pushcclosure(L, lcf1_make_builtin_f_get_sym_f, 1);
  assert(lua_gettop(L) - lc_nextra == 32);
  lua_pushvalue(L, (lc630 + lc_nextra));
  lua_pushcclosure(L, lcf1_make_builtin_f_p_sym_f, 1);
  assert(lua_gettop(L) - lc_nextra == 33);
  lua_pushvalue(L, (31 + lc_nextra));
  lua_pushvalue(L, (21 + lc_nextra));
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 34);
  lua_pushvalue(L, (32 + lc_nextra));
  lua_pushvalue(L, (21 + lc_nextra));
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 63);
  lua_call(L, 2, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 57);
  assert(lua_gettop(L) - lc_nextra == 34);
  lua_pushvalue(L, (32 + lc_nextra));
  lua_pushvalue(L, (21 + lc_nextra));
  lua_pushvalue(L, (23 + lc_nextra));
  lua_call(L, 2, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 56);
  assert(lua_gettop(L) - lc_nextra == 34);
  lua_pushvalue(L, (33 + lc_nextra));
  lua_pushvalue(L, (21 + lc_nextra));
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 55);
  assert(lua_gettop(L) - lc_nextra == 34);
  lua_pushvalue(L, (31 + lc_nextra));
  lua_pushvalue(L, (20 + lc_nextra));
  lua_call(L, 1, 1);
  assert(lua_gettop(L) - lc_nextra == 35);
  lua_pushvalue(L, (33 + lc_nextra));
  lua_pushvalue(L, (20 + lc_nextra));
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 54);
  assert(lua_gettop(L) - lc_nextra == 35);
  lua_pushvalue(L, (32 + lc_nextra));
  lua_pushvalue(L, (20 + lc_nextra));
  lua_pushvalue(L, (24 + lc_nextra));
  lua_call(L, 2, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 53);
  assert(lua_gettop(L) - lc_nextra == 35);
  lua_pushvalue(L, (32 + lc_nextra));
  lua_pushvalue(L, (20 + lc_nextra));
  lua_pushvalue(L, (25 + lc_nextra));
  lua_call(L, 2, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 52);
  assert(lua_gettop(L) - lc_nextra == 35);
  lua_pushvalue(L, (33 + lc_nextra));
  lua_pushvalue(L, (22 + lc_nextra));
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 51);
  assert(lua_gettop(L) - lc_nextra == 35);
  lua_pushvalue(L, (33 + lc_nextra));
  lua_pushvalue(L, (19 + lc_nextra));
  lua_call(L, 1, 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 50);
  assert(lua_gettop(L) - lc_nextra == 35);
  lc_getupvalue(L, (lc630 + lc_nextra), 0, 165);
  const int lc642 = lua_gettop(L);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 37);
  const int lc643 = lua_gettop(L);
  lc_getupvalue(L, (lc630 + lc_nextra), 5, 160);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 62);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 37);
  lc_getupvalue(L, (lc630 + lc_nextra), 4, 161);
  lua_pushvalue(L, (7 + lc_nextra));
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc643), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc642), 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 49);
  assert(lua_gettop(L) - lc_nextra == 35);
  lc_getupvalue(L, (lc630 + lc_nextra), 0, 165);
  const int lc644 = lua_gettop(L);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 37);
  lc_getupvalue(L, (lc630 + lc_nextra), 5, 160);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 37);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 62);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 100);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 62);
  lc_getupvalue(L, (lc630 + lc_nextra), 6, 159);
  lua_call(L, 2, 1);
  lc_getupvalue(L, (lc630 + lc_nextra), 6, 159);
  lua_call(L, 3, 1);
  lua_pushvalue(L, (18 + lc_nextra));
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc644), 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 48);
  assert(lua_gettop(L) - lc_nextra == 35);
  lc_getupvalue(L, (lc630 + lc_nextra), 0, 165);
  const int lc645 = lua_gettop(L);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 37);
  lc_getupvalue(L, (lc630 + lc_nextra), 5, 160);
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 62);
  lua_pushvalue(L, (8 + lc_nextra));
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc645), 1);
  lc_setupvalue(L, (lc630 + lc_nextra), 11, 47);
  assert(lua_gettop(L) - lc_nextra == 35);
  lc_newclosuretable(L, (lc630 + lc_nextra));
  enum { lc646 = 36 };
  assert((lua_gettop(L) == (lc646 + lc_nextra)));
  lua_pushvalue(L, (32 + lc_nextra));
  const int lc647 = lua_gettop(L);
  lua_pushvalue(L, (23 + lc_nextra));
  lc_getupvalue(L, (lc630 + lc_nextra), 11, 37);
  lc_getupvalue(L, (lc630 + lc_nextra), 5, 160);
  lua_pushvalue(L, (26 + lc_nextra));
  lc_getupvalue(L, (lc630 + lc_nextra), 6, 159);
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc647), 1);
  lua_rawseti(L, (lc646 + lc_nextra), 166);
  assert(lua_gettop(L) - lc_nextra == 36);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc648 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 6, 160);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 62);
  lua_pushvalue(L, (11 + lc_nextra));
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc648), 1);
  lc_setupvalue(L, (lc646 + lc_nextra), 12, 46);
  assert(lua_gettop(L) - lc_nextra == 36);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc649 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 6, 160);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lua_pushvalue(L, (17 + lc_nextra));
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc649), 1);
  lc_setupvalue(L, (lc646 + lc_nextra), 12, 45);
  assert(lua_gettop(L) - lc_nextra == 36);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc650 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 6, 160);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  const int lc651 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 62);
  lc_getupvalue(L, (lc646 + lc_nextra), 7, 159);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 62);
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc651), 1);
  lc_getupvalue(L, (lc646 + lc_nextra), 8, 158);
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc650), 1);
  lc_setupvalue(L, (lc646 + lc_nextra), 12, 44);
  assert(lua_gettop(L) - lc_nextra == 36);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc652 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  const int lc653 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 64);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 62);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc653), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc652), 1);
  lc_setupvalue(L, (lc646 + lc_nextra), 12, 43);
  assert(lua_gettop(L) - lc_nextra == 36);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc654 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  const int lc655 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 64);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc655), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc654), 1);
  lc_setupvalue(L, (lc646 + lc_nextra), 12, 42);
  assert(lua_gettop(L) - lc_nextra == 36);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc656 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc656), 1);
  lc_setupvalue(L, (lc646 + lc_nextra), 12, 41);
  assert(lua_gettop(L) - lc_nextra == 36);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc657 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 6, 160);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 62);
  lua_pushvalue(L, (29 + lc_nextra));
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc657), 1);
  assert(lua_gettop(L) - lc_nextra == 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 1, 165);
  const int lc658 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lc_getupvalue(L, (lc646 + lc_nextra), 6, 160);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 61);
  lua_pushvalue(L, (29 + lc_nextra));
  lua_call(L, 3, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc658), 1);
  lc_setupvalue(L, (lc646 + lc_nextra), 12, 40);
  assert(lua_gettop(L) - lc_nextra == 37);
  lc_newclosuretable(L, (lc646 + lc_nextra));
  enum { lc659 = 38 };
  assert((lua_gettop(L) == (lc659 + lc_nextra)));
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 94);
  const int lc660 = lua_gettop(L);
  lc_getupvalue(L, (lc646 + lc_nextra), 2, 164);
  lc_getupvalue(L, (lc646 + lc_nextra), 12, 37);
  lua_call(L, 0, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc660), 1);
  lua_rawseti(L, (lc659 + lc_nextra), 167);
  assert(lua_gettop(L) - lc_nextra == 38);
  lc_newclosuretable(L, (lc659 + lc_nextra));
  enum { lc661 = 39 };
  assert((lua_gettop(L) == (lc661 + lc_nextra)));
  lc_getupvalue(L, (lc659 + lc_nextra), 13, 94);
  const int lc662 = lua_gettop(L);
  lc_getupvalue(L, (lc659 + lc_nextra), 4, 163);
  lc_getupvalue(L, (lc659 + lc_nextra), 13, 37);
  lua_call(L, 0, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc662), 1);
  lua_rawseti(L, (lc661 + lc_nextra), 168);
  assert(lua_gettop(L) - lc_nextra == 39);
  lc_newclosuretable(L, (lc661 + lc_nextra));
  enum { lc663 = 40 };
  assert((lua_gettop(L) == (lc663 + lc_nextra)));
  lua_pushvalue(L, (lc663 + lc_nextra));
  lua_pushcclosure(L, lcf1_list_to_jsArray, 1);
  lua_rawseti(L, (lc663 + lc_nextra), 169);
  assert(lua_gettop(L) - lc_nextra == 40);
  lc_newclosuretable(L, (lc663 + lc_nextra));
  enum { lc670 = 41 };
  assert((lua_gettop(L) == (lc670 + lc_nextra)));
  lua_pushvalue(L, (lc670 + lc_nextra));
  lua_pushcclosure(L, lcf1_maybe_list_to_jsArray, 1);
  lua_rawseti(L, (lc670 + lc_nextra), 170);
  assert(lua_gettop(L) - lc_nextra == 41);
  lua_pushvalue(L, (lc670 + lc_nextra));
  lua_pushcclosure(L, lcf1_un_just_comment_all, 1);
  assert(lua_gettop(L) - lc_nextra == 42);
  lc_newclosuretable(L, (lc670 + lc_nextra));
  enum { lc676 = 43 };
  assert((lua_gettop(L) == (lc676 + lc_nextra)));
  lua_pushvalue(L, (lc676 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay2delay_evaluate, 1);
  lua_rawseti(L, (lc676 + lc_nextra), 171);
  assert(lua_gettop(L) - lc_nextra == 43);
  lua_pushvalue(L, (lc676 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_env, 1);
  assert(lua_gettop(L) - lc_nextra == 44);
  lua_pushvalue(L, (lc676 + lc_nextra));
  lua_pushcclosure(L, lcf1_delay_x, 1);
  assert(lua_gettop(L) - lc_nextra == 45);
  lua_pushvalue(L, (lc676 + lc_nextra));
  lua_pushcclosure(L, lcf1_force_uncomment1, 1);
  assert(lua_gettop(L) - lc_nextra == 46);
  lc_getupvalue(L, (lc676 + lc_nextra), 17, 25);
  lua_call(L, 0, 1);
  assert(lua_gettop(L) - lc_nextra == 47);
  lua_pushvalue(L, (lc676 + lc_nextra));
  lua_pushcclosure(L, lcf1_enviroment_set, 1);
  assert(lua_gettop(L) - lc_nextra == 48);
  lua_newtable(L);
  lc_setupvalue(L, (lc676 + lc_nextra), 17, 18);
  assert(lua_gettop(L) - lc_nextra == 48);
  lc_newclosuretable(L, (lc676 + lc_nextra));
  enum { lc696 = 49 };
  assert((lua_gettop(L) == (lc696 + lc_nextra)));
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf1_val2env, 1);
  lua_rawseti(L, (lc696 + lc_nextra), 172);
  assert(lua_gettop(L) - lc_nextra == 49);
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf1_make_builtin_p_func, 1);
  assert(lua_gettop(L) - lc_nextra == 50);
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf1_make_builtin_get_func, 1);
  assert(lua_gettop(L) - lc_nextra == 51);
  lua_createtable(L, 16, 0);
  lua_pushvalue(L, (50 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 55);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 93);
  lua_call(L, 2, 1);
  lua_rawseti(L, -2, 1);
  lua_createtable(L, 3, 0);
  lua_pushvalue(L, (34 + lc_nextra));
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 2);
  lua_rawseti(L, -2, 2);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 94);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, (51 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 57);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 93);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 92);
  lua_call(L, 3, 1);
  lua_rawseti(L, -2, 3);
  lua_pushvalue(L, (51 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 56);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 93);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 91);
  lua_call(L, 3, 1);
  lua_rawseti(L, -2, 4);
  lua_pushvalue(L, (50 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 50);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 95);
  lua_call(L, 2, 1);
  lua_rawseti(L, -2, 5);
  lua_createtable(L, 3, 0);
  lua_pushvalue(L, (35 + lc_nextra));
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 2);
  lua_rawseti(L, -2, 2);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 100);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 6);
  lua_pushvalue(L, (50 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 54);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 99);
  lua_call(L, 2, 1);
  lua_rawseti(L, -2, 7);
  lua_pushvalue(L, (51 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 53);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 99);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 98);
  lua_call(L, 3, 1);
  lua_rawseti(L, -2, 8);
  lua_pushvalue(L, (51 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 52);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 99);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 97);
  lua_call(L, 3, 1);
  lua_rawseti(L, -2, 9);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 49);
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 2);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf786, 1);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 10);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 48);
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 2);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf794, 1);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 11);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 47);
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 2);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf800, 1);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 12);
  lua_pushvalue(L, (50 + lc_nextra));
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 51);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 103);
  lua_call(L, 2, 1);
  lua_rawseti(L, -2, 13);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, (lc696 + lc_nextra), 6, 166);
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 1);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf808, 1);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 14);
  lua_createtable(L, 3, 0);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 46);
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 3);
  lua_rawseti(L, -2, 2);
  lua_pushvalue(L, (lc696 + lc_nextra));
  lua_pushcclosure(L, lcf824, 1);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 15);
  lua_createtable(L, 3, 0);
  lua_pushvalue(L, (37 + lc_nextra));
  lua_rawseti(L, -2, 1);
  lua_pushnumber(L, 2);
  lua_rawseti(L, -2, 2);
  lc_getupvalue(L, (lc696 + lc_nextra), 18, 108);
  lua_rawseti(L, -2, 3);
  lua_rawseti(L, -2, 16);
  lc_setupvalue(L, (lc696 + lc_nextra), 18, 11);
  assert(lua_gettop(L) - lc_nextra == 51);
  lc_newclosuretable(L, (lc696 + lc_nextra));
  enum { lc825 = 52 };
  assert((lua_gettop(L) == (lc825 + lc_nextra)));
  lua_pushvalue(L, (lc825 + lc_nextra));
  lua_pushcclosure(L, lcf1_jsbool_no_force_isomorphism_p, 1);
  lua_rawseti(L, (lc825 + lc_nextra), 180);
  assert(lua_gettop(L) - lc_nextra == 52);
  lc_newclosuretable(L, (lc825 + lc_nextra));
  enum { lc858 = 53 };
  assert((lua_gettop(L) == (lc858 + lc_nextra)));
  lua_pushvalue(L, (lc858 + lc_nextra));
  lua_pushcclosure(L, lcf1_complex_parse, 1);
  lua_rawseti(L, (lc858 + lc_nextra), 181);
  assert(lua_gettop(L) - lc_nextra == 53);
  lc_newclosuretable(L, (lc858 + lc_nextra));
  enum { lc1102 = 54 };
  assert((lua_gettop(L) == (lc1102 + lc_nextra)));
  lua_pushvalue(L, (lc1102 + lc_nextra));
  lua_pushcclosure(L, lcf1_complex_print, 1);
  lua_rawseti(L, (lc1102 + lc_nextra), 212);
  assert(lua_gettop(L) - lc_nextra == 54);
  lua_pushvalue(L, (lc1102 + lc_nextra));
  lua_pushcclosure(L, lcf1_machinetext_parse, 1);
  assert(lua_gettop(L) - lc_nextra == 55);
  lua_pushvalue(L, (lc1102 + lc_nextra));
  lua_pushcclosure(L, lcf1_machinetext_print, 1);
  assert(lua_gettop(L) - lc_nextra == 56);
  lc_newclosuretable(L, (lc1102 + lc_nextra));
  enum { lc1341 = 57 };
  assert((lua_gettop(L) == (lc1341 + lc_nextra)));
  lc_getupvalue(L, (lc1102 + lc_nextra), 10, 165);
  const int lc1342 = lua_gettop(L);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 100);
  const int lc1343 = lua_gettop(L);
  lc_getupvalue(L, (lc1102 + lc_nextra), 13, 162);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 100);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 100);
  const int lc1344 = lua_gettop(L);
  lua_pushvalue(L, (28 + lc_nextra));
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 100);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 100);
  const int lc1345 = lua_gettop(L);
  lc_getupvalue(L, (lc1102 + lc_nextra), 15, 160);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 100);
  const int lc1346 = lua_gettop(L);
  lua_pushvalue(L, (26 + lc_nextra));
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 100);
  lc_getupvalue(L, (lc1102 + lc_nextra), 16, 159);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 96);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1346), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1345), 1);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 96);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1344), 1);
  lc_getupvalue(L, (lc1102 + lc_nextra), 21, 96);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1343), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1342), 1);
  lua_rawseti(L, (lc1341 + lc_nextra), 224);
  assert(lua_gettop(L) - lc_nextra == 57);
  lc_newclosuretable(L, (lc1341 + lc_nextra));
  enum { lc1347 = 58 };
  assert((lua_gettop(L) == (lc1347 + lc_nextra)));
  lc_getupvalue(L, (lc1341 + lc_nextra), 11, 165);
  const int lc1348 = lua_gettop(L);
  lc_getupvalue(L, (lc1341 + lc_nextra), 22, 100);
  const int lc1349 = lua_gettop(L);
  lc_getupvalue(L, (lc1341 + lc_nextra), 14, 162);
  lc_getupvalue(L, (lc1341 + lc_nextra), 22, 100);
  lc_getupvalue(L, (lc1341 + lc_nextra), 22, 100);
  const int lc1350 = lua_gettop(L);
  lua_pushvalue(L, (28 + lc_nextra));
  lc_getupvalue(L, (lc1341 + lc_nextra), 22, 100);
  lua_pushvalue(L, (20 + lc_nextra));
  lc_getupvalue(L, (lc1341 + lc_nextra), 22, 96);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1350), 1);
  lc_getupvalue(L, (lc1341 + lc_nextra), 22, 96);
  lua_call(L, 2, LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1349), LUA_MULTRET);
  lua_call(L, (lua_gettop(L) - lc1348), 1);
  lua_rawseti(L, (lc1347 + lc_nextra), 225);
  assert(lua_gettop(L) - lc_nextra == 58);
  lua_pushvalue(L, (lc1347 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_effect_bind, 1);
  assert(lua_gettop(L) - lc_nextra == 59);
  lua_pushvalue(L, (lc1347 + lc_nextra));
  lua_pushcclosure(L, lcf1_new_effect_return, 1);
  assert(lua_gettop(L) - lc_nextra == 60);
  lc_newclosuretable(L, (lc1347 + lc_nextra));
  enum { lc1354 = 61 };
  assert((lua_gettop(L) == (lc1354 + lc_nextra)));
  lua_pushvalue(L, (lc1354 + lc_nextra));
  lua_pushcclosure(L, lcf1_run_monad_helper, 1);
  lua_rawseti(L, (lc1354 + lc_nextra), 226);
  assert(lua_gettop(L) - lc_nextra == 61);
  lua_pushvalue(L, (lc1354 + lc_nextra));
  lua_pushcclosure(L, lcf1_run_monad_trampoline, 1);
  assert(lua_gettop(L) - lc_nextra == 62);
  lua_pushvalue(L, (lc1354 + lc_nextra));
  lua_pushcclosure(L, lcf1_run_monad_stackoverflow, 1);
  assert(lua_gettop(L) - lc_nextra == 63);
  lua_newtable(L);
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 121);
  lua_pushliteral(L, "trampoline_return");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 120);
  lua_pushliteral(L, "trampoline_delay");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 23, 155);
  lua_pushliteral(L, "run_trampoline");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 108);
  lua_pushliteral(L, "new_comment");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 107);
  lua_pushliteral(L, "comment_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 106);
  lua_pushliteral(L, "comment_comment");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 105);
  lua_pushliteral(L, "comment_x");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 104);
  lua_pushliteral(L, "un_comment_all");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 22, 156);
  lua_pushliteral(L, "new_atom");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 103);
  lua_pushliteral(L, "atom_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 102);
  lua_pushliteral(L, "un_atom");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 101);
  lua_pushliteral(L, "atom_equal_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 100);
  lua_pushliteral(L, "new_construction");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 99);
  lua_pushliteral(L, "construction_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 98);
  lua_pushliteral(L, "construction_head");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 97);
  lua_pushliteral(L, "construction_tail");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 96);
  lua_pushliteral(L, "null_v");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 95);
  lua_pushliteral(L, "null_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 94);
  lua_pushliteral(L, "new_data");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 93);
  lua_pushliteral(L, "data_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 92);
  lua_pushliteral(L, "data_name");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 91);
  lua_pushliteral(L, "data_list");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 90);
  lua_pushliteral(L, "just_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 88);
  lua_pushliteral(L, "evaluate");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 75);
  lua_pushliteral(L, "apply");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 71);
  lua_pushliteral(L, "force_all_rec");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 21, 157);
  lua_pushliteral(L, "force_uncomment_all_rec");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 70);
  lua_pushliteral(L, "unlazy_all_rec");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 38);
  lua_pushliteral(L, "jsArray_to_list");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 8, 170);
  lua_pushliteral(L, "maybe_list_to_jsArray");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 37);
  lua_pushliteral(L, "new_list");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 36);
  lua_pushliteral(L, "un_just_all");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (42 + lc_nextra));
  lua_pushliteral(L, "un_just_comment_all");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 35);
  lua_pushliteral(L, "delay_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 34);
  lua_pushliteral(L, "delay_just_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 33);
  lua_pushliteral(L, "lazy_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (44 + lc_nextra));
  lua_pushliteral(L, "delay_env");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (45 + lc_nextra));
  lua_pushliteral(L, "delay_x");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 30);
  lua_pushliteral(L, "force_all");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 31);
  lua_pushliteral(L, "force1");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (46 + lc_nextra));
  lua_pushliteral(L, "force_uncomment1");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 29);
  lua_pushliteral(L, "force_uncomment_all");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 28);
  lua_pushliteral(L, "unlazy1");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 18);
  lua_pushliteral(L, "env_null_v");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 17);
  lua_pushliteral(L, "env_set");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 16);
  lua_pushliteral(L, "env_get");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 14);
  lua_pushliteral(L, "env2val");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 13);
  lua_pushliteral(L, "env_foreach");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 6, 172);
  lua_pushliteral(L, "val2env");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 4);
  lua_pushliteral(L, "equal_p");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 24, 3);
  lua_pushliteral(L, "simple_print");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 4, 181);
  lua_pushliteral(L, "complex_parse");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 3, 212);
  lua_pushliteral(L, "complex_print");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (55 + lc_nextra));
  lua_pushliteral(L, "machinetext_parse");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (56 + lc_nextra));
  lua_pushliteral(L, "machinetext_print");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 2, 224);
  lua_pushliteral(L, "return_effect_systemName");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lc_getupvalue(L, (lc1354 + lc_nextra), 1, 225);
  lua_pushliteral(L, "bind_effect_systemName");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (59 + lc_nextra));
  lua_pushliteral(L, "new_effect_bind");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (60 + lc_nextra));
  lua_pushliteral(L, "new_effect_return");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (62 + lc_nextra));
  lua_pushliteral(L, "run_monad_trampoline");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (63 + lc_nextra));
  lua_pushliteral(L, "run_monad_stackoverflow");
  lua_insert(L, -2);
  lua_settable(L, (64 + lc_nextra));
  assert(lua_gettop(L) - lc_nextra == 64);
  lua_pushvalue(L, (64 + lc_nextra));
  return 1;
  assert(lua_gettop(L) - lc_nextra == 64);
}
static int traceback(lua_State *L) {
  if (!lua_isstring(L, 1))
    return 1;
  lua_getglobal(L, "debug");
  if (!lua_istable(L, -1)) {
    lua_pop(L, 1);
    return 1;
  }
  lua_getfield(L, -1, "traceback");
  if (!lua_isfunction(L, -1)) {
    lua_pop(L, 2);
    return 1;
  }
  lua_pushvalue(L, 1);
  lua_pushinteger(L, 2);
  lua_call(L, 2, 1);
  return 1;
}
static void lc_l_message(const char *pname, const char *msg) {
  if (pname)
    fprintf(stderr, "%s: ", pname);
  fprintf(stderr, "%s\n", msg);
  fflush(stderr);
}
static int lc_report(lua_State *L, int status) {
  if (status && !lua_isnil(L, -1)) {
    const char *msg = lua_tostring(L, -1);
    if (msg == NULL)
      msg = "(error object is not a string)";
    lc_l_message("lua", msg);
    lua_pop(L, 1);
  }
  return status;
}
static int lc_docall(lua_State *L, int narg, int clear) {
  int status;
  int base = lua_gettop(L) - narg;
  lua_pushcfunction(L, traceback);
  lua_insert(L, base);
  status = lua_pcall(L, narg, (clear ? 0 : LUA_MULTRET), base);
  lua_remove(L, base);
  if (status != 0)
    lua_gc(L, LUA_GCCOLLECT, 0);
  return status;
}
static int lc_dofile(lua_State *L, const char *name) {
  int status = luaL_loadfile(L, name) || lc_docall(L, 0, 1);
  return lc_report(L, status);
}
static int lc_dostring(lua_State *L, const char *s, const char *name) {
  int status = luaL_loadbuffer(L, s, strlen(s), name) || lc_docall(L, 0, 1);
  return lc_report(L, status);
}
static int lc_handle_luainit(lua_State *L) {
  const char *init = getenv("LUA_INIT");
  if (init == NULL)
    return 0;
  else if (init[0] == '@')
    return lc_dofile(L, init + 1);
  else
    return lc_dostring(L, init,
                       "="
                       "LUA_INIT");
}
typedef struct {
  int c;
  const char **v;
} lc_args_t;
static void lc_createarg(lua_State *L, const lc_args_t *const args) {
  int i;
  lua_newtable(L);
  for (i = 0; i < args->c; i++) {
    lua_pushstring(L, args->v[i]);
    lua_rawseti(L, -2, i);
  }
  lua_setglobal(L, "arg");
}
int lc_pmain(lua_State *L) {
  luaL_openlibs(L);
  const lc_args_t *const args = (lc_args_t *)lua_touserdata(L, 1);
  lua_pushcfunction(L, traceback);
  const int status1 = lc_handle_luainit(L);
  if (status1 != 0)
    return 0;
  lua_newtable(L);
  lua_pushcclosure(L, lcf_main, 1);
  int i;
  int status2 = lua_pcall(L, 0, 0, -2);
  if (status2 != 0) {
    const char *msg = lua_tostring(L, -1);
    if (msg == NULL)
      msg = "(error object is not a string)";
    fputs(msg, stderr);
  }
  return 0;
}
int _lua2c_main(int argc, const char **argv) {
  lua_State *L = luaL_newstate();
  if (!L) {
    fputs("Failed creating Lua state.", stderr);
    exit(1);
  }
  lua_pushcfunction(L, &lc_pmain);
  lua_pushinteger(L, argc);
  lua_pushlightuserdata(L, argv);
  int status = lua_pcall(L, 2, 1, 0);
  if (status != 0) {
    fputs(lua_tostring(L, -1), stderr);
  }
  lua_close(L);
  return 0;
}
