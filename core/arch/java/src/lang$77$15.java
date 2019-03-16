public class lang$77$15 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue[] u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
    org.luaj.vm2.LuaValue u21;
    org.luaj.vm2.LuaValue u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue u25;
    org.luaj.vm2.LuaValue[] u26;
    org.luaj.vm2.LuaValue[] u27;
    org.luaj.vm2.LuaValue u28;
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
    
    public lang$77$15() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = org.luaj.vm2.LuaValue.NIL;
        org.luaj.vm2.LuaValue[] a1 = lang$77$15.newupe();
        a1[0] = a0;
        lang$77$15$0 a2 = new lang$77$15$0();
        a2.u0 = this.u0;
        a2.u1 = a1;
        a2.u2 = this.u1;
        a2.u3 = this.u2;
        a2.u4 = this.u3;
        a2.u5 = this.u4;
        a2.u6 = this.u5;
        a2.u7 = this.u6;
        a2.u8 = this.u7;
        a2.u9 = this.u8;
        a2.u10 = this.u9;
        a2.u11 = this.u10;
        a1[0] = a2;
        lang$77$15$1 a3 = new lang$77$15$1();
        a3.u0 = this.u11;
        a3.u1 = this.u12;
        a3.u2 = a1;
        a3.u3 = this.u13;
        a3.u4 = this.u14;
        a3.u5 = this.u15;
        a3.u6 = this.u16;
        a3.u7 = this.u17;
        a3.u8 = this.u18;
        a3.u9 = this.u19;
        a3.u10 = this.u20;
        a3.u11 = this.u21;
        a3.u12 = this.u22;
        a3.u13 = this.u23;
        if (this.u11.call().toboolean()) {
            org.luaj.vm2.Varargs a4 = org.luaj.vm2.LuaValue.FALSE;
            return a4;
        }
        org.luaj.vm2.LuaValue a5 = this.u12.call();
        if (a5.eq_b(k0)) {
            this.u24.invoke(this.u25.invoke().subargs(1));
            org.luaj.vm2.LuaValue a6 = this.u12.call();
            if (!a6.eq_b(k1)) {
                this.u20.call(a6);
                org.luaj.vm2.LuaValue a7 = a1[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u13, org.luaj.vm2.LuaValue.varargsOf(this.u26[0], (org.luaj.vm2.Varargs)a7));
            }
            org.luaj.vm2.LuaValue a8 = a1[0].call();
            org.luaj.vm2.LuaValue a9 = this.u13;
            org.luaj.vm2.LuaValue a10 = this.u26[0];
            org.luaj.vm2.Varargs a11 = this.u13.invoke(this.u27[0], (org.luaj.vm2.Varargs)a8);
            org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
            a12[0] = a10;
            return org.luaj.vm2.LuaValue.tailcallOf(a9, org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        } else if (a5.eq_b(k2)) {
            this.u24.invoke(this.u25.invoke().subargs(1));
            org.luaj.vm2.LuaValue a13 = this.u12.call();
            if (a13.eq_b(k0)) {
                this.u0.call(k3);
                org.luaj.vm2.LuaValue a14 = a1[0].call();
                org.luaj.vm2.LuaValue a15 = this.u13;
                org.luaj.vm2.LuaValue a16 = this.u14;
                org.luaj.vm2.LuaValue a17 = this.u13;
                org.luaj.vm2.LuaValue a18 = this.u26[0];
                org.luaj.vm2.Varargs a19 = this.u13.invoke(this.u15[0], this.u16, (org.luaj.vm2.Varargs)a14);
                org.luaj.vm2.LuaValue[] a20 = new org.luaj.vm2.LuaValue[1];
                a20[0] = a18;
                return org.luaj.vm2.LuaValue.tailcallOf(a15, org.luaj.vm2.LuaValue.varargsOf(a16, a17.invoke(org.luaj.vm2.LuaValue.varargsOf(a20, a19)).arg1(), (org.luaj.vm2.Varargs)this.u28));
            }
            if (!a13.eq_b(k3)) {
                this.u20.call(a13);
                org.luaj.vm2.LuaValue a21 = a1[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u13, org.luaj.vm2.LuaValue.varargsOf(this.u14, a21, (org.luaj.vm2.Varargs)this.u28));
            }
            org.luaj.vm2.LuaValue a22 = a1[0].call();
            return org.luaj.vm2.LuaValue.tailcallOf(this.u13, org.luaj.vm2.LuaValue.varargsOf(this.u14, this.u13.call(this.u15[0], this.u16, a22), (org.luaj.vm2.Varargs)this.u28));
        } else {
            if (a5.eq_b(k1)) {
                org.luaj.vm2.LuaValue a23 = a1[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u13, org.luaj.vm2.LuaValue.varargsOf(this.u27[0], (org.luaj.vm2.Varargs)a23));
            }
            if (a5.eq_b(k4)) {
                org.luaj.vm2.LuaValue a24 = a1[0].call();
                this.u0.call(k5);
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)a24);
            }
            if (a5.eq_b(k6)) {
                this.u0.call(k2);
                org.luaj.vm2.LuaValue a25 = a1[0].call();
                return org.luaj.vm2.LuaValue.tailcallOf(this.u13, org.luaj.vm2.LuaValue.varargsOf(this.u14, a25, (org.luaj.vm2.Varargs)this.u16));
            }
            this.u20.call(a5);
            org.luaj.vm2.LuaValue a26 = this.u2.call();
            if (a26.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                org.luaj.vm2.Varargs a27 = org.luaj.vm2.LuaValue.FALSE;
                return a27;
            }
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)a26);
        }
    }
}
