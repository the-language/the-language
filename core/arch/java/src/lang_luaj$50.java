public class lang_luaj$50 extends org.luaj.vm2.lib.TwoArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public lang_luaj$50() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        org.luaj.vm2.LuaValue a1 = k0;
        while(a1.lt_b(a.len())) {
            a0.call(a.get(a1.add(k0).add(k1)), a.get(a1.add(k1).add(k1)));
            a1 = a1.add(k2);
        }
        return org.luaj.vm2.LuaValue.NONE;
    }
}
