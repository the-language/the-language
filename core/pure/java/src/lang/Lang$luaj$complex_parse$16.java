package lang;
public class Lang$luaj$complex_parse$16 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("&");
        k1 = org.luaj.vm2.LuaString.valueOf("+");
        k2 = org.luaj.vm2.LuaString.valueOf(":");
        k3 = org.luaj.vm2.LuaString.valueOf(">");
        k4 = org.luaj.vm2.LuaString.valueOf("[");
        k5 = org.luaj.vm2.LuaString.valueOf("]");
        k6 = org.luaj.vm2.LuaString.valueOf("_");
    }
    
    public Lang$luaj$complex_parse$16() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (this.u0.call().toboolean()) {
            org.luaj.vm2.Varargs a0 = org.luaj.vm2.LuaValue.FALSE;
            return a0;
        }
        org.luaj.vm2.LuaValue a1 = this.u1.call();
        if (a1.eq_b(k0)) {
            this.u2.invoke(this.u3.invoke().subargs(1));
            org.luaj.vm2.LuaValue a2 = this.u1.call();
            if (!a2.eq_b(k1)) {
                this.u8.call(a2);
                org.luaj.vm2.LuaValue a3 = this.u4[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(this.u6[0], (org.luaj.vm2.Varargs)a3));
            }
            org.luaj.vm2.LuaValue a4 = this.u4[0].call();
            org.luaj.vm2.LuaValue a5 = this.u5;
            org.luaj.vm2.LuaValue a6 = this.u6[0];
            org.luaj.vm2.Varargs a7 = this.u5.invoke(this.u7[0], (org.luaj.vm2.Varargs)a4);
            org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[1];
            a8[0] = a6;
            return org.luaj.vm2.LuaValue.tailcallOf(a5, org.luaj.vm2.LuaValue.varargsOf(a8, a7));
        } else if (a1.eq_b(k2)) {
            this.u2.invoke(this.u3.invoke().subargs(1));
            org.luaj.vm2.LuaValue a9 = this.u1.call();
            if (a9.eq_b(k0)) {
                this.u9.call(k3);
                org.luaj.vm2.LuaValue a10 = this.u4[0].call();
                org.luaj.vm2.LuaValue a11 = this.u5;
                org.luaj.vm2.LuaValue a12 = this.u10;
                org.luaj.vm2.LuaValue a13 = this.u5;
                org.luaj.vm2.LuaValue a14 = this.u6[0];
                org.luaj.vm2.Varargs a15 = this.u5.invoke(this.u11[0], this.u12, (org.luaj.vm2.Varargs)a10);
                org.luaj.vm2.LuaValue[] a16 = new org.luaj.vm2.LuaValue[1];
                a16[0] = a14;
                return org.luaj.vm2.LuaValue.tailcallOf(a11, org.luaj.vm2.LuaValue.varargsOf(a12, a13.invoke(org.luaj.vm2.LuaValue.varargsOf(a16, a15)).arg1(), (org.luaj.vm2.Varargs)this.u13));
            }
            if (!a9.eq_b(k3)) {
                this.u8.call(a9);
                org.luaj.vm2.LuaValue a17 = this.u4[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(this.u10, a17, (org.luaj.vm2.Varargs)this.u13));
            }
            org.luaj.vm2.LuaValue a18 = this.u4[0].call();
            return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(this.u10, this.u5.call(this.u11[0], this.u12, a18), (org.luaj.vm2.Varargs)this.u13));
        } else {
            if (a1.eq_b(k1)) {
                org.luaj.vm2.LuaValue a19 = this.u4[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(this.u7[0], (org.luaj.vm2.Varargs)a19));
            }
            if (a1.eq_b(k4)) {
                org.luaj.vm2.LuaValue a20 = this.u4[0].call();
                this.u9.call(k5);
                return org.luaj.vm2.LuaValue.tailcallOf(this.u14, (org.luaj.vm2.Varargs)a20);
            }
            if (a1.eq_b(k6)) {
                this.u9.call(k2);
                org.luaj.vm2.LuaValue a21 = this.u4[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(this.u10, a21, (org.luaj.vm2.Varargs)this.u12));
            }
            this.u8.call(a1);
            org.luaj.vm2.LuaValue a22 = this.u15.call();
            if (a22.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                org.luaj.vm2.Varargs a23 = org.luaj.vm2.LuaValue.FALSE;
                return a23;
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u14, (org.luaj.vm2.Varargs)a22);
        }
    }
}
