public class lang$luaj$44 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue[] u10;
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
    org.luaj.vm2.LuaValue u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue[] u25;
    org.luaj.vm2.LuaValue[] u26;
    org.luaj.vm2.LuaValue[] u27;
    org.luaj.vm2.LuaValue[] u28;
    org.luaj.vm2.LuaValue u29;
    org.luaj.vm2.LuaValue u30;
    org.luaj.vm2.LuaValue[] u31;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
        k3 = org.luaj.vm2.LuaValue.valueOf(3);
        k4 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
    }
    
    public lang$luaj$44() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        lang$luaj$44.newupn();
        lang$luaj$44.newupn();
        org.luaj.vm2.LuaValue[] a0 = lang$luaj$44.newupn();
        org.luaj.vm2.LuaValue a1 = a.arg(1);
        org.luaj.vm2.LuaValue a2 = a.arg(2);
        org.luaj.vm2.LuaValue[] a3 = lang$luaj$44.newupe();
        a3[0] = a2;
        org.luaj.vm2.LuaValue a4 = a.arg(3);
        org.luaj.vm2.LuaValue[] a5 = lang$luaj$44.newupe();
        a5[0] = a4;
        a.subargs(4);
        if (a3[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a3[0] = org.luaj.vm2.LuaValue.tableOf(0, 0);
        }
        if (a5[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            org.luaj.vm2.LuaTable a6 = org.luaj.vm2.LuaValue.tableOf(2, 0);
            a0[0] = org.luaj.vm2.LuaValue.FALSE;
            org.luaj.vm2.LuaBoolean a7 = org.luaj.vm2.LuaValue.FALSE;
            ((org.luaj.vm2.LuaValue)a6).rawset(1, a0[0]);
            ((org.luaj.vm2.LuaValue)a6).rawset(2, (org.luaj.vm2.LuaValue)a7);
            a5[0] = a6;
        }
        org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        a0[0] = a1;
        org.luaj.vm2.LuaTable a9 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        lang$luaj$44$0 a10 = new lang$luaj$44$0();
        a10.u0 = a5;
        a10.u1 = this.u0;
        a10.u2 = a0;
        a10.u3 = this.u1;
        a10.u4 = a9;
        org.luaj.vm2.LuaValue dummy0 = org.luaj.vm2.LuaValue.NIL;
        lang$luaj$44$1 a11 = new lang$luaj$44$1();
        a11.u0 = this.u0;
        a11.u1 = a0;
        a11.u2 = a9;
        a11.u3 = this.u2;
        a11.u4 = this.u3;
        org.luaj.vm2.LuaValue dummy1 = org.luaj.vm2.LuaValue.NIL;
        lang$luaj$44$2 a12 = new lang$luaj$44$2();
        a12.u0 = this.u4;
        a12.u1 = a8;
        a12.u2 = a3;
        while(this.u2.call(a0[0]).toboolean()) {
            org.luaj.vm2.LuaValue a13 = this.u5[0].call(a0[0]);
            if (a3[0].get(a13).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            if (((org.luaj.vm2.LuaValue)a8).get(a13).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                a5[0].set(k0, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
                if (this.u6.call(a0[0]).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (this.u7.call(a0[0]).toboolean()) {
                    org.luaj.vm2.LuaValue a14 = this.u8.call(a0[0]);
                    org.luaj.vm2.LuaValue a15 = this.u9.call(a0[0]);
                    org.luaj.vm2.LuaTable a16 = org.luaj.vm2.LuaValue.tableOf(11, 0);
                    org.luaj.vm2.LuaValue a17 = this.u10[0];
                    org.luaj.vm2.LuaValue a18 = this.u11[0];
                    org.luaj.vm2.LuaValue a19 = this.u12[0];
                    org.luaj.vm2.LuaValue a20 = this.u13[0];
                    org.luaj.vm2.LuaValue a21 = this.u14[0];
                    org.luaj.vm2.LuaValue a22 = this.u15[0];
                    org.luaj.vm2.LuaValue a23 = this.u16[0];
                    org.luaj.vm2.LuaValue a24 = this.u17[0];
                    org.luaj.vm2.LuaValue a25 = this.u18[0];
                    org.luaj.vm2.LuaValue a26 = this.u19[0];
                    org.luaj.vm2.LuaValue a27 = this.u20[0];
                    ((org.luaj.vm2.LuaValue)a16).rawset(1, a17);
                    ((org.luaj.vm2.LuaValue)a16).rawset(2, a18);
                    ((org.luaj.vm2.LuaValue)a16).rawset(3, a19);
                    ((org.luaj.vm2.LuaValue)a16).rawset(4, a20);
                    ((org.luaj.vm2.LuaValue)a16).rawset(5, a21);
                    ((org.luaj.vm2.LuaValue)a16).rawset(6, a22);
                    ((org.luaj.vm2.LuaValue)a16).rawset(7, a23);
                    ((org.luaj.vm2.LuaValue)a16).rawset(8, a24);
                    ((org.luaj.vm2.LuaValue)a16).rawset(9, a25);
                    ((org.luaj.vm2.LuaValue)a16).rawset(10, a26);
                    ((org.luaj.vm2.LuaValue)a16).rawset(11, a27);
                    org.luaj.vm2.LuaBoolean a28 = org.luaj.vm2.LuaValue.FALSE;
                    org.luaj.vm2.LuaValue a29 = k1;
                    while(a29.lt_b(((org.luaj.vm2.LuaValue)a16).len())) {
                        if (this.u21[0].call(((org.luaj.vm2.LuaValue)a16).get(a29.add(k0)), a14).toboolean()) {
                            a28 = org.luaj.vm2.LuaValue.TRUE;
                        }
                        a29 = a29.add(k0);
                    }
                    if (((org.luaj.vm2.LuaValue)a28).toboolean()) {
                        this.u22.call((org.luaj.vm2.LuaValue)((a15.len().eq_b(k0)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        this.u22.call((org.luaj.vm2.LuaValue)((a5[0].get(k2).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        org.luaj.vm2.LuaValue a30 = this.u3[0].call(a15.get(k0), ((org.luaj.vm2.LuaValue)a12).call(), a5[0]);
                        if (!a5[0].get(k2).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u24, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a31 = this.u23;
                        org.luaj.vm2.LuaTable a32 = org.luaj.vm2.LuaValue.tableOf(1, 0);
                        ((org.luaj.vm2.LuaValue)a32).rawset(1, a30);
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a11, a31.invoke(a14, (org.luaj.vm2.Varargs)a32).subargs(1));
                    } else {
                        if (this.u21[0].call(a14, this.u25[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (this.u21[0].call(a14, this.u26[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (this.u21[0].call(a14, this.u27[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (!this.u21[0].call(a14, this.u28[0]).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u24, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        this.u22.call((org.luaj.vm2.LuaValue)((a15.len().eq_b(k3)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        this.u22.call((org.luaj.vm2.LuaValue)((a5[0].get(k2).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                        org.luaj.vm2.LuaValue a33 = this.u3[0].call(a15.get(k0), ((org.luaj.vm2.LuaValue)a12).call(), a5[0]);
                        if (!a5[0].get(k2).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u24, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a34 = this.u23;
                        org.luaj.vm2.LuaValue a35 = this.u28[0];
                        org.luaj.vm2.LuaTable a36 = org.luaj.vm2.LuaValue.tableOf(3, 0);
                        org.luaj.vm2.LuaValue a37 = a15.get(k2);
                        org.luaj.vm2.LuaValue a38 = a15.get(k3);
                        ((org.luaj.vm2.LuaValue)a36).rawset(1, a33);
                        ((org.luaj.vm2.LuaValue)a36).rawset(2, a37);
                        ((org.luaj.vm2.LuaValue)a36).rawset(3, a38);
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a11, a34.invoke(a35, (org.luaj.vm2.Varargs)a36).subargs(1));
                    }
                } else {
                    if (this.u29.call(a0[0]).toboolean()) {
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                    }
                    if (this.u30.call(a0[0]).toboolean()) {
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                    }
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u24, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
            } else {
                ((org.luaj.vm2.LuaValue)a8).set(a13, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
                this.u4.get(k4).call((org.luaj.vm2.LuaValue)a9, a0[0]);
                a0[0] = this.u31[0].call(a0[0]);
            }
        }
        org.luaj.vm2.LuaValue a39 = k1;
        while(a39.lt_b(((org.luaj.vm2.LuaValue)a9).len())) {
            this.u0.call(((org.luaj.vm2.LuaValue)a9).get(a39.add(k0)), a0[0]);
            a39 = a39.add(k0);
        }
        org.luaj.vm2.Varargs a40 = a0[0];
        return a40;
    }
}
