package lang;
public class Lang$luaj$66 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
        k2 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$66() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0;
        org.luaj.vm2.LuaValue a4 = this.u1[0];
        org.luaj.vm2.LuaValue a5 = this.u2;
        org.luaj.vm2.LuaValue a6 = this.u3[0];
        org.luaj.vm2.LuaValue a7 = this.u2;
        org.luaj.vm2.Varargs a8 = this.u4.invoke((org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a9 = new org.luaj.vm2.LuaValue[1];
        a9[0] = a0;
        org.luaj.vm2.Varargs a10 = a7.invoke(org.luaj.vm2.LuaValue.varargsOf(a9, a8));
        org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[1];
        a11[0] = a6;
        org.luaj.vm2.Varargs a12 = a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a11, a10));
        org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[1];
        a13[0] = a4;
        org.luaj.vm2.LuaValue a14 = a3.invoke(org.luaj.vm2.LuaValue.varargsOf(a13, a12)).arg1();
        org.luaj.vm2.LuaValue a15 = k0;
        org.luaj.vm2.LuaValue a16 = this.u5[0].len();
        org.luaj.vm2.LuaValue a17 = k0;
        org.luaj.vm2.LuaValue a18 = a15.sub(a17);
        while(true) {
            a18 = a18.add(a17);
            if (!a18.testfor_b(a16, a17)) {
                org.luaj.vm2.Varargs a19 = a14;
                return a19;
            }
            org.luaj.vm2.LuaValue a20 = this.u5[0].get(a18);
            if (this.u6[0].call(a0, a20.get(k0)).toboolean()) {
                if (!a1.len().eq_b(a20.get(k1))) {
                    org.luaj.vm2.Varargs a21 = a14;
                    return a21;
                }
                if (a20.get(k1).eq_b(k0)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a20.get(k2), org.luaj.vm2.LuaValue.varargsOf(a1.get(k0), a14, (org.luaj.vm2.Varargs)a2));
                }
                if (a20.get(k1).eq_b(k1)) {
                    org.luaj.vm2.LuaValue a22 = a20.get(k2);
                    org.luaj.vm2.LuaValue a23 = a1.get(k0);
                    org.luaj.vm2.LuaValue a24 = a1.get(k1);
                    org.luaj.vm2.LuaValue[] a25 = new org.luaj.vm2.LuaValue[4];
                    a25[0] = a23;
                    a25[1] = a24;
                    a25[2] = a14;
                    a25[3] = a2;
                    return org.luaj.vm2.LuaValue.tailcallOf(a22, org.luaj.vm2.LuaValue.varargsOf(a25));
                }
                if (!a20.get(k1).eq_b(k2)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u7, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a26 = a20.get(k2);
                org.luaj.vm2.LuaValue a27 = a1.get(k0);
                org.luaj.vm2.LuaValue a28 = a1.get(k1);
                org.luaj.vm2.LuaValue a29 = a1.get(k2);
                org.luaj.vm2.LuaValue[] a30 = new org.luaj.vm2.LuaValue[5];
                a30[0] = a27;
                a30[1] = a28;
                a30[2] = a29;
                a30[3] = a14;
                a30[4] = a2;
                return org.luaj.vm2.LuaValue.tailcallOf(a26, org.luaj.vm2.LuaValue.varargsOf(a30));
            }
        }
    }
}
