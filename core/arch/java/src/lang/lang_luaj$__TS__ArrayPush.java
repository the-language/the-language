package lang;
public class lang_luaj$__TS__ArrayPush extends org.luaj.vm2.lib.TwoArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$__TS__ArrayPush() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        a.set(a.len().add(k0), a0);
        return a.len();
    }
}
