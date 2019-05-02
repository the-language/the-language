package lang;
public class Lang$luaj$39$conslike extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(3);
        k1 = org.luaj.vm2.LuaValue.valueOf(4);
    }
    
    public Lang$luaj$39$conslike() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = a.get(k0);
        org.luaj.vm2.LuaValue a1 = a.get(k1);
        org.luaj.vm2.LuaValue a2 = this.u0[0].call(a0);
        a.set(k0, a2);
        org.luaj.vm2.LuaValue a3 = this.u0[0].call(a1);
        a.set(k1, a3);
        return a;
    }
}
