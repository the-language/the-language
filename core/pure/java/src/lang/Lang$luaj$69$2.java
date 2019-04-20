package lang;
public class Lang$luaj$69$2 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    
    public Lang$luaj$69$2() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u0;
        org.luaj.vm2.LuaValue a5 = this.u1;
        org.luaj.vm2.LuaValue a6 = this.u2[0];
        org.luaj.vm2.LuaTable a7 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        org.luaj.vm2.LuaValue a8 = a2.call(a0);
        org.luaj.vm2.Varargs a9 = a2.invoke((org.luaj.vm2.Varargs)a1);
        ((org.luaj.vm2.LuaValue)a7).rawset(1, a8);
        ((org.luaj.vm2.LuaValue)a7).rawsetlist(2, a9);
        org.luaj.vm2.LuaValue a10 = a5.call(a6, (org.luaj.vm2.LuaValue)a7);
        org.luaj.vm2.LuaValue a11 = this.u1;
        org.luaj.vm2.LuaValue a12 = this.u2[0];
        org.luaj.vm2.LuaTable a13 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        org.luaj.vm2.LuaValue a14 = a3.call(a0);
        org.luaj.vm2.Varargs a15 = a3.invoke((org.luaj.vm2.Varargs)a1);
        ((org.luaj.vm2.LuaValue)a13).rawset(1, a14);
        ((org.luaj.vm2.LuaValue)a13).rawsetlist(2, a15);
        org.luaj.vm2.Varargs a16 = a11.invoke(a12, (org.luaj.vm2.Varargs)a13);
        org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[1];
        a17[0] = a10;
        return org.luaj.vm2.LuaValue.tailcallOf(a4, org.luaj.vm2.LuaValue.varargsOf(a17, a16));
    }
}
