package lang;
public class Lang$luaj$67 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue u9;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
        k3 = org.luaj.vm2.LuaString.valueOf("length");
        k4 = org.luaj.vm2.LuaValue.valueOf(3);
        k5 = org.luaj.vm2.LuaString.valueOf("ipairs");
    }
    
    public Lang$luaj$67() {
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
            return org.luaj.vm2.LuaValue.tailcallOf(this.u2[0], (org.luaj.vm2.Varargs)a4);
        } else {
            if (!a0.get(k1).toboolean()) {
                org.luaj.vm2.LuaValue a7 = this.u7[0];
                Lang$luaj$67$1 a8 = new Lang$luaj$67$1();
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
            org.luaj.vm2.LuaValue[] a16 = Lang$luaj$67.newupe();
            a16[0] = a3;
            org.luaj.vm2.Varargs a17 = this.u5.get(k5).invoke((org.luaj.vm2.Varargs)a14);
            org.luaj.vm2.LuaValue a18 = a17.arg1();
            org.luaj.vm2.LuaValue a19 = a17.arg(2);
            org.luaj.vm2.LuaValue a20 = a17.arg(3);
            while(true) {
                org.luaj.vm2.Varargs a21 = a18.invoke(a19, (org.luaj.vm2.Varargs)a20);
                a20 = a21.arg1();
                org.luaj.vm2.LuaValue a22 = a21.arg(2);
                if (a20.isnil()) {
                    if (!this.u1.call(a16[0]).toboolean()) {
                        org.luaj.vm2.LuaValue a23 = this.u7[0];
                        Lang$luaj$67$0 a24 = new Lang$luaj$67$0();
                        a24.u0 = this.u8;
                        a24.u1 = a16;
                        a24.u2 = a15;
                        a24.u3 = a2;
                        a24.u4 = a4;
                        return org.luaj.vm2.LuaValue.tailcallOf(a23, (org.luaj.vm2.Varargs)a24);
                    }
                    org.luaj.vm2.LuaValue a25 = a16[0];
                    a25.set(k1, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
                    a25.set(k2, a15);
                    a25.set(k4, a2);
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u2[0], (org.luaj.vm2.Varargs)a4);
                } else {
                    org.luaj.vm2.LuaValue a26 = null;

                    if (a16[0].get(k2).get(a22).eq_b(org.luaj.vm2.LuaValue.NIL)) {
                        org.luaj.vm2.LuaTable a27 = org.luaj.vm2.LuaValue.tableOf(3, 0);
                        org.luaj.vm2.LuaBoolean a28 = org.luaj.vm2.LuaValue.TRUE;
                        org.luaj.vm2.LuaTable a29 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                        org.luaj.vm2.LuaValue a30 = org.luaj.vm2.LuaValue.NIL;
                        ((org.luaj.vm2.LuaValue)a27).rawset(1, (org.luaj.vm2.LuaValue)a28);
                        ((org.luaj.vm2.LuaValue)a27).rawset(2, (org.luaj.vm2.LuaValue)a29);
                        ((org.luaj.vm2.LuaValue)a27).rawset(3, a30);
                        a26 = a27;
                    } else {
                        org.luaj.vm2.LuaValue a31 = a16[0].get(k2).get(a22);
                        a26 = (a31.get(k0).toboolean()) ? this.u3.call(a31) : this.u6.call(a31);
                    }
                    this.u0.call((org.luaj.vm2.LuaValue)((a26.eq_b(org.luaj.vm2.LuaValue.NIL)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE));
                    a16[0].get(k2).set(a22, a26);
                    a16[0] = a26;
                }
            }
        }
    }
}
