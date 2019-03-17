import org.luaj.vm2.*;
import org.luaj.vm2.lib.jse.*;

public class testtemp {
  private static Globals globals;
  private static LuaTable exports;
  private static boolean inited = false;
  private static void init() throws Exception {
    if (!inited) {
      globals = JsePlatform.standardGlobals();
      exports = (LuaTable)((LuaValue)(new lang$luaj()))
                    .call(LuaValue.valueOf("lang$luaj"), globals);
      inited = true;
    }
  }
  public static void main(String[] args) throws Exception {
    init();
    System.out.println("load as java class|" +
                       exports.get("complex_parse").toString());
  }
}
