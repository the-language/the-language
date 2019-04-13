package lang;
public class lang_luaj$42 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$42() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        while(this.u0.call(a).toboolean()) {
            this.u1.call((org.luaj.vm2.LuaValue)a0, a);
            a = this.u2.call(a);
        }
        org.luaj.vm2.LuaValue a1 = k0;
        while(a1.lt_b(((org.luaj.vm2.LuaValue)a0).len())) {
            this.u3.call(((org.luaj.vm2.LuaValue)a0).get(a1.add(k1)), a);
            a1 = a1.add(k1);
        }
        return a;
    }
}
