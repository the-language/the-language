package lang;
public class Lang$luaj$44 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
    }
    
    public Lang$luaj$44() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0[0];
        org.luaj.vm2.LuaValue a1 = a.len().sub(k0);
        while(k1.lteq_b(a1)) {
            a0 = this.u1.call(a.get(a1.add(k0)), a0);
            a1 = a1.sub(k0);
        }
        return a0;
    }
}
