package lang;
public class lang_luaj$44 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue[] u12;
    org.luaj.vm2.LuaValue[] u13;
    org.luaj.vm2.LuaValue[] u14;
    org.luaj.vm2.LuaValue[] u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue[] u18;
    org.luaj.vm2.LuaValue[] u19;
    org.luaj.vm2.LuaValue[] u20;
    org.luaj.vm2.LuaValue[] u21;
    org.luaj.vm2.LuaValue[] u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue u25;
    org.luaj.vm2.LuaValue[] u26;
    org.luaj.vm2.LuaValue[] u27;
    org.luaj.vm2.LuaValue[] u28;
    org.luaj.vm2.LuaValue[] u29;
    org.luaj.vm2.LuaValue u30;
    org.luaj.vm2.LuaValue u31;
    org.luaj.vm2.LuaValue[] u32;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
        k3 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public lang_luaj$44() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        lang_luaj$44.newupn();
        lang_luaj$44.newupn();
        lang_luaj$44.newupn();
        org.luaj.vm2.LuaValue[] a0 = lang_luaj$44.newupn();
        org.luaj.vm2.LuaValue a1 = a.arg(1);
        org.luaj.vm2.LuaValue a2 = a.arg(2);
        org.luaj.vm2.LuaValue[] a3 = lang_luaj$44.newupe();
        a3[0] = a2;
        org.luaj.vm2.LuaValue a4 = a.arg(3);
        org.luaj.vm2.LuaValue[] a5 = lang_luaj$44.newupe();
        a5[0] = a4;
        org.luaj.vm2.LuaValue a6 = a.arg(4);
        org.luaj.vm2.LuaValue[] a7 = lang_luaj$44.newupe();
        a7[0] = a6;
        a.subargs(5);
        if (a3[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a0[0] = org.luaj.vm2.LuaValue.tableOf(0, 0);
            a3[0] = a0[0];
        }
        if (a5[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a0[0] = org.luaj.vm2.LuaValue.tableOf(2, 0);
            org.luaj.vm2.LuaBoolean a8 = org.luaj.vm2.LuaValue.FALSE;
            org.luaj.vm2.LuaBoolean a9 = org.luaj.vm2.LuaValue.FALSE;
            org.luaj.vm2.LuaValue a10 = a0[0];
            a10.rawset(1, (org.luaj.vm2.LuaValue)a8);
            a10.rawset(2, (org.luaj.vm2.LuaValue)a9);
            a5[0] = a0[0];
        }
        if (a7[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a0[0] = org.luaj.vm2.LuaValue.tableOf(0, 0);
            a7[0] = a0[0];
        }
        a0[0] = org.luaj.vm2.LuaValue.NIL;
        lang_luaj$44$0 a11 = new lang_luaj$44$0();
        a11.u0 = this.u0;
        a11.u1 = a0;
        a11.u2 = a7;
        lang_luaj$44$1 a12 = new lang_luaj$44$1();
        a12.u0 = a11;
        a12.u1 = this.u1;
        a12.u2 = this.u2;
        a12.u3 = a7;
        a12.u4 = a0;
        a12.u5 = this.u3;
        a12.u6 = a3;
        org.luaj.vm2.LuaTable a13 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        a0[0] = a1;
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        lang_luaj$44$2 a14 = new lang_luaj$44$2();
        a14.u0 = a5;
        a14.u1 = a12;
        a14.u2 = this.u4;
        org.luaj.vm2.LuaValue dummy0 = org.luaj.vm2.LuaValue.NIL;
        lang_luaj$44$3 a15 = new lang_luaj$44$3();
        a15.u0 = this.u5;
        a15.u1 = a13;
        a15.u2 = a3;
        while(this.u1.call(a0[0]).toboolean()) {
            org.luaj.vm2.LuaValue a16 = this.u6[0].call(a0[0]);
            if (a3[0].get(a16).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            if (((org.luaj.vm2.LuaValue)a13).get(a16).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                a5[0].set(k0, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
                if (this.u7.call(a0[0]).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (this.u8.call(a0[0]).toboolean()) {
                    org.luaj.vm2.LuaValue a17 = this.u9.call(a0[0]);
                    org.luaj.vm2.LuaValue a18 = this.u10.call(a0[0]);
                    org.luaj.vm2.LuaTable a19 = org.luaj.vm2.LuaValue.tableOf(11, 0);
                    org.luaj.vm2.LuaValue a20 = this.u11[0];
                    org.luaj.vm2.LuaValue a21 = this.u12[0];
                    org.luaj.vm2.LuaValue a22 = this.u13[0];
                    org.luaj.vm2.LuaValue a23 = this.u14[0];
                    org.luaj.vm2.LuaValue a24 = this.u15[0];
                    org.luaj.vm2.LuaValue a25 = this.u16[0];
                    org.luaj.vm2.LuaValue a26 = this.u17[0];
                    org.luaj.vm2.LuaValue a27 = this.u18[0];
                    org.luaj.vm2.LuaValue a28 = this.u19[0];
                    org.luaj.vm2.LuaValue a29 = this.u20[0];
                    org.luaj.vm2.LuaValue a30 = this.u21[0];
                    ((org.luaj.vm2.LuaValue)a19).rawset(1, a20);
                    ((org.luaj.vm2.LuaValue)a19).rawset(2, a21);
                    ((org.luaj.vm2.LuaValue)a19).rawset(3, a22);
                    ((org.luaj.vm2.LuaValue)a19).rawset(4, a23);
                    ((org.luaj.vm2.LuaValue)a19).rawset(5, a24);
                    ((org.luaj.vm2.LuaValue)a19).rawset(6, a25);
                    ((org.luaj.vm2.LuaValue)a19).rawset(7, a26);
                    ((org.luaj.vm2.LuaValue)a19).rawset(8, a27);
                    ((org.luaj.vm2.LuaValue)a19).rawset(9, a28);
                    ((org.luaj.vm2.LuaValue)a19).rawset(10, a29);
                    ((org.luaj.vm2.LuaValue)a19).rawset(11, a30);
                    org.luaj.vm2.LuaBoolean a31 = org.luaj.vm2.LuaValue.FALSE;
                    org.luaj.vm2.LuaValue a32 = k1;
                    while(a32.lt_b(((org.luaj.vm2.LuaValue)a19).len())) {
                        if (this.u22[0].call(((org.luaj.vm2.LuaValue)a19).get(a32.add(k0)), a17).toboolean()) {
                            a31 = org.luaj.vm2.LuaValue.TRUE;
                        }
                        a32 = a32.add(k0);
                    }
                    if (((org.luaj.vm2.LuaValue)a31).toboolean()) {
                        this.u23.call((org.luaj.vm2.LuaValue)((a18.len().eq_b(k0)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        this.u23.call((org.luaj.vm2.LuaValue)((a5[0].get(k2).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        org.luaj.vm2.LuaValue a33 = this.u3[0].call(a18.get(k0), ((org.luaj.vm2.LuaValue)a15).call(), a5[0]);
                        if (!a5[0].get(k2).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u25, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a34 = this.u24;
                        org.luaj.vm2.LuaTable a35 = org.luaj.vm2.LuaValue.tableOf(1, 0);
                        ((org.luaj.vm2.LuaValue)a35).rawset(1, a33);
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a12, a34.invoke(a17, (org.luaj.vm2.Varargs)a35).subargs(1));
                    } else {
                        if (this.u22[0].call(a17, this.u26[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (this.u22[0].call(a17, this.u27[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (this.u22[0].call(a17, this.u28[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (!this.u22[0].call(a17, this.u29[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u25, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        this.u23.call((org.luaj.vm2.LuaValue)((a18.len().eq_b(k3)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        this.u23.call((org.luaj.vm2.LuaValue)((a5[0].get(k2).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        org.luaj.vm2.LuaValue a36 = this.u3[0].call(a18.get(k0), ((org.luaj.vm2.LuaValue)a15).call(), a5[0]);
                        if (!a5[0].get(k2).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u25, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a37 = this.u24;
                        org.luaj.vm2.LuaValue a38 = this.u29[0];
                        org.luaj.vm2.LuaTable a39 = org.luaj.vm2.LuaValue.tableOf(3, 0);
                        org.luaj.vm2.LuaValue a40 = a18.get(k2);
                        org.luaj.vm2.LuaValue a41 = a18.get(k3);
                        ((org.luaj.vm2.LuaValue)a39).rawset(1, a36);
                        ((org.luaj.vm2.LuaValue)a39).rawset(2, a40);
                        ((org.luaj.vm2.LuaValue)a39).rawset(3, a41);
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a12, a37.invoke(a38, (org.luaj.vm2.Varargs)a39).subargs(1));
                    }
                } else {
                    if (this.u30.call(a0[0]).toboolean()) {
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                    }
                    if (this.u31.call(a0[0]).toboolean()) {
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                    }
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u25, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
            } else {
                ((org.luaj.vm2.LuaValue)a13).set(a16, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
                this.u2.call(a7[0], a0[0]);
                a0[0] = this.u32[0].call(a0[0]);
            }
        }
        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a11, (org.luaj.vm2.Varargs)a0[0]);
    }
}
