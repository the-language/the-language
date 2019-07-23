package lang;
public class Lang$luaj$61 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue[] u10;
    
    public Lang$luaj$61() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaTable a4 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaTable a5 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a6 = this.u0.call(a0);
        org.luaj.vm2.LuaBoolean a7 = org.luaj.vm2.LuaValue.TRUE;
        while(!this.u1.call(a6).toboolean()) {
            if (this.u2.call(a6).toboolean()) {
                org.luaj.vm2.LuaValue a8 = this.u3;
                org.luaj.vm2.Varargs a9 = this.u4.invoke((org.luaj.vm2.Varargs)a6);
                org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[1];
                a10[0] = a5;
                a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
                a6 = this.u5.call(a6);
            } else if (this.u6.call(a6).toboolean()) {
                org.luaj.vm2.LuaValue a11 = this.u3;
                org.luaj.vm2.Varargs a12 = this.u7.invoke((org.luaj.vm2.Varargs)a6);
                org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[1];
                a13[0] = a4;
                a11.invoke(org.luaj.vm2.LuaValue.varargsOf(a13, a12));
                a6 = this.u8.call(a6);
            } else {
                if (!this.u9.call(a6).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a1, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (!((org.luaj.vm2.LuaValue)a7).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                a7 = org.luaj.vm2.LuaValue.FALSE;
                a6 = this.u10[0].call(a6);
            }
        }
        return org.luaj.vm2.LuaValue.tailcallOf(a3, org.luaj.vm2.LuaValue.varargsOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)a4));
    }
}
