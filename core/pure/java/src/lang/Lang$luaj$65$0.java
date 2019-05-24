package lang;
public class Lang$luaj$65$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    
    public Lang$luaj$65$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = this.u0;
        org.luaj.vm2.LuaValue a1 = this.u1[0];
        org.luaj.vm2.LuaValue a2 = this.u2;
        org.luaj.vm2.LuaValue a3 = this.u3[0];
        org.luaj.vm2.LuaValue a4 = this.u2;
        org.luaj.vm2.LuaValue a5 = this.u4[0];
        org.luaj.vm2.Varargs a6 = this.u2.invoke(this.u5.call(this.u6), (org.luaj.vm2.Varargs)this.u7);
        org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[1];
        a7[0] = a5;
        org.luaj.vm2.Varargs a8 = a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a7, a6));
        org.luaj.vm2.LuaValue[] a9 = new org.luaj.vm2.LuaValue[1];
        a9[0] = a3;
        org.luaj.vm2.Varargs a10 = a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a9, a8));
        org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[1];
        a11[0] = a1;
        return org.luaj.vm2.LuaValue.tailcallOf(a0, org.luaj.vm2.LuaValue.varargsOf(a11, a10));
    }
}
