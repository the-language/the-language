package lang;
public class Lang$luaj$43 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
        k1 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$43() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0[0].call(a);
        if (this.u1.call(a0).toboolean()) {
            org.luaj.vm2.LuaValue a1 = a0.get(k0);
            org.luaj.vm2.LuaValue a2 = a0.get(k1);
            org.luaj.vm2.LuaValue a3 = this.u2[0].call(a1);
            a0.set(k0, a3);
            org.luaj.vm2.LuaValue a4 = this.u2[0].call(a2);
            a0.set(k1, a4);
            return a0;
        }
        if (this.u3.call(a0).toboolean()) {
            org.luaj.vm2.LuaValue a5 = a0.get(k0);
            org.luaj.vm2.LuaValue a6 = a0.get(k1);
            org.luaj.vm2.LuaValue a7 = this.u2[0].call(a5);
            a0.set(k0, a7);
            org.luaj.vm2.LuaValue a8 = this.u2[0].call(a6);
            a0.set(k1, a8);
            return a0;
        }
        if (!this.u4.call(a0).toboolean()) {
            return a0;
        }
        org.luaj.vm2.LuaValue a9 = a0.get(k0);
        org.luaj.vm2.LuaValue a10 = a0.get(k1);
        org.luaj.vm2.LuaValue a11 = this.u2[0].call(a9);
        a0.set(k0, a11);
        org.luaj.vm2.LuaValue a12 = this.u2[0].call(a10);
        a0.set(k1, a12);
        return a0;
    }
}
