import org.luaj.vm2.*;
import org.luaj.vm2.lib.jse.*;
import java.util.Vector;

public class testtemp {

  private static Globals globals;
  private static boolean print = false;
  private static String encoding = null;

  public static void main(String[] args) throws Exception {

    // process args
    boolean interactive = (args.length == 0);
    boolean versioninfo = false;
    boolean processing = true;
    boolean nodebug = false;
    boolean luajc = false;
    Vector libs = null;

    // new lua state
    globals = JsePlatform.standardGlobals();
    String libname = "lang$luaj";
    LuaValue slibname = LuaValue.valueOf(libname);
    // load as java class
    LuaValue v = (LuaValue)Class.forName(libname).newInstance();
    v.call(slibname, globals);
    System.out.println("load as java class");
  }
}
