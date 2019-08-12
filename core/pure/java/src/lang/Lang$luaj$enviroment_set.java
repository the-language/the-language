package lang;
public class Lang$luaj$enviroment_set extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    
    public Lang$luaj$enviroment_set() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0.call();
        org.luaj.vm2.LuaValue a4 = this.u1;
        org.luaj.vm2.LuaValue a5 = this.u2[0];
        org.luaj.vm2.LuaTable a6 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a6).rawset(1, a1);
        org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[5];
        a7[0] = a0;
        a7[1] = a6;
        a7[2] = a2;
        a7[3] = a3;
        a7[4] = a3;
        return org.luaj.vm2.LuaValue.tailcallOf(a4, a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a7)).subargs(1));
    }
}
