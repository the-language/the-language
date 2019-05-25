package lang;
public class Lang$luaj$57 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue[] u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
    
    public Lang$luaj$57() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = null;
        org.luaj.vm2.LuaValue a1 = this.u0.call(a);
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        this.u1.call(this.u2.call(a1).not());
        if (this.u3.call(a1).toboolean()) {
            a0 = this.u4[0].call(this.u5.call(a1), this.u6.call(a1), a);
        } else if (this.u7.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a2 = this.u8[0];
            org.luaj.vm2.LuaValue a3 = this.u9.call(a1);
            org.luaj.vm2.LuaValue a4 = this.u10.call(a1);
            org.luaj.vm2.LuaValue a5 = this.u11.call(a1);
            org.luaj.vm2.LuaValue[] a6 = new org.luaj.vm2.LuaValue[4];
            a6[0] = a3;
            a6[1] = a4;
            a6[2] = a5;
            a6[3] = a;
            a0 = a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a6)).arg1();
        } else {
            a0 = (this.u12.call(a1).toboolean()) ? this.u13[0].call(this.u14.call(a1), this.u15.call(a1), a) : (this.u16.call(a1).toboolean()) ? this.u17[0].call(this.u18.call(a1), this.u19.call(a1), a) : a1;
        }
        org.luaj.vm2.LuaValue a7 = this.u0.call(a0);
        this.u20.call(a1, a7);
        return a7;
    }
}
