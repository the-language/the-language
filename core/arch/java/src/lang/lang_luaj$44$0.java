package lang;
public class lang_luaj$44$0 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$44$0() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        this.u0[0].set(k0, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
        this.u1.call(this.u2[0], this.u3[0]);
        org.luaj.vm2.LuaValue a = k1;
        while(a.lt_b(this.u4.len())) {
            org.luaj.vm2.LuaValue a0 = this.u1;
            org.luaj.vm2.LuaValue a1 = a.add(k2);
            a0.call(this.u4.get(a1), this.u3[0]);
            a = a.add(k2);
        }
        return this.u3[0];
    }
}
