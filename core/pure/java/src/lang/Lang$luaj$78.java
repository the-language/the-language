package lang;
public class Lang$luaj$78 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue[] u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$78() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(5);
        Lang$luaj$78$error_v a3 = new Lang$luaj$78$error_v();
        a3.u0 = this.u0;
        a3.u1 = this.u1;
        a3.u2 = this.u2;
        a3.u3 = this.u3;
        a3.u4 = this.u4;
        a3.u5 = a0;
        a3.u6 = a1;
        a3.u7 = this.u5;
        a3.u8 = a2;
        if (this.u6[0].call(a1, this.u7[0]).toboolean()) {
            if (!a2.len().eq_b(k0)) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.Varargs a4 = a2.get(k0);
            return a4;
        } else if (this.u6[0].call(a1, this.u8[0]).toboolean()) {
            if (!a2.len().eq_b(k1)) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a5 = this.u9[0];
            org.luaj.vm2.LuaValue a6 = a2.get(k0);
            org.luaj.vm2.LuaValue a7 = a2.get(k1);
            org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[4];
            a8[0] = a0;
            a8[1] = a6;
            a8[2] = a7;
            a8[3] = a3;
            return org.luaj.vm2.LuaValue.tailcallOf(a5, org.luaj.vm2.LuaValue.varargsOf(a8));
        } else {
            if (!this.u6[0].call(a1, this.u10[0]).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            if (!a2.len().eq_b(k1)) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a9 = this.u11;
            org.luaj.vm2.LuaValue a10 = a2.get(k0);
            org.luaj.vm2.Varargs a11 = this.u12.invoke(a0, (org.luaj.vm2.Varargs)a2.get(k1));
            org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
            a12[0] = a10;
            return org.luaj.vm2.LuaValue.tailcallOf(a9, org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        }
    }
}
