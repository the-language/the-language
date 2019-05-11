package lang;
public class Lang$luaj$make_builtin_p_func$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    
    public Lang$luaj$make_builtin_p_func$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(3);
        org.luaj.vm2.LuaValue a1 = this.u0[0].call(a0);
        if (this.u1.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a2 = this.u2;
            org.luaj.vm2.LuaValue a3 = this.u3;
            org.luaj.vm2.LuaTable a4 = org.luaj.vm2.LuaValue.tableOf(1, 0);
            ((org.luaj.vm2.LuaValue)a4).rawset(1, a1);
            return org.luaj.vm2.LuaValue.tailcallOf(a2, org.luaj.vm2.LuaValue.varargsOf(a3, (org.luaj.vm2.Varargs)a4));
        }
        if (this.u4.call(a1).toboolean()) {
            org.luaj.vm2.Varargs a5 = this.u5;
            return a5;
        }
        org.luaj.vm2.Varargs a6 = this.u6;
        return a6;
    }
}
