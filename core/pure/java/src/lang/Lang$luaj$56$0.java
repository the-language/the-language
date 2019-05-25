package lang;
public class Lang$luaj$56$0 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue[] u2;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$56$0() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        this.u0.call(this.u1[0], a);
        org.luaj.vm2.LuaValue a0 = k0;
        while(a0.lt_b(this.u2[0].len())) {
            org.luaj.vm2.LuaValue a1 = this.u0;
            org.luaj.vm2.LuaValue a2 = a0.add(k1);
            a1.call(this.u2[0].get(a2), a);
            a0 = a0.add(k1);
        }
        return a;
    }
}
