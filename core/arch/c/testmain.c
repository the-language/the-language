/*
    The Language
    Copyright (C) 2019  Zaoqi <zaomir@outlook.com>

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
#include "lauxlib.h"
#include "lua.h"
#include "lualib.h"
#include "stdio.h"
int luaopen_lang(lua_State *L);
lua_State *L = NULL;
void init(void) {
  if (NULL == L) {
    L = luaL_newstate();
    luaL_openlibs(L);
    luaopen_lang(L);
    lua_setglobal(L, "L");
  }
}
void close(void) {
  if (NULL != L) {
    lua_close(L);
    L = NULL;
  }
}
int main(void) {
  init();
  lua_getglobal(L, "L");
  const char *s = lua_istable(L, -1) ? "T" : "F";
  lua_remove(L, -1);
  lua_getglobal(L, "print");
  lua_pushstring(L, s);
  lua_call(L, 1, 0);
  close();
  return 0;
}
