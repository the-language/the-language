package lang;
public class lang_luaj$51 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
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
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue[] u14;
    org.luaj.vm2.LuaValue[] u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue[] u18;
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
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public lang_luaj$51() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0[0].call(a1);
        if (this.u1.call(a2).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u2, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.Varargs)a2));
        }
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4[0];
        org.luaj.vm2.LuaValue a5 = this.u5;
        org.luaj.vm2.LuaValue a6 = this.u6[0];
        org.luaj.vm2.LuaValue a7 = this.u5;
        org.luaj.vm2.LuaValue a8 = this.u7[0];
        org.luaj.vm2.Varargs a9 = this.u5.invoke(this.u8.call(a0), (org.luaj.vm2.Varargs)a2);
        org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[1];
        a10[0] = a8;
        org.luaj.vm2.Varargs a11 = a7.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a6;
        org.luaj.vm2.Varargs a13 = a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[1];
        a14[0] = a4;
        org.luaj.vm2.LuaValue a15 = a3.invoke(org.luaj.vm2.LuaValue.varargsOf(a14, a13)).arg1();
        if (this.u9.call(a2).toboolean()) {
            org.luaj.vm2.LuaTable a16 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a17 = a2;
            while(!this.u10.call(a17).toboolean()) {
                if (this.u1.call(a17).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u2, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.Varargs)a2));
                }
                if (!this.u9.call(a17).toboolean()) {
                    org.luaj.vm2.Varargs a18 = a15;
                    return a18;
                }
                org.luaj.vm2.LuaValue a19 = this.u11;
                org.luaj.vm2.Varargs a20 = this.u12.invoke((org.luaj.vm2.Varargs)a17);
                org.luaj.vm2.LuaValue[] a21 = new org.luaj.vm2.LuaValue[1];
                a21[0] = a16;
                a19.invoke(org.luaj.vm2.LuaValue.varargsOf(a21, a20));
                a17 = this.u0[0].invoke(this.u13.invoke((org.luaj.vm2.Varargs)a17).subargs(1)).arg1();
            }
            if (this.u14[0].call(((org.luaj.vm2.LuaValue)a16).get(k0), this.u15[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a16).len().eq_b(k0)) {
                    org.luaj.vm2.Varargs a22 = a15;
                    return a22;
                }
                org.luaj.vm2.LuaValue a23 = ((org.luaj.vm2.LuaValue)a16).get(k1);
                org.luaj.vm2.LuaTable a24 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a25 = k1;
                while(a25.lt_b(((org.luaj.vm2.LuaValue)a16).len())) {
                    ((org.luaj.vm2.LuaValue)a24).set(a25.sub(k1).add(k0), ((org.luaj.vm2.LuaValue)a16).get(a25.add(k0)));
                    a25 = a25.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u16, org.luaj.vm2.LuaValue.varargsOf(a0, a23, (org.luaj.vm2.Varargs)a24));
            } else if (this.u14[0].call(((org.luaj.vm2.LuaValue)a16).get(k0), this.u17[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a16).len().eq_b(k0)) {
                    org.luaj.vm2.Varargs a26 = a15;
                    return a26;
                }
                org.luaj.vm2.LuaValue a27 = this.u18[0].invoke(this.u2.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a16).get(k1)).subargs(1)).arg1();
                if (!this.u19.call(a27).toboolean()) {
                    org.luaj.vm2.Varargs a28 = a15;
                    return a28;
                }
                org.luaj.vm2.LuaValue a29 = this.u0[0].invoke(this.u20.invoke((org.luaj.vm2.Varargs)a27).subargs(1)).arg1();
                if (this.u1.call(a29).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u2, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.Varargs)a2));
                }
                if (!this.u21.call(a29).toboolean()) {
                    org.luaj.vm2.Varargs a30 = a15;
                    return a30;
                }
                if (!this.u22.call(a29, this.u23[0]).toboolean()) {
                    org.luaj.vm2.Varargs a31 = a15;
                    return a31;
                }
                org.luaj.vm2.LuaValue a32 = this.u0[0].invoke(this.u24.invoke((org.luaj.vm2.Varargs)a27).subargs(1)).arg1();
                if (this.u1.call(a32).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u2, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.Varargs)a2));
                }
                if (!this.u9.call(a32).toboolean()) {
                    org.luaj.vm2.Varargs a33 = a15;
                    return a33;
                }
                org.luaj.vm2.LuaValue a34 = this.u12.call(a32);
                org.luaj.vm2.LuaValue a35 = this.u0[0].invoke(this.u13.invoke((org.luaj.vm2.Varargs)a32).subargs(1)).arg1();
                if (this.u1.call(a35).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u2, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.Varargs)a2));
                }
                if (!this.u10.call(a35).toboolean()) {
                    org.luaj.vm2.Varargs a36 = a15;
                    return a36;
                }
                org.luaj.vm2.LuaTable a37 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                ((org.luaj.vm2.LuaValue)a37).rawsetlist(1, this.u8.invoke((org.luaj.vm2.Varargs)a0));
                org.luaj.vm2.LuaValue a38 = k1;
                while(a38.lt_b(((org.luaj.vm2.LuaValue)a16).len())) {
                    ((org.luaj.vm2.LuaValue)a37).set(a38.sub(k0).add(k0), ((org.luaj.vm2.LuaValue)a16).get(a38.add(k0)));
                    a38 = a38.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u25, org.luaj.vm2.LuaValue.varargsOf(a34, (org.luaj.vm2.Varargs)a37));
            } else if (this.u14[0].call(((org.luaj.vm2.LuaValue)a16).get(k0), this.u6[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a16).len().eq_b(k0)) {
                    org.luaj.vm2.Varargs a39 = a15;
                    return a39;
                }
                org.luaj.vm2.LuaValue a40 = ((org.luaj.vm2.LuaValue)a16).get(k1);
                org.luaj.vm2.LuaTable a41 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a42 = k1;
                while(a42.lt_b(((org.luaj.vm2.LuaValue)a16).len())) {
                    ((org.luaj.vm2.LuaValue)a41).set(a42.sub(k1).add(k0), this.u2.call(a0, ((org.luaj.vm2.LuaValue)a16).get(a42.add(k0))));
                    a42 = a42.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u26, org.luaj.vm2.LuaValue.varargsOf(a40, (org.luaj.vm2.Varargs)a41));
            } else {
                org.luaj.vm2.LuaValue a43 = this.u2.call(a0, ((org.luaj.vm2.LuaValue)a16).get(k0));
                org.luaj.vm2.LuaTable a44 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a45 = k0;
                while(a45.lt_b(((org.luaj.vm2.LuaValue)a16).len())) {
                    ((org.luaj.vm2.LuaValue)a44).set(a45.sub(k0).add(k0), this.u2.call(a0, ((org.luaj.vm2.LuaValue)a16).get(a45.add(k0))));
                    a45 = a45.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u25, org.luaj.vm2.LuaValue.varargsOf(a43, (org.luaj.vm2.Varargs)a44));
            }
        } else {
            if (this.u10.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a46 = a2;
                return a46;
            }
            if (this.u27[0].call(a2).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u28, org.luaj.vm2.LuaValue.varargsOf(a0, a2, (org.luaj.vm2.Varargs)a15));
            }
            if (this.u29.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a47 = a15;
                return a47;
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u30, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
    }
}
