/*
** $Id: lstrlib.c,v 1.132.1.5 2010/05/14 15:34:19 roberto Exp $
** Standard library for string operations and pattern-matching
** See Copyright Notice in lua.h
*/


#include <ctype.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define lstrlib_c
#define LUA_LIB

#include "lua.h"

#include "lauxlib.h"
#include "lualib.h"


/* macro to `unsign' a character */
#define uchar(c)        ((unsigned char)(c))



static int str_len (lua_State *L) {
  size_t l;
  luaL_checklstring(L, 1, &l);
  lua_pushinteger(L, l);
  return 1;
}


static ptrdiff_t posrelat (ptrdiff_t pos, size_t len) {
  /* relative string position: negative means back from end */
  if (pos < 0) pos += (ptrdiff_t)len + 1;
  return (pos >= 0) ? pos : 0;
}


static int str_sub (lua_State *L) {
  size_t l;
  const char *s = luaL_checklstring(L, 1, &l);
  ptrdiff_t start = posrelat(luaL_checkinteger(L, 2), l);
  ptrdiff_t end = posrelat(luaL_optinteger(L, 3, -1), l);
  if (start < 1) start = 1;
  if (end > (ptrdiff_t)l) end = (ptrdiff_t)l;
  if (start <= end)
    lua_pushlstring(L, s+start-1, end-start+1);
  else lua_pushliteral(L, "");
  return 1;
}


static int str_byte (lua_State *L) {
  size_t l;
  const char *s = luaL_checklstring(L, 1, &l);
  ptrdiff_t posi = posrelat(luaL_optinteger(L, 2, 1), l);
  ptrdiff_t pose = posrelat(luaL_optinteger(L, 3, posi), l);
  int n, i;
  if (posi <= 0) posi = 1;
  if ((size_t)pose > l) pose = l;
  if (posi > pose) return 0;  /* empty interval; return no values */
  n = (int)(pose -  posi + 1);
  if (posi + n <= pose)  /* overflow? */
    luaL_error(L, "string slice too long");
  luaL_checkstack(L, n, "string slice too long");
  for (i=0; i<n; i++)
    lua_pushinteger(L, uchar(s[posi+i-1]));
  return n;
}



static const luaL_Reg strlib[] = {
  {"byte", str_byte},
  {"len", str_len},
  {"sub", str_sub},
  {NULL, NULL}
};


static void createmetatable (lua_State *L) {
  lua_createtable(L, 0, 1);  /* create metatable for strings */
  lua_pushliteral(L, "");  /* dummy string */
  lua_pushvalue(L, -2);
  lua_setmetatable(L, -2);  /* set string metatable */
  lua_pop(L, 1);  /* pop dummy string */
  lua_pushvalue(L, -2);  /* string library... */
  lua_setfield(L, -2, "__index");  /* ...is the __index metamethod */
  lua_pop(L, 1);  /* pop metatable */
}


/*
** Open string library
*/
LUALIB_API int luaopen_string (lua_State *L) {
  luaL_register(L, LUA_STRLIBNAME, strlib);
  createmetatable(L);
  return 1;
}
