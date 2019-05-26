package lang;
public class Lang$luaj$force_uncomment_all_rec$conslike extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
        k1 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$force_uncomment_all_rec$conslike() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0[0].call(a.get(k0));
        a.set(k0, a0);
        org.luaj.vm2.LuaValue a1 = this.u0[0].call(a.get(k1));
        a.set(k1, a1);
        if (!this.u1.call(a.get(k0)).toboolean() && !this.u1.call(a.get(k1)).toboolean()) {
            return a;
        }
        org.luaj.vm2.LuaValue a2 = this.u2.call(a);
        org.luaj.vm2.LuaValue a3 = a.get(k0);
        org.luaj.vm2.LuaValue a4 = a.get(k1);
        org.luaj.vm2.LuaValue a5 = this.u3.call(a3);
        org.luaj.vm2.LuaValue a6 = this.u3.call(a4);
        a2.set(k0, a5);
        a2.set(k1, a6);
        return a2;
    }
}
