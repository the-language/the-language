package lang;
public class Lang$luaj$55 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue[] u12;
    org.luaj.vm2.LuaValue[] u13;
    org.luaj.vm2.LuaValue[] u14;
    org.luaj.vm2.LuaValue[] u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue[] u18;
    org.luaj.vm2.LuaValue[] u19;
    org.luaj.vm2.LuaValue[] u20;
    org.luaj.vm2.LuaValue u21;
    org.luaj.vm2.LuaValue u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue[] u24;
    org.luaj.vm2.LuaValue[] u25;
    org.luaj.vm2.LuaValue[] u26;
    org.luaj.vm2.LuaValue[] u27;
    org.luaj.vm2.LuaValue u28;
    org.luaj.vm2.LuaValue u29;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(32);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
        k3 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k4 = org.luaj.vm2.LuaValue.valueOf(2);
        k5 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$55() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        Lang$luaj$55.newupn();
        Lang$luaj$55.newupn();
        Lang$luaj$55.newupn();
        org.luaj.vm2.LuaValue[] a0 = Lang$luaj$55.newupn();
        org.luaj.vm2.LuaValue a1 = a.arg(1);
        org.luaj.vm2.LuaValue a2 = a.arg(2);
        org.luaj.vm2.LuaValue[] a3 = Lang$luaj$55.newupe();
        a3[0] = a2;
        org.luaj.vm2.LuaValue a4 = a.arg(3);
        org.luaj.vm2.LuaValue[] a5 = Lang$luaj$55.newupe();
        a5[0] = a4;
        org.luaj.vm2.LuaValue a6 = a.arg(4);
        org.luaj.vm2.LuaValue[] a7 = Lang$luaj$55.newupe();
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
        Lang$luaj$55$0 a11 = new Lang$luaj$55$0();
        a11.u0 = this.u0;
        a11.u1 = a0;
        a11.u2 = a7;
        Lang$luaj$55$1 a12 = new Lang$luaj$55$1();
        a12.u0 = a11;
        a12.u1 = this.u1;
        a12.u2 = this.u2;
        a12.u3 = a7;
        a12.u4 = a0;
        a12.u5 = this.u3;
        a12.u6 = a3;
        org.luaj.vm2.LuaTable a13 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        a0[0] = a1;
        Lang$luaj$55$replace_this_with_stopped a14 = new Lang$luaj$55$replace_this_with_stopped();
        a14.u0 = a5;
        a14.u1 = a12;
        a14.u2 = this.u4;
        Lang$luaj$55$make_history a15 = new Lang$luaj$55$make_history();
        a15.u0 = this.u5;
        a15.u1 = a13;
        a15.u2 = a3;
        org.luaj.vm2.LuaValue a16 = k0;
        label0: while(true) {
            if (this.u1.call(a0[0]).toboolean() && a16.lt_b(k1)) {
                this.u2.call(a7[0], a0[0]);
                a0[0] = this.u6[0].call(a0[0]);
                a16 = a16.add(k2);
                continue label0;
            }
            while(this.u1.call(a0[0]).toboolean()) {
                org.luaj.vm2.LuaValue a17 = this.u7[0].call(a0[0]);
                if (a3[0].get(a17).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (((org.luaj.vm2.LuaValue)a13).get(a17).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                    a5[0].set(k2, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
                    if (this.u8.call(a0[0]).toboolean()) {
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                    }
                    if (this.u9.call(a0[0]).toboolean()) {
                        org.luaj.vm2.LuaValue a18 = this.u10.call(a0[0]);
                        org.luaj.vm2.LuaValue a19 = this.u11.call(a0[0]);
                        org.luaj.vm2.LuaTable a20 = org.luaj.vm2.LuaValue.tableOf(8, 0);
                        org.luaj.vm2.LuaValue a21 = this.u12[0];
                        org.luaj.vm2.LuaValue a22 = this.u13[0];
                        org.luaj.vm2.LuaValue a23 = this.u14[0];
                        org.luaj.vm2.LuaValue a24 = this.u15[0];
                        org.luaj.vm2.LuaValue a25 = this.u16[0];
                        org.luaj.vm2.LuaValue a26 = this.u17[0];
                        org.luaj.vm2.LuaValue a27 = this.u18[0];
                        org.luaj.vm2.LuaValue a28 = this.u19[0];
                        ((org.luaj.vm2.LuaValue)a20).rawset(1, a21);
                        ((org.luaj.vm2.LuaValue)a20).rawset(2, a22);
                        ((org.luaj.vm2.LuaValue)a20).rawset(3, a23);
                        ((org.luaj.vm2.LuaValue)a20).rawset(4, a24);
                        ((org.luaj.vm2.LuaValue)a20).rawset(5, a25);
                        ((org.luaj.vm2.LuaValue)a20).rawset(6, a26);
                        ((org.luaj.vm2.LuaValue)a20).rawset(7, a27);
                        ((org.luaj.vm2.LuaValue)a20).rawset(8, a28);
                        org.luaj.vm2.LuaBoolean a29 = org.luaj.vm2.LuaValue.FALSE;
                        org.luaj.vm2.Varargs a30 = this.u5.get(k3).invoke((org.luaj.vm2.Varargs)a20);
                        org.luaj.vm2.LuaValue a31 = a30.arg1();
                        org.luaj.vm2.LuaValue a32 = a30.arg(2);
                        org.luaj.vm2.LuaValue a33 = a30.arg(3);
                        while(true) {
                            org.luaj.vm2.Varargs a34 = a31.invoke(a32, (org.luaj.vm2.Varargs)a33);
                            a33 = a34.arg1();
                            org.luaj.vm2.LuaValue a35 = a34.arg(2);
                            if (!a33.isnil()) {
                                if (!this.u20[0].call(a35, a18).toboolean()) {
                                    continue;
                                }
                                a29 = org.luaj.vm2.LuaValue.TRUE;
                            }
                            if (((org.luaj.vm2.LuaValue)a29).toboolean()) {
                                this.u21.call((org.luaj.vm2.LuaValue)((a19.len().eq_b(k2)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                                this.u21.call((org.luaj.vm2.LuaValue)((a5[0].get(k4).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                                org.luaj.vm2.LuaValue a36 = this.u3[0].call(a19.get(k2), ((org.luaj.vm2.LuaValue)a15).call(), a5[0]);
                                if (!a5[0].get(k4).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf(this.u23, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                org.luaj.vm2.LuaValue a37 = this.u22;
                                org.luaj.vm2.LuaTable a38 = org.luaj.vm2.LuaValue.tableOf(1, 0);
                                ((org.luaj.vm2.LuaValue)a38).rawset(1, a36);
                                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a12, a37.invoke(a18, (org.luaj.vm2.Varargs)a38).subargs(1));
                            } else {
                                if (this.u20[0].call(a18, this.u24[0]).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                if (this.u20[0].call(a18, this.u25[0]).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                if (this.u20[0].call(a18, this.u26[0]).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                if (!this.u20[0].call(a18, this.u27[0]).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf(this.u23, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                this.u21.call((org.luaj.vm2.LuaValue)((a19.len().eq_b(k5)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                                this.u21.call((org.luaj.vm2.LuaValue)((a5[0].get(k4).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                                org.luaj.vm2.LuaValue a39 = this.u3[0].call(a19.get(k2), ((org.luaj.vm2.LuaValue)a15).call(), a5[0]);
                                if (!a5[0].get(k4).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf(this.u23, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                org.luaj.vm2.LuaValue a40 = this.u22;
                                org.luaj.vm2.LuaValue a41 = this.u27[0];
                                org.luaj.vm2.LuaTable a42 = org.luaj.vm2.LuaValue.tableOf(3, 0);
                                org.luaj.vm2.LuaValue a43 = a19.get(k4);
                                org.luaj.vm2.LuaValue a44 = a19.get(k5);
                                ((org.luaj.vm2.LuaValue)a42).rawset(1, a39);
                                ((org.luaj.vm2.LuaValue)a42).rawset(2, a43);
                                ((org.luaj.vm2.LuaValue)a42).rawset(3, a44);
                                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a12, a40.invoke(a41, (org.luaj.vm2.Varargs)a42).subargs(1));
                            }
                        }
                    } else {
                        if (this.u28.call(a0[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (this.u29.call(a0[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        return org.luaj.vm2.LuaValue.tailcallOf(this.u23, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                    }
                } else {
                    ((org.luaj.vm2.LuaValue)a13).set(a17, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
                    this.u2.call(a7[0], a0[0]);
                    a0[0] = this.u6[0].call(a0[0]);
                }
            }
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a11, (org.luaj.vm2.Varargs)a0[0]);
        }
    }
}
