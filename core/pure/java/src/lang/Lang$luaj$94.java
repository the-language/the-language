package lang;
public class Lang$luaj$94 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    
    public Lang$luaj$94() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u0[0].call(a0);
        if (this.u1.call(a4).toboolean()) {
            org.luaj.vm2.LuaValue a5 = this.u2;
            org.luaj.vm2.LuaValue a6 = this.u3[0];
            org.luaj.vm2.LuaTable a7 = org.luaj.vm2.LuaValue.tableOf(3, 0);
            ((org.luaj.vm2.LuaValue)a7).rawset(1, a4);
            ((org.luaj.vm2.LuaValue)a7).rawset(2, a1);
            ((org.luaj.vm2.LuaValue)a7).rawset(3, a2);
            return org.luaj.vm2.LuaValue.tailcallOf(a5, org.luaj.vm2.LuaValue.varargsOf(a6, (org.luaj.vm2.Varargs)a7));
        }
        if (!this.u4.call(a4).toboolean()) {
            org.luaj.vm2.Varargs a8 = a3;
            return a8;
        }
        org.luaj.vm2.LuaValue a9 = this.u5[0].invoke(this.u6.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).arg1();
        if (!this.u7.call(a9).toboolean()) {
            org.luaj.vm2.Varargs a10 = a3;
            return a10;
        }
        if (this.u8.call(a9, this.u9).toboolean()) {
            org.luaj.vm2.Varargs a11 = a1;
            return a11;
        }
        if (this.u8.call(a9, this.u10).toboolean()) {
            org.luaj.vm2.Varargs a12 = a2;
            return a12;
        }
        org.luaj.vm2.Varargs a13 = a3;
        return a13;
    }
}
