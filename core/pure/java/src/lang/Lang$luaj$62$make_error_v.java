package lang;
public class Lang$luaj$62$make_error_v extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue u10;
    
    public Lang$luaj$62$make_error_v() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (!this.u0[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            org.luaj.vm2.Varargs a0 = this.u0[0];
            return a0;
        }
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2[0];
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4[0];
        org.luaj.vm2.LuaValue a5 = this.u3;
        org.luaj.vm2.LuaValue a6 = this.u5.call(this.u6);
        org.luaj.vm2.LuaValue a7 = this.u7[0];
        org.luaj.vm2.LuaValue a8 = this.u8;
        org.luaj.vm2.LuaTable a9 = org.luaj.vm2.LuaValue.tableOf(2, 0);
        org.luaj.vm2.LuaValue a10 = this.u9[0];
        org.luaj.vm2.LuaValue a11 = this.u10;
        ((org.luaj.vm2.LuaValue)a9).rawset(1, a10);
        ((org.luaj.vm2.LuaValue)a9).rawset(2, a11);
        org.luaj.vm2.Varargs a12 = a8.invoke((org.luaj.vm2.Varargs)a9);
        org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[2];
        a13[0] = a6;
        a13[1] = a7;
        org.luaj.vm2.Varargs a14 = a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a13, a12));
        org.luaj.vm2.LuaValue[] a15 = new org.luaj.vm2.LuaValue[1];
        a15[0] = a4;
        org.luaj.vm2.Varargs a16 = a3.invoke(org.luaj.vm2.LuaValue.varargsOf(a15, a14));
        org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[1];
        a17[0] = a2;
        return org.luaj.vm2.LuaValue.tailcallOf(a1, org.luaj.vm2.LuaValue.varargsOf(a17, a16));
    }
}
