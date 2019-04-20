package lang;
public class Lang$luaj$45 extends org.luaj.vm2.lib.OneArgFunction {
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
    
    public Lang$luaj$45() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = null;
        org.luaj.vm2.LuaValue a1 = this.u0.call(a);
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        this.u1.call(this.u2.call(a1).not());
        if (this.u3.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a2 = this.u4[0];
            org.luaj.vm2.LuaValue a3 = this.u5.call(a1);
            org.luaj.vm2.Varargs a4 = this.u6.invoke((org.luaj.vm2.Varargs)a1);
            org.luaj.vm2.LuaValue[] a5 = new org.luaj.vm2.LuaValue[1];
            a5[0] = a3;
            a0 = a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a5, a4)).arg1();
        } else if (this.u7.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a6 = this.u8[0];
            org.luaj.vm2.LuaValue a7 = this.u9.call(a1);
            org.luaj.vm2.LuaValue a8 = this.u10.call(a1);
            org.luaj.vm2.Varargs a9 = this.u11.invoke((org.luaj.vm2.Varargs)a1);
            org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[2];
            a10[0] = a7;
            a10[1] = a8;
            a0 = a6.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9)).arg1();
        } else if (this.u12.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a11 = this.u13[0];
            org.luaj.vm2.LuaValue a12 = this.u14.call(a1);
            org.luaj.vm2.Varargs a13 = this.u15.invoke((org.luaj.vm2.Varargs)a1);
            org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[1];
            a14[0] = a12;
            a0 = a11.invoke(org.luaj.vm2.LuaValue.varargsOf(a14, a13)).arg1();
        } else if (this.u16.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a15 = this.u17[0];
            org.luaj.vm2.LuaValue a16 = this.u18.call(a1);
            org.luaj.vm2.Varargs a17 = this.u19.invoke((org.luaj.vm2.Varargs)a1);
            org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[1];
            a18[0] = a16;
            a0 = a15.invoke(org.luaj.vm2.LuaValue.varargsOf(a18, a17)).arg1();
        } else {
            a0 = a1;
        }
        org.luaj.vm2.LuaValue a19 = this.u0.call(a0);
        this.u20.call(a1, a19);
        return a19;
    }
}
