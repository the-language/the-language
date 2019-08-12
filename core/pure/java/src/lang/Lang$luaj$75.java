package lang;
public class Lang$luaj$75 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue u8;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
        k3 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$75() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        Lang$luaj$75$error_v a3 = new Lang$luaj$75$error_v();
        a3.u0 = this.u0;
        a3.u1 = this.u1;
        a3.u2 = this.u2;
        a3.u3 = this.u3;
        a3.u4 = a0;
        a3.u5 = this.u4;
        a3.u6 = a1;
        org.luaj.vm2.Varargs a4 = this.u5.get(k0).invoke((org.luaj.vm2.Varargs)this.u6[0]);
        org.luaj.vm2.LuaValue a5 = a4.arg1();
        org.luaj.vm2.LuaValue a6 = a4.arg(2);
        org.luaj.vm2.LuaValue a7 = a4.arg(3);
        while(true) {
            org.luaj.vm2.Varargs a8 = a5.invoke(a6, (org.luaj.vm2.Varargs)a7);
            a7 = a8.arg1();
            org.luaj.vm2.LuaValue a9 = a8.arg(2);
            if (a7.isnil()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            if (this.u7[0].call(a0, a9.get(k1)).toboolean()) {
                if (!a1.len().eq_b(a9.get(k2))) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (a9.get(k2).eq_b(k1)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a9.get(k3), org.luaj.vm2.LuaValue.varargsOf(a1.get(k1), (org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)a2));
                }
                if (a9.get(k2).eq_b(k2)) {
                    org.luaj.vm2.LuaValue a10 = a9.get(k3);
                    org.luaj.vm2.LuaValue a11 = a1.get(k1);
                    org.luaj.vm2.LuaValue a12 = a1.get(k2);
                    org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[4];
                    a13[0] = a11;
                    a13[1] = a12;
                    a13[2] = a3;
                    a13[3] = a2;
                    return org.luaj.vm2.LuaValue.tailcallOf(a10, org.luaj.vm2.LuaValue.varargsOf(a13));
                }
                if (!a9.get(k2).eq_b(k3)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u8, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a14 = a9.get(k3);
                org.luaj.vm2.LuaValue a15 = a1.get(k1);
                org.luaj.vm2.LuaValue a16 = a1.get(k2);
                org.luaj.vm2.LuaValue a17 = a1.get(k3);
                org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[5];
                a18[0] = a15;
                a18[1] = a16;
                a18[2] = a17;
                a18[3] = a3;
                a18[4] = a2;
                return org.luaj.vm2.LuaValue.tailcallOf(a14, org.luaj.vm2.LuaValue.varargsOf(a18));
            }
        }
    }
}
