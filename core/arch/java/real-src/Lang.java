/*
    The Language
    Copyright (C) 2018, 2019  Zaoqi <zaomir@outlook.com>

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
import org.luaj.vm2.lib.jse.JsePlatform;
import org.luaj.vm2.LuaValue;
import org.luaj.vm2.LuaTable;
import org.luaj.vm2.Globals;
import org.luaj.vm2.LuaString;
public final class Lang {
  private static Globals globals;
  private static LuaTable exports;
  private static boolean inited = false;
  private static LuaValue complex_parse;
  private static LuaValue complex_print;
  private static LuaValue simple_parse;
  private static LuaValue simple_print;
  private static void init() throws Exception {
    if (!inited) {
      globals = JsePlatform.standardGlobals();
      exports = (LuaTable)((LuaValue)(new lang_luaj()))
                    .call(LuaValue.valueOf("lang_luaj"), globals);
      complex_parse = exports.get("complex_parse");
      complex_print = exports.get("complex_print");
      simple_parse = exports.get("simple_parse");
      simple_print = exports.get("simple_print");
      inited = true;
    }
  }
  public static LangValue complex_parse(String source) throws Exception {
    init();
    return new LangValue(complex_parse.call(LuaString.valueOf(source)));
  }
  public static String complex_print(LangValue value) throws Exception {
    init();
    return ((LuaString)complex_print.call(value.luavalue)).tojstring();
  }
  public static LangValue simple_parse(String source) throws Exception {
    init();
    return new LangValue(simple_parse.call(LuaString.valueOf(source)));
  }
  public static String simple_print(LangValue value) throws Exception {
    init();
    return ((LuaString)simple_print.call(value.luavalue)).tojstring();
  }
}
