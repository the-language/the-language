package lang;
public class Lang$luaj$63 extends org.luaj.vm2.lib.VarArgFunction {
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
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$63() {
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
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        Lang$luaj$63$0 a5 = new Lang$luaj$63$0();
        a5.u0 = this.u2;
        a5.u1 = this.u3;
        a5.u2 = this.u4;
        a5.u3 = this.u5;
        a5.u4 = this.u6;
        a5.u5 = this.u7;
        a5.u6 = a0;
        a5.u7 = a3;
        if (this.u8.call(a3).toboolean()) {
            org.luaj.vm2.LuaTable a6 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            while(!this.u9.call(a3).toboolean()) {
                if (this.u1.call(a3).toboolean()) {
                    org.luaj.vm2.Varargs a7 = a2;
                    return a7;
                }
                if (!this.u8.call(a3).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a8 = this.u10;
                org.luaj.vm2.Varargs a9 = this.u11.invoke((org.luaj.vm2.Varargs)a3);
                org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[1];
                a10[0] = a6;
                a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
                a3 = this.u0[0].invoke(this.u12.invoke((org.luaj.vm2.Varargs)a3).subargs(1)).arg1();
            }
            if (this.u13[0].call(((org.luaj.vm2.LuaValue)a6).get(k0), this.u14[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a6).len().eq_b(k0)) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a11 = ((org.luaj.vm2.LuaValue)a6).get(k1);
                org.luaj.vm2.LuaTable a12 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a13 = k1;
                while(a13.lt_b(((org.luaj.vm2.LuaValue)a6).len())) {
                    this.u10.call((org.luaj.vm2.LuaValue)a12, ((org.luaj.vm2.LuaValue)a6).get(a13.add(k0)));
                    a13 = a13.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u15, org.luaj.vm2.LuaValue.varargsOf(a0, a11, (org.luaj.vm2.Varargs)a12));
            } else if (this.u13[0].call(((org.luaj.vm2.LuaValue)a6).get(k0), this.u16[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a6).len().eq_b(k0)) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a14 = this.u17[0].invoke(this.u18.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a6).get(k1)).subargs(1)).arg1();
                if (!this.u19.call(a14).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a15 = this.u0[0].invoke(this.u20.invoke((org.luaj.vm2.Varargs)a14).subargs(1)).arg1();
                if (this.u1.call(a15).toboolean()) {
                    org.luaj.vm2.Varargs a16 = a2;
                    return a16;
                }
                if (!this.u21.call(a15).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (!this.u22.call(a15, this.u23[0]).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a17 = this.u0[0].invoke(this.u24.invoke((org.luaj.vm2.Varargs)a14).subargs(1)).arg1();
                if (this.u1.call(a17).toboolean()) {
                    org.luaj.vm2.Varargs a18 = a2;
                    return a18;
                }
                if (!this.u8.call(a17).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a19 = this.u11.call(a17);
                org.luaj.vm2.LuaValue a20 = this.u0[0].invoke(this.u12.invoke((org.luaj.vm2.Varargs)a17).subargs(1)).arg1();
                if (this.u1.call(a20).toboolean()) {
                    org.luaj.vm2.Varargs a21 = a2;
                    return a21;
                }
                if (!this.u9.call(a20).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaTable a22 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                ((org.luaj.vm2.LuaValue)a22).rawsetlist(1, this.u7.invoke((org.luaj.vm2.Varargs)a0));
                org.luaj.vm2.LuaValue a23 = k1;
                while(a23.lt_b(((org.luaj.vm2.LuaValue)a6).len())) {
                    this.u10.call((org.luaj.vm2.LuaValue)a22, ((org.luaj.vm2.LuaValue)a6).get(a23.add(k0)));
                    a23 = a23.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u25, org.luaj.vm2.LuaValue.varargsOf(a19, (org.luaj.vm2.Varargs)a22));
            } else if (this.u13[0].call(((org.luaj.vm2.LuaValue)a6).get(k0), this.u5[0]).toboolean()) {
                if (((org.luaj.vm2.LuaValue)a6).len().eq_b(k0)) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a24 = ((org.luaj.vm2.LuaValue)a6).get(k1);
                org.luaj.vm2.LuaTable a25 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a26 = k1;
                while(a26.lt_b(((org.luaj.vm2.LuaValue)a6).len())) {
                    org.luaj.vm2.LuaValue a27 = this.u10;
                    org.luaj.vm2.Varargs a28 = this.u18.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a6).get(a26.add(k0)));
                    org.luaj.vm2.LuaValue[] a29 = new org.luaj.vm2.LuaValue[1];
                    a29[0] = a25;
                    a27.invoke(org.luaj.vm2.LuaValue.varargsOf(a29, a28));
                    a26 = a26.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u26, org.luaj.vm2.LuaValue.varargsOf(a24, (org.luaj.vm2.Varargs)a25));
            } else {
                org.luaj.vm2.LuaValue a30 = this.u18.call(a0, ((org.luaj.vm2.LuaValue)a6).get(k0));
                org.luaj.vm2.LuaTable a31 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                org.luaj.vm2.LuaValue a32 = k0;
                while(a32.lt_b(((org.luaj.vm2.LuaValue)a6).len())) {
                    org.luaj.vm2.LuaValue a33 = this.u10;
                    org.luaj.vm2.Varargs a34 = this.u18.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a6).get(a32.add(k0)));
                    org.luaj.vm2.LuaValue[] a35 = new org.luaj.vm2.LuaValue[1];
                    a35[0] = a31;
                    a33.invoke(org.luaj.vm2.LuaValue.varargsOf(a35, a34));
                    a32 = a32.add(k0);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u25, org.luaj.vm2.LuaValue.varargsOf(a30, (org.luaj.vm2.Varargs)a31));
            }
        } else {
            if (this.u9.call(a3).toboolean()) {
                org.luaj.vm2.Varargs a36 = a3;
                return a36;
            }
            if (this.u27[0].call(a3).toboolean()) {
                org.luaj.vm2.LuaValue a37 = this.u28;
                org.luaj.vm2.Varargs a38 = ((org.luaj.vm2.LuaValue)a5).invoke();
                org.luaj.vm2.LuaValue[] a39 = new org.luaj.vm2.LuaValue[2];
                a39[0] = a0;
                a39[1] = a3;
                return org.luaj.vm2.LuaValue.tailcallOf(a37, org.luaj.vm2.LuaValue.varargsOf(a39, a38));
            }
            if (this.u29.call(a3).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u30, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
    }
}
