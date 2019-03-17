package lang;
public class lang_luaj$77$2 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue[] u3;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("string");
        k1 = org.luaj.vm2.LuaString.valueOf("sub");
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$77$2() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        this.u0.call((org.luaj.vm2.LuaValue)((this.u1.get(k0).get(k1).call(this.u2[0], this.u3[0].sub(k2).add(k2), this.u3[0].sub(k2).add(k2)).eq_b(a)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.LuaValue a0 = this.u3[0].sub(k2);
        this.u3[0] = a0;
        return org.luaj.vm2.LuaValue.NONE;
    }
}
