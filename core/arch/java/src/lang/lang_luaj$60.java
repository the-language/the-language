package lang;
public class lang_luaj$60 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    
    public lang_luaj$60() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0;
        org.luaj.vm2.LuaValue a2 = this.u1;
        org.luaj.vm2.Varargs a3 = this.u2.invoke(this.u3[0], (org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a4 = new org.luaj.vm2.LuaValue[1];
        a4[0] = a2;
        return org.luaj.vm2.LuaValue.tailcallOf(a1, org.luaj.vm2.LuaValue.varargsOf(a4, a3));
    }
}
