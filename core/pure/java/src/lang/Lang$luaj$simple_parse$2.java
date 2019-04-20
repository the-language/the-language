package lang;
public class Lang$luaj$simple_parse$2 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue[] u2;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("sub");
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$simple_parse$2() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0;
        org.luaj.vm2.LuaValue a1 = this.u1[0];
        a0.call((org.luaj.vm2.LuaValue)((a1.get(k0).call(a1, this.u2[0].sub(k1).add(k1), this.u2[0].sub(k1).add(k1)).eq_b(a)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.LuaValue a2 = this.u2[0].sub(k1);
        this.u2[0] = a2;
        return org.luaj.vm2.LuaValue.NONE;
    }
}
