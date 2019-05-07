package lang;
public class Lang$luaj$w$4 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    
    public Lang$luaj$w$4() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0;
        org.luaj.vm2.LuaValue a3 = this.u1[0];
        org.luaj.vm2.LuaValue a4 = this.u2;
        org.luaj.vm2.LuaValue a5 = this.u3[0];
        org.luaj.vm2.LuaValue a6 = this.u4[0];
        org.luaj.vm2.LuaValue a7 = this.u5.call(a0);
        org.luaj.vm2.Varargs a8 = this.u5.invoke((org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a9 = new org.luaj.vm2.LuaValue[3];
        a9[0] = a5;
        a9[1] = a6;
        a9[2] = a7;
        org.luaj.vm2.Varargs a10 = a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a9, a8));
        org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[1];
        a11[0] = a3;
        return org.luaj.vm2.LuaValue.tailcallOf(a2, org.luaj.vm2.LuaValue.varargsOf(a11, a10));
    }
}
