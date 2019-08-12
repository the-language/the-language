package lang;
public class Lang$luaj$78$error_v extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    
    public Lang$luaj$78$error_v() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = this.u0;
        org.luaj.vm2.LuaValue a1 = this.u1[0];
        org.luaj.vm2.LuaValue a2 = this.u2;
        org.luaj.vm2.LuaValue a3 = this.u3[0];
        org.luaj.vm2.LuaValue a4 = this.u2;
        org.luaj.vm2.LuaValue a5 = this.u4.call(this.u5);
        org.luaj.vm2.LuaValue a6 = this.u6;
        org.luaj.vm2.Varargs a7 = this.u7.invoke((org.luaj.vm2.Varargs)this.u8);
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[2];
        a8[0] = a5;
        a8[1] = a6;
        org.luaj.vm2.Varargs a9 = a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a8, a7));
        org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[1];
        a10[0] = a3;
        org.luaj.vm2.Varargs a11 = a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a1;
        return org.luaj.vm2.LuaValue.tailcallOf(a0, org.luaj.vm2.LuaValue.varargsOf(a12, a11));
    }
}
