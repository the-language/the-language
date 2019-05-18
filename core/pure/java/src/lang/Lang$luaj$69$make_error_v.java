package lang;
public class Lang$luaj$69$make_error_v extends org.luaj.vm2.lib.VarArgFunction {
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
    
    public Lang$luaj$69$make_error_v() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (!this.u0[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u0[0], (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        org.luaj.vm2.LuaValue a0 = this.u1;
        org.luaj.vm2.LuaValue a1 = this.u2[0];
        org.luaj.vm2.LuaValue a2 = this.u3;
        org.luaj.vm2.LuaValue a3 = this.u4[0];
        org.luaj.vm2.LuaValue a4 = this.u3;
        org.luaj.vm2.LuaValue a5 = this.u5.call(this.u6);
        org.luaj.vm2.LuaValue a6 = this.u7[0];
        org.luaj.vm2.LuaValue a7 = this.u8;
        org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(2, 0);
        org.luaj.vm2.LuaValue a9 = this.u9[0];
        org.luaj.vm2.LuaValue a10 = this.u10;
        ((org.luaj.vm2.LuaValue)a8).rawset(1, a9);
        ((org.luaj.vm2.LuaValue)a8).rawset(2, a10);
        org.luaj.vm2.Varargs a11 = a7.invoke((org.luaj.vm2.Varargs)a8);
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[2];
        a12[0] = a5;
        a12[1] = a6;
        org.luaj.vm2.Varargs a13 = a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[1];
        a14[0] = a3;
        org.luaj.vm2.Varargs a15 = a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a14, a13));
        org.luaj.vm2.LuaValue[] a16 = new org.luaj.vm2.LuaValue[1];
        a16[0] = a1;
        return org.luaj.vm2.LuaValue.tailcallOf(a0, org.luaj.vm2.LuaValue.varargsOf(a16, a15));
    }
}
