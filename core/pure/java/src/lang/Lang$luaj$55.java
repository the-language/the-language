package lang;
public class Lang$luaj$55 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue[] u13;
    org.luaj.vm2.LuaValue[] u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
    org.luaj.vm2.LuaValue u21;
    org.luaj.vm2.LuaValue u22;
    org.luaj.vm2.LuaValue[] u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue u25;
    org.luaj.vm2.LuaValue u26;
    org.luaj.vm2.LuaValue[] u27;
    org.luaj.vm2.LuaValue u28;
    org.luaj.vm2.LuaValue u29;
    org.luaj.vm2.LuaValue u30;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$55() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0[0].call(a1);
        if (this.u1.call(a3).toboolean()) {
            org.luaj.vm2.Varargs a4 = a2;
            return a4;
        }
        org.luaj.vm2.LuaValue a5 = this.u2;
        org.luaj.vm2.LuaValue a6 = this.u3[0];
        org.luaj.vm2.LuaValue a7 = this.u4;
        org.luaj.vm2.LuaValue a8 = this.u5[0];
        org.luaj.vm2.LuaValue a9 = this.u4;
        org.luaj.vm2.LuaValue a10 = this.u6[0];
        org.luaj.vm2.Varargs a11 = this.u4.invoke(this.u7.call(a0), (org.luaj.vm2.Varargs)a3);
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a10;
        org.luaj.vm2.Varargs a13 = a9.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[1];
        a14[0] = a8;
        org.luaj.vm2.Varargs a15 = a7.invoke(org.luaj.vm2.LuaValue.varargsOf(a14, a13));
        org.luaj.vm2.LuaValue[] a16 = new org.luaj.vm2.LuaValue[1];
        a16[0] = a6;
        org.luaj.vm2.LuaValue a17 = a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a16, a15)).arg1();
        if (this.u8.call(a3).toboolean()) {
            org.luaj.vm2.LuaTable a18 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            while(!this.u9.call(a3).toboolean()) {
                if (this.u1.call(a3).toboolean()) {
                    org.luaj.vm2.Varargs a19 = a2;
                    return a19;
                }
                if (!this.u8.call(a3).toboolean()) {
                    org.luaj.vm2.Varargs a20 = a17;
                    return a20;
                }
                org.luaj.vm2.LuaValue a21 = this.u10.get(k0);
                org.luaj.vm2.Varargs a22 = this.u11.invoke((org.luaj.vm2.Varargs)a3);
                org.luaj.vm2.LuaValue[] a23 = new org.luaj.vm2.LuaValue[1];
                a23[0] = a18;
                a21.invoke(org.luaj.vm2.LuaValue.varargsOf(a23, a22));
                a3 = this.u0[0].invoke(this.u12.invoke((org.luaj.vm2.Varargs)a3).subargs(1)).arg1();
            }
            if (this.u13[0].call(((org.luaj.vm2.LuaValue)a18).get(k1), this.u14[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a18).len().eq_b(k1)) {
                    org.luaj.vm2.Varargs a24 = a17;
                    return a24;
                }
                org.luaj.vm2.LuaValue a25 = ((org.luaj.vm2.LuaValue)a18).get(k2);
                org.luaj.vm2.LuaTable a26 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a27 = k2;
                while(a27.lt_b(((org.luaj.vm2.LuaValue)a18).len())) {
                    this.u10.get(k0).call((org.luaj.vm2.LuaValue)a26, ((org.luaj.vm2.LuaValue)a18).get(a27.add(k1)));
                    a27 = a27.add(k1);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u15, org.luaj.vm2.LuaValue.varargsOf(a0, a25, (org.luaj.vm2.Varargs)a26));
            } else if (this.u13[0].call(((org.luaj.vm2.LuaValue)a18).get(k1), this.u16[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a18).len().eq_b(k1)) {
                    org.luaj.vm2.Varargs a28 = a17;
                    return a28;
                }
                org.luaj.vm2.LuaValue a29 = this.u17[0].invoke(this.u18.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a18).get(k2)).subargs(1)).arg1();
                if (!this.u19.call(a29).toboolean()) {
                    org.luaj.vm2.Varargs a30 = a17;
                    return a30;
                }
                org.luaj.vm2.LuaValue a31 = this.u0[0].invoke(this.u20.invoke((org.luaj.vm2.Varargs)a29).subargs(1)).arg1();
                if (this.u1.call(a31).toboolean()) {
                    org.luaj.vm2.Varargs a32 = a2;
                    return a32;
                }
                if (!this.u21.call(a31).toboolean()) {
                    org.luaj.vm2.Varargs a33 = a17;
                    return a33;
                }
                if (!this.u22.call(a31, this.u23[0]).toboolean()) {
                    org.luaj.vm2.Varargs a34 = a17;
                    return a34;
                }
                org.luaj.vm2.LuaValue a35 = this.u0[0].invoke(this.u24.invoke((org.luaj.vm2.Varargs)a29).subargs(1)).arg1();
                if (this.u1.call(a35).toboolean()) {
                    org.luaj.vm2.Varargs a36 = a2;
                    return a36;
                }
                if (!this.u8.call(a35).toboolean()) {
                    org.luaj.vm2.Varargs a37 = a17;
                    return a37;
                }
                org.luaj.vm2.LuaValue a38 = this.u11.call(a35);
                org.luaj.vm2.LuaValue a39 = this.u0[0].invoke(this.u12.invoke((org.luaj.vm2.Varargs)a35).subargs(1)).arg1();
                if (this.u1.call(a39).toboolean()) {
                    org.luaj.vm2.Varargs a40 = a2;
                    return a40;
                }
                if (!this.u9.call(a39).toboolean()) {
                    org.luaj.vm2.Varargs a41 = a17;
                    return a41;
                }
                org.luaj.vm2.LuaTable a42 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                ((org.luaj.vm2.LuaValue)a42).rawsetlist(1, this.u7.invoke((org.luaj.vm2.Varargs)a0));
                org.luaj.vm2.LuaValue a43 = k2;
                while(a43.lt_b(((org.luaj.vm2.LuaValue)a18).len())) {
                    this.u10.get(k0).call((org.luaj.vm2.LuaValue)a42, ((org.luaj.vm2.LuaValue)a18).get(a43.add(k1)));
                    a43 = a43.add(k1);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u25, org.luaj.vm2.LuaValue.varargsOf(a38, (org.luaj.vm2.Varargs)a42));
            } else if (this.u13[0].call(((org.luaj.vm2.LuaValue)a18).get(k1), this.u5[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a18).len().eq_b(k1)) {
                    org.luaj.vm2.Varargs a44 = a17;
                    return a44;
                }
                org.luaj.vm2.LuaValue a45 = ((org.luaj.vm2.LuaValue)a18).get(k2);
                org.luaj.vm2.LuaTable a46 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a47 = k2;
                while(a47.lt_b(((org.luaj.vm2.LuaValue)a18).len())) {
                    org.luaj.vm2.LuaValue a48 = this.u10.get(k0);
                    org.luaj.vm2.Varargs a49 = this.u18.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a18).get(a47.add(k1)));
                    org.luaj.vm2.LuaValue[] a50 = new org.luaj.vm2.LuaValue[1];
                    a50[0] = a46;
                    a48.invoke(org.luaj.vm2.LuaValue.varargsOf(a50, a49));
                    a47 = a47.add(k1);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u26, org.luaj.vm2.LuaValue.varargsOf(a45, (org.luaj.vm2.Varargs)a46));
            } else {
                org.luaj.vm2.LuaValue a51 = this.u18.call(a0, ((org.luaj.vm2.LuaValue)a18).get(k1));
                org.luaj.vm2.LuaTable a52 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a53 = k1;
                while(a53.lt_b(((org.luaj.vm2.LuaValue)a18).len())) {
                    org.luaj.vm2.LuaValue a54 = this.u10.get(k0);
                    org.luaj.vm2.Varargs a55 = this.u18.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a18).get(a53.add(k1)));
                    org.luaj.vm2.LuaValue[] a56 = new org.luaj.vm2.LuaValue[1];
                    a56[0] = a52;
                    a54.invoke(org.luaj.vm2.LuaValue.varargsOf(a56, a55));
                    a53 = a53.add(k1);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u25, org.luaj.vm2.LuaValue.varargsOf(a51, (org.luaj.vm2.Varargs)a52));
            }
        } else {
            if (this.u9.call(a3).toboolean()) {
                org.luaj.vm2.Varargs a57 = a3;
                return a57;
            }
            if (this.u27[0].call(a3).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u28, org.luaj.vm2.LuaValue.varargsOf(a0, a3, (org.luaj.vm2.Varargs)a17));
            }
            if (this.u29.call(a3).toboolean()) {
                org.luaj.vm2.Varargs a58 = a17;
                return a58;
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u30, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
    }
}
