package lang;
public class lang_luaj$46 extends org.luaj.vm2.lib.ThreeArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public lang_luaj$46() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0, org.luaj.vm2.LuaValue a1) {
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a3 = k0;
        while(a3.lt_b(a.len())) {
            if (this.u0[0].call(a.get(a3.add(k0).add(k1)), a0).toboolean()) {
                ((org.luaj.vm2.LuaValue)a2).set(a3.add(k0).add(k1), a0);
                ((org.luaj.vm2.LuaValue)a2).set(a3.add(k1).add(k1), a1);
                org.luaj.vm2.LuaValue a4 = a3.add(k2);
                while(a4.lt_b(a.len())) {
                    ((org.luaj.vm2.LuaValue)a2).set(a4.add(k0).add(k1), a.get(a4.add(k0).add(k1)));
                    ((org.luaj.vm2.LuaValue)a2).set(a4.add(k1).add(k1), a.get(a4.add(k1).add(k1)));
                    a4 = a4.add(k2);
                }
                return a2;
            } else {
                ((org.luaj.vm2.LuaValue)a2).set(a3.add(k0).add(k1), a.get(a3.add(k0).add(k1)));
                ((org.luaj.vm2.LuaValue)a2).set(a3.add(k1).add(k1), a.get(a3.add(k1).add(k1)));
                a3 = a3.add(k2);
            }
        }
        ((org.luaj.vm2.LuaValue)a2).set(a.len().add(k0).add(k1), a0);
        ((org.luaj.vm2.LuaValue)a2).set(a.len().add(k1).add(k1), a1);
        return a2;
    }
}
