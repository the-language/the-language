package lang;
public class Lang$luaj$1 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("error");
        k1 = org.luaj.vm2.LuaString.valueOf("TheLanguage PANIC");
    }
    
    public Lang$luaj$1() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        this.u0.get(k0).call(k1);
        return org.luaj.vm2.LuaValue.NONE;
    }
}
