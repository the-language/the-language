public class lang_luaj$44$1 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$44$1() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        this.u0.call(this.u1[0], a);
        org.luaj.vm2.LuaValue a0 = k0;
        while(a0.lt_b(this.u2.len())) {
            org.luaj.vm2.LuaValue a1 = this.u0;
            org.luaj.vm2.LuaValue a2 = a0.add(k1);
            a1.call(this.u2.get(a2), a);
            a0 = a0.add(k1);
        }
        if (this.u3.call(a).toboolean()) {
            org.luaj.vm2.LuaValue a3 = this.u4[0].call(a);
            this.u0.call(this.u1[0], a3);
            org.luaj.vm2.LuaValue a4 = k0;
            while(a4.lt_b(this.u2.len())) {
                org.luaj.vm2.LuaValue a5 = this.u0;
                org.luaj.vm2.LuaValue a6 = a4.add(k1);
                a5.call(this.u2.get(a6), a3);
                a4 = a4.add(k1);
            }
            a = a3;
        }
        return a;
    }
}
