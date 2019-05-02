package lang;
public class Lang$luaj$76$H_if extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$76$H_if() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0;
        org.luaj.vm2.LuaValue a4 = this.u1[0];
        org.luaj.vm2.LuaTable a5 = org.luaj.vm2.LuaValue.tableOf(3, 0);
        ((org.luaj.vm2.LuaValue)a5).rawset(1, a0);
        ((org.luaj.vm2.LuaValue)a5).rawset(2, a1);
        ((org.luaj.vm2.LuaValue)a5).rawset(3, a2);
        return org.luaj.vm2.LuaValue.tailcallOf(a3, org.luaj.vm2.LuaValue.varargsOf(a4, (org.luaj.vm2.Varargs)a5));
    }
}
