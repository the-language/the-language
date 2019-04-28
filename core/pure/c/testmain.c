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
#include "stdio.h"
#include "stdlib.h"
int main(void) {
  lang_state *L = lang_state_new_orNULL();
  assert(L);
  lang_value *x = lang_complex_parse_orNULL(L, ":&>化滅");
  assert(x);
  char *s = lang_simple_print_retMalloc_orNULL(L, x);
  lang_value_delete(L, x);
  assert(s);
  puts(s);
  free(s);
  return 0;
}
