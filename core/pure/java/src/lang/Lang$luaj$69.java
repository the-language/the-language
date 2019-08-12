package lang;
public class Lang$luaj$69 extends org.luaj.vm2.lib.ThreeArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$69() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0, org.luaj.vm2.LuaValue a1) {
        org.luaj.vm2.LuaValue a2 = k0;
        while(a2.lt_b(a.len())) {
            if (this.u0[0].call(a.get(a2.add(k0).add(k1)), a0).toboolean()) {
                return a.get(a2.add(k1).add(k1));
            }
            a2 = a2.add(k2);
        }
        return a1;
    }
}
