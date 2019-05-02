package lang;
public class Lang$luaj$40 extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
        k2 = org.luaj.vm2.LuaValue.valueOf(3);
        k3 = org.luaj.vm2.LuaValue.valueOf(4);
        k4 = org.luaj.vm2.LuaValue.valueOf(5);
    }
    
    public Lang$luaj$40() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        if (a.eq_b(a0)) {
            return org.luaj.vm2.LuaValue.NONE;
        }
        org.luaj.vm2.LuaValue a1 = this.u0[0];
        a.set(k0, a1);
        org.luaj.vm2.LuaValue a2 = this.u1[0];
        a.set(k1, a2);
        a.set(k2, a0);
        a.set(k3, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
        a.set(k4, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
        return org.luaj.vm2.LuaValue.NONE;
    }
}
