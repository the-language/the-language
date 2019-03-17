public class lang_luaj$68$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    
    public lang_luaj$68$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0[0].call(a0);
        if (this.u1.call(a2).toboolean()) {
            org.luaj.vm2.LuaValue a3 = this.u2;
            org.luaj.vm2.LuaValue a4 = this.u3;
            org.luaj.vm2.LuaTable a5 = org.luaj.vm2.LuaValue.tableOf(1, 0);
            ((org.luaj.vm2.LuaValue)a5).rawset(1, a2);
            return org.luaj.vm2.LuaValue.tailcallOf(a3, org.luaj.vm2.LuaValue.varargsOf(a4, (org.luaj.vm2.Varargs)a5));
        }
        if (!this.u4.call(a2).toboolean()) {
            org.luaj.vm2.Varargs a6 = a1;
            return a6;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u5, (org.luaj.vm2.Varargs)a2);
    }
}
