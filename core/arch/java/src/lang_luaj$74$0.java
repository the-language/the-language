public class lang_luaj$74$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    
    public lang_luaj$74$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u0[0];
        org.luaj.vm2.LuaValue a5 = a2.call(a0);
        org.luaj.vm2.Varargs a6 = a2.invoke((org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[1];
        a7[0] = a5;
        if (a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a7, a6)).arg1().toboolean()) {
            org.luaj.vm2.LuaValue a8 = this.u0[0];
            org.luaj.vm2.LuaValue a9 = a3.call(a0);
            org.luaj.vm2.Varargs a10 = a3.invoke((org.luaj.vm2.Varargs)a1);
            org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[1];
            a11[0] = a9;
            if (a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a11, a10)).arg1().toboolean()) {
                this.u1.call(a0, a1);
                return org.luaj.vm2.LuaValue.TRUE;
            }
        }
        return org.luaj.vm2.LuaValue.FALSE;
    }
}
