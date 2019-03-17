import org.luaj.vm2.*;
import org.luaj.vm2.lib.jse.*;
import java.util.Vector;

public class testtemp {
  public static void main(String[] args) throws Exception {
    Globals globals = JsePlatform.standardGlobals();
    String libname = "lang$luaj";
    LuaValue slibname = LuaValue.valueOf(libname);
    LuaValue v = (LuaValue)(new lang$luaj());
    LuaValue exports = v.call(slibname, globals);
    System.out.println("load as java class");
  }
}
