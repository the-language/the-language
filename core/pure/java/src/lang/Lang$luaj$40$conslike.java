package lang;
public class Lang$luaj$40$conslike extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
        k1 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$40$conslike() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0[0].call(a.get(k0));
        a.set(k0, a0);
        org.luaj.vm2.LuaValue a1 = this.u0[0].call(a.get(k1));
        a.set(k1, a1);
        return a;
    }
}
