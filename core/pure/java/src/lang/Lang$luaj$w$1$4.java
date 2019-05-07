package lang;
public class Lang$luaj$w$1$4 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    
    public Lang$luaj$w$1$4() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = this.u0;
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2;
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4;
        org.luaj.vm2.LuaValue a5 = this.u5;
        org.luaj.vm2.LuaValue a6 = this.u6[0];
        org.luaj.vm2.LuaValue a7 = this.u7;
        org.luaj.vm2.LuaValue a8 = this.u7.call(this.u8);
        org.luaj.vm2.LuaValue a9 = this.u9;
        org.luaj.vm2.LuaValue a10 = this.u7.call(this.u10.call(this.u11), this.u8);
        org.luaj.vm2.Varargs a11 = this.u10.invoke((org.luaj.vm2.Varargs)this.u12);
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a10;
        org.luaj.vm2.Varargs a13 = a9.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[1];
        a14[0] = a8;
        org.luaj.vm2.Varargs a15 = a7.invoke(org.luaj.vm2.LuaValue.varargsOf(a14, a13));
        org.luaj.vm2.LuaValue[] a16 = new org.luaj.vm2.LuaValue[1];
        a16[0] = a6;
        org.luaj.vm2.Varargs a17 = a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a16, a15));
        org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[4];
        a18[0] = a1;
        a18[1] = a2;
        a18[2] = a3;
        a18[3] = a4;
        return org.luaj.vm2.LuaValue.tailcallOf(a0, org.luaj.vm2.LuaValue.varargsOf(a18, a17));
    }
}
