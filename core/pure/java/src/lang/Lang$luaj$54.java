package lang;
public class Lang$luaj$54 extends org.luaj.vm2.lib.VarArgFunction {
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
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
        k3 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$54() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(4);
        org.luaj.vm2.LuaValue a2 = this.u0;
        org.luaj.vm2.LuaValue a3 = this.u1[0];
        org.luaj.vm2.LuaValue a4 = this.u2;
        org.luaj.vm2.LuaValue a5 = this.u3[0];
        org.luaj.vm2.LuaValue a6 = this.u2;
        org.luaj.vm2.Varargs a7 = this.u4.invoke((org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[1];
        a8[0] = a0;
        org.luaj.vm2.Varargs a9 = a6.invoke(org.luaj.vm2.LuaValue.varargsOf(a8, a7));
        org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[1];
        a10[0] = a5;
        org.luaj.vm2.Varargs a11 = a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a3;
        org.luaj.vm2.LuaValue a13 = a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11)).arg1();
        org.luaj.vm2.LuaValue a14 = k0;
        while(a14.lt_b(this.u5[0].len())) {
            org.luaj.vm2.LuaValue a15 = this.u6[0];
            org.luaj.vm2.LuaValue a16 = a14.add(k1);
            if (a15.call(a0, this.u5[0].get(a16).get(k1)).toboolean()) {
                org.luaj.vm2.LuaValue a17 = a14.add(k1);
                org.luaj.vm2.LuaValue a18 = this.u5[0].get(a17).get(k2);
                if (!a1.len().eq_b(a18)) {
                    org.luaj.vm2.Varargs a19 = a13;
                    return a19;
                }
                org.luaj.vm2.LuaValue a20 = a14.add(k1);
                org.luaj.vm2.LuaValue a21 = this.u5[0].get(a20).get(k3);
                if (a18.eq_b(k1)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a21, org.luaj.vm2.LuaValue.varargsOf(a1.get(k1), (org.luaj.vm2.Varargs)a13));
                }
                if (a18.eq_b(k2)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a21, org.luaj.vm2.LuaValue.varargsOf(a1.get(k1), a1.get(k2), (org.luaj.vm2.Varargs)a13));
                }
                if (!a18.eq_b(k3)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u7, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a22 = a1.get(k1);
                org.luaj.vm2.LuaValue a23 = a1.get(k2);
                org.luaj.vm2.LuaValue a24 = a1.get(k3);
                org.luaj.vm2.LuaValue[] a25 = new org.luaj.vm2.LuaValue[4];
                a25[0] = a22;
                a25[1] = a23;
                a25[2] = a24;
                a25[3] = a13;
                return org.luaj.vm2.LuaValue.tailcallOf(a21, org.luaj.vm2.LuaValue.varargsOf(a25));
            } else {
                a14 = a14.add(k1);
            }
        }
        org.luaj.vm2.Varargs a26 = a13;
        return a26;
    }
}
