package lang;
public class Lang$luaj$j extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$j() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0;
        org.luaj.vm2.LuaValue a3 = this.u1;
        org.luaj.vm2.Varargs a4 = this.u2.invoke(a0, (org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a5 = new org.luaj.vm2.LuaValue[1];
        a5[0] = a3;
        return org.luaj.vm2.LuaValue.tailcallOf(a2, org.luaj.vm2.LuaValue.varargsOf(a5, a4));
    }
}
