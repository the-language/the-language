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
package lang;

import org.luaj.vm2.lib.BaseLib;
import org.luaj.vm2.lib.Bit32Lib;
import org.luaj.vm2.lib.CoroutineLib;
import org.luaj.vm2.lib.DebugLib;
import org.luaj.vm2.lib.MathLib;
import org.luaj.vm2.lib.OsLib;
import org.luaj.vm2.lib.PackageLib;
import org.luaj.vm2.lib.ResourceFinder;
import org.luaj.vm2.lib.StringLib;
import org.luaj.vm2.lib.TableLib;
import org.luaj.vm2.LuaValue;
import org.luaj.vm2.LuaTable;
import org.luaj.vm2.Globals;
import org.luaj.vm2.LuaString;
import org.luaj.vm2.compiler.LuaC;
import org.luaj.vm2.LoadState;
public final class Lang {
  private static Globals globals;
  private static LuaTable exports;
  private static boolean inited = false;
  private static LuaValue complex_parse;
  private static LuaValue complex_print;
  private static LuaValue simple_parse;
  private static LuaValue simple_print;
  private static LuaValue force1;
  private static LuaValue force_all;
  private static LuaValue force_all_rec;
  private static void init() throws Exception {
    if (!inited) {
      globals = new Globals();
      globals.load(new BaseLib());
      globals.load(new PackageLib());
      globals.load(new Bit32Lib());
      globals.load(new OsLib());
      globals.load(new MathLib());
      globals.load(new TableLib());
      globals.load(new StringLib());
      globals.load(new CoroutineLib());
      LoadState.install(globals);
      LuaC.install(globals);
      exports = (LuaTable)((LuaValue)(new lang_luaj()))
                    .call(LuaValue.valueOf("lang_luaj"), globals);
      complex_parse = exports.get("complex_parse");
      complex_print = exports.get("complex_print");
      simple_parse = exports.get("simple_parse");
      simple_print = exports.get("simple_print");
      force1 = exports.get("force1");
      force_all = exports.get("force_all");
      force_all_rec = exports.get("force_all_rec");
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
  public static LangValue force1(LangValue value) throws Exception {
    init();
    return new LangValue(force1.call(value.luavalue));
  }
  public static LangValue force_all(LangValue value) throws Exception {
    init();
    return new LangValue(force_all.call(value.luavalue));
  }
  public static LangValue force_all_rec(LangValue value) throws Exception {
    init();
    return new LangValue(force_all_rec.call(value.luavalue));
  }
}
