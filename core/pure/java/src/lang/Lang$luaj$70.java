package lang;
public class Lang$luaj$70 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue u9;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
        k3 = org.luaj.vm2.LuaString.valueOf("length");
        k4 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$70() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        org.luaj.vm2.LuaValue a4 = a.arg(5);
        a.subargs(6);
        if (a1.len().eq_b(k0)) {
            org.luaj.vm2.LuaValue a5 = this.u0;
            org.luaj.vm2.LuaValue a6 = this.u1.call(a0);
            label3: if (!a6.toboolean()) {
                boolean b = a0.get(k1).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
                label0: {
                    label2: {
                        label1: {
                            if (b) {
                                break label1;
                            }
                            break label2;
                        }
                        if (a0.get(k2).get(k3).eq_b(k0)) {
                            break label0;
                        }
                    }
                    a6 = org.luaj.vm2.LuaValue.FALSE;
                    break label3;
                }
                a6 = org.luaj.vm2.LuaValue.TRUE;
            }
            a5.call(a6);
            a3.set(k1, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
            a3.set(k2, a1);
            a3.set(k4, a2);
            return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)a4);
        } else {
            if (!a0.get(k1).toboolean()) {
                org.luaj.vm2.LuaValue a7 = this.u7;
                Lang$luaj$70$1 a8 = new Lang$luaj$70$1();
                a8.u0 = this.u8;
                a8.u1 = this.u6;
                a8.u2 = a0;
                a8.u3 = a1;
                a8.u4 = a2;
                a8.u5 = a3;
                a8.u6 = a4;
                return org.luaj.vm2.LuaValue.tailcallOf(a7, (org.luaj.vm2.Varargs)a8);
            }
            org.luaj.vm2.LuaValue a9 = this.u3.call(a0);
            org.luaj.vm2.LuaValue a10 = a9.get(k1);
            a3.set(k1, a10);
            org.luaj.vm2.LuaValue a11 = a9.get(k2);
            a3.set(k2, a11);
            org.luaj.vm2.LuaValue a12 = a9.get(k4);
            a3.set(k4, a12);
            org.luaj.vm2.LuaValue a13 = this.u4.call(a1);
            org.luaj.vm2.LuaValue a14 = a13.get(k1);
            org.luaj.vm2.LuaValue a15 = a13.get(k2);
            org.luaj.vm2.LuaValue[] a16 = Lang$luaj$70.newupe();
            a16[0] = a3;
            org.luaj.vm2.LuaValue a17 = k0;
            while(a17.lt_b(a14.len())) {
                org.luaj.vm2.LuaValue a18 = null;
                org.luaj.vm2.LuaValue a19 = a14.get(a17.add(k1));

                if (a16[0].get(k2).get(a19).eq_b(org.luaj.vm2.LuaValue.NIL)) {
                    org.luaj.vm2.LuaTable a20 = org.luaj.vm2.LuaValue.tableOf(3, 0);
                    org.luaj.vm2.LuaBoolean a21 = org.luaj.vm2.LuaValue.TRUE;
                    org.luaj.vm2.LuaTable a22 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                    org.luaj.vm2.LuaValue a23 = org.luaj.vm2.LuaValue.NIL;
                    ((org.luaj.vm2.LuaValue)a20).rawset(1, (org.luaj.vm2.LuaValue)a21);
                    ((org.luaj.vm2.LuaValue)a20).rawset(2, (org.luaj.vm2.LuaValue)a22);
                    ((org.luaj.vm2.LuaValue)a20).rawset(3, a23);
                    a18 = a20;
                } else {
                    org.luaj.vm2.LuaValue a24 = a16[0].get(k2).get(a19);
                    if (a24.get(k0).toboolean()) {
                        a18 = this.u3.call(a24);
                    } else {
                        if (a24.get(k1).get(k3).eq_b(k0)) {
                            this.u0.call((org.luaj.vm2.LuaValue)((a17.eq_b(a14.len().sub(k1))) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
                            org.luaj.vm2.LuaValue a25 = this.u5.call();
                            a16[0].get(k2).set(a19, a25);
                            a25.set(k1, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
                            a25.set(k2, a15);
                            a25.set(k4, a2);
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)a4);
                        }
                        a18 = this.u6.call(a24);
                    }
                }
                this.u0.call((org.luaj.vm2.LuaValue)((a18.eq_b(org.luaj.vm2.LuaValue.NIL)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE));
                a16[0].get(k2).set(a19, a18);
                a16[0] = a18;
                a17 = a17.add(k1);
            }
            if (!this.u1.call(a16[0]).toboolean()) {
                org.luaj.vm2.LuaValue a26 = this.u7;
                Lang$luaj$70$0 a27 = new Lang$luaj$70$0();
                a27.u0 = this.u8;
                a27.u1 = a16;
                a27.u2 = a15;
                a27.u3 = a2;
                a27.u4 = a4;
                return org.luaj.vm2.LuaValue.tailcallOf(a26, (org.luaj.vm2.Varargs)a27);
            }
            org.luaj.vm2.LuaValue a28 = a16[0];
            a28.set(k1, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
            a28.set(k2, a15);
            a28.set(k4, a2);
            return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)a4);
        }
    }
}
