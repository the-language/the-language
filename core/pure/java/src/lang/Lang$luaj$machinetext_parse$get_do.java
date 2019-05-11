package lang;
public class Lang$luaj$machinetext_parse$get_do extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("string");
        k1 = org.luaj.vm2.LuaString.valueOf("sub");
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$machinetext_parse$get_do() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaValue a = this.u0;
        org.luaj.vm2.LuaValue a0 = this.u1.len();
        a.call((org.luaj.vm2.LuaValue)((this.u2[0].lt_b(a0)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.LuaValue a1 = this.u3.get(k0).get(k1).call(this.u1, this.u2[0].add(k2), this.u2[0].add(k2));
        org.luaj.vm2.LuaValue a2 = this.u2[0].add(k2);
        this.u2[0] = a2;
        return a1;
    }
}
