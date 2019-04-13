package lang;
public class lang_luaj$63 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    
    public lang_luaj$63() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0;
        org.luaj.vm2.LuaValue a2 = this.u1;
        org.luaj.vm2.LuaValue a3 = this.u2;
        org.luaj.vm2.LuaValue a4 = this.u3[0];
        org.luaj.vm2.LuaValue a5 = this.u1;
        org.luaj.vm2.LuaValue a6 = this.u4;
        org.luaj.vm2.Varargs a7 = this.u1.invoke(this.u2, a0, (org.luaj.vm2.Varargs)this.u5);
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[1];
        a8[0] = a6;
        org.luaj.vm2.Varargs a9 = a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a8, a7));
        org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[2];
        a10[0] = a3;
        a10[1] = a4;
        return org.luaj.vm2.LuaValue.tailcallOf(a1, a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9)).subargs(1));
    }
}
