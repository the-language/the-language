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
#include "assert.h"
#include "lang.h"
#include "lauxlib.h"
#include "lua.h"
#include "lualib.h"
#include "stdio.h"
#include "stdlib.h"
int main(void) {
  lang_state *L = state_new();
  assert(L);
  lua_getglobal(L->L, "L");
  const char *s = lua_istable(L->L, -1) ? "T" : "F";
  lua_remove(L->L, -1);
  lua_getglobal(L->L, "print");
  lua_pushstring(L->L, s);
  lua_call(L->L, 1, 0);
  state_delete(L);
  return 0;
}