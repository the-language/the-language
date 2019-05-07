package lang;
public class Lang$luaj$v extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    
    public Lang$luaj$v() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0;
        org.luaj.vm2.LuaValue a2 = this.u1;
        org.luaj.vm2.LuaValue a3 = this.u2;
        org.luaj.vm2.LuaValue a4 = this.u3[0];
        org.luaj.vm2.Varargs a5 = this.u2.invoke(a0, (org.luaj.vm2.Varargs)this.u4[0]);
        org.luaj.vm2.LuaValue[] a6 = new org.luaj.vm2.LuaValue[1];
        a6[0] = a4;
        org.luaj.vm2.Varargs a7 = a3.invoke(org.luaj.vm2.LuaValue.varargsOf(a6, a5));
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[1];
        a8[0] = a2;
        return org.luaj.vm2.LuaValue.tailcallOf(a1, org.luaj.vm2.LuaValue.varargsOf(a8, a7));
    }
}
