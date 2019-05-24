package lang;
public class Lang$luaj$67 extends org.luaj.vm2.lib.VarArgFunction {
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
    
    public Lang$luaj$67() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        Lang$luaj$67$0 a3 = new Lang$luaj$67$0();
        a3.u0 = this.u0;
        a3.u1 = this.u1;
        a3.u2 = this.u2;
        a3.u3 = this.u3;
        a3.u4 = a0;
        a3.u5 = this.u4;
        a3.u6 = a1;
        org.luaj.vm2.LuaValue a4 = k0;
        org.luaj.vm2.LuaValue a5 = this.u5[0].len();
        org.luaj.vm2.LuaValue a6 = k0;
        org.luaj.vm2.LuaValue a7 = a4.sub(a6);
        while(true) {
            a7 = a7.add(a6);
            if (!a7.testfor_b(a5, a6)) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a8 = this.u5[0].get(a7);
            if (this.u6[0].call(a0, a8.get(k0)).toboolean()) {
                if (!a1.len().eq_b(a8.get(k1))) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (a8.get(k1).eq_b(k0)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a8.get(k2), org.luaj.vm2.LuaValue.varargsOf(a1.get(k0), (org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)a2));
                }
                if (a8.get(k1).eq_b(k1)) {
                    org.luaj.vm2.LuaValue a9 = a8.get(k2);
                    org.luaj.vm2.LuaValue a10 = a1.get(k0);
                    org.luaj.vm2.LuaValue a11 = a1.get(k1);
                    org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[4];
                    a12[0] = a10;
                    a12[1] = a11;
                    a12[2] = a3;
                    a12[3] = a2;
                    return org.luaj.vm2.LuaValue.tailcallOf(a9, org.luaj.vm2.LuaValue.varargsOf(a12));
                }
                if (!a8.get(k1).eq_b(k2)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u7, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a13 = a8.get(k2);
                org.luaj.vm2.LuaValue a14 = a1.get(k0);
                org.luaj.vm2.LuaValue a15 = a1.get(k1);
                org.luaj.vm2.LuaValue a16 = a1.get(k2);
                org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[5];
                a17[0] = a14;
                a17[1] = a15;
                a17[2] = a16;
                a17[3] = a3;
                a17[4] = a2;
                return org.luaj.vm2.LuaValue.tailcallOf(a13, org.luaj.vm2.LuaValue.varargsOf(a17));
            }
        }
    }
}
