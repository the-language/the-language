package lang;
public class Lang$luaj$50 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    
    public Lang$luaj$50() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0;
        org.luaj.vm2.LuaValue a3 = this.u1[0];
        org.luaj.vm2.LuaValue a4 = this.u2;
        org.luaj.vm2.Varargs a5 = this.u2.invoke(a1, (org.luaj.vm2.Varargs)this.u3[0]);
        org.luaj.vm2.LuaValue[] a6 = new org.luaj.vm2.LuaValue[1];
        a6[0] = a0;
        org.luaj.vm2.Varargs a7 = a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a6, a5));
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[1];
        a8[0] = a3;
        return org.luaj.vm2.LuaValue.tailcallOf(a2, org.luaj.vm2.LuaValue.varargsOf(a8, a7));
    }
}
