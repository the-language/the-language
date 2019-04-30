package lang;
public class Lang$luaj$34 extends org.luaj.vm2.lib.OneArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$34() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        return a.get(k0);
    }
}
