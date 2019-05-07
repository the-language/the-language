package lang;
public class Lang$luaj$w$1$6$0$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    
    public Lang$luaj$w$1$6$0$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = this.u0;
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2;
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4[0];
        org.luaj.vm2.LuaTable a5 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a5).rawset(1, this.u5);
        org.luaj.vm2.LuaValue a6 = a3.call(a4, (org.luaj.vm2.LuaValue)a5);
        org.luaj.vm2.LuaValue a7 = this.u6;
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[4];
        a8[0] = a1;
        a8[1] = a2;
        a8[2] = a6;
        a8[3] = a7;
        return org.luaj.vm2.LuaValue.tailcallOf(a0, org.luaj.vm2.LuaValue.varargsOf(a8));
    }
}
