package lang;
public class Lang$luaj$w$1 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("\u5e8f\u7532");
    }
    
    public Lang$luaj$w$1() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        Lang$luaj$w$1.newupn();
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        org.luaj.vm2.LuaValue a4 = a.arg(5);
        org.luaj.vm2.LuaValue[] a5 = Lang$luaj$w$1.newupe();
        a5[0] = a4;
        a.subargs(6);
        if (a5[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a5[0] = org.luaj.vm2.LuaValue.FALSE;
        }
        Lang$luaj$w$1$g a6 = new Lang$luaj$w$1$g();
        a6.u0 = this.u0;
        org.luaj.vm2.LuaValue a7 = this.u1[0].call(a2);
        if (this.u2.call(a7).toboolean()) {
            org.luaj.vm2.LuaValue a8 = this.u3.call(a7);
            org.luaj.vm2.LuaValue a9 = this.u4.call(a7);
            if (this.u5[0].call(a8, this.u6).toboolean()) {
                org.luaj.vm2.LuaValue a10 = this.u1[0].call(a9);
                if (this.u7.call(a10).toboolean()) {
                    org.luaj.vm2.LuaValue a11 = this.u8.call(a10);
                    org.luaj.vm2.LuaValue a12 = this.u1[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a10).subargs(1)).arg1();
                    if (this.u10.call(a12).toboolean()) {
                        if (a5[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                            org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
                            Lang$luaj$w$1$1 a13 = new Lang$luaj$w$1$1();
                            a13.u0 = a0;
                            a13.u1 = a11;
                            a13.u2 = a3;
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u11, (org.luaj.vm2.Varargs)a13);
                        }
                        org.luaj.vm2.LuaValue dummy0 = org.luaj.vm2.LuaValue.NIL;
                        org.luaj.vm2.LuaValue dummy1 = org.luaj.vm2.LuaValue.NIL;
                        org.luaj.vm2.LuaValue dummy2 = org.luaj.vm2.LuaValue.NIL;
                        Lang$luaj$w$1$2 a14 = new Lang$luaj$w$1$2();
                        a14.u0 = this.u12;
                        a14.u1 = a0;
                        a14.u2 = a1;
                        a14.u3 = this.u13;
                        a14.u4 = a5;
                        a14.u5 = a11;
                        a14.u6 = a3;
                        return org.luaj.vm2.LuaValue.tailcallOf(this.u11, (org.luaj.vm2.Varargs)a14);
                    }
                }
            } else if (this.u5[0].call(a8, this.u14).toboolean()) {
                org.luaj.vm2.LuaValue a15 = this.u1[0].call(a9);
                if (this.u7.call(a15).toboolean()) {
                    org.luaj.vm2.LuaValue a16 = this.u8.call(a15);
                    org.luaj.vm2.LuaValue a17 = this.u1[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a15).subargs(1)).arg1();
                    if (this.u7.call(a17).toboolean()) {
                        org.luaj.vm2.LuaValue a18 = this.u8.call(a17);
                        org.luaj.vm2.LuaValue a19 = this.u1[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a17).subargs(1)).arg1();
                        if (this.u10.call(a19).toboolean()) {
                            if (a5[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                                org.luaj.vm2.LuaValue dummy3 = org.luaj.vm2.LuaValue.NIL;
                                org.luaj.vm2.LuaValue dummy4 = org.luaj.vm2.LuaValue.NIL;
                                org.luaj.vm2.LuaValue dummy5 = org.luaj.vm2.LuaValue.NIL;
                                Lang$luaj$w$1$3 a20 = new Lang$luaj$w$1$3();
                                a20.u0 = this.u12;
                                a20.u1 = a0;
                                a20.u2 = a1;
                                a20.u3 = a16;
                                a20.u4 = a3;
                                a20.u5 = a18;
                                return org.luaj.vm2.LuaValue.tailcallOf(this.u11, (org.luaj.vm2.Varargs)a20);
                            }
                            org.luaj.vm2.LuaValue dummy6 = org.luaj.vm2.LuaValue.NIL;
                            org.luaj.vm2.LuaValue dummy7 = org.luaj.vm2.LuaValue.NIL;
                            org.luaj.vm2.LuaValue a21 = a5[0];
                            org.luaj.vm2.LuaValue a22 = this.u15.call(k0);
                            org.luaj.vm2.LuaValue dummy8 = org.luaj.vm2.LuaValue.NIL;
                            Lang$luaj$w$1$4 a23 = new Lang$luaj$w$1$4();
                            a23.u0 = this.u12;
                            a23.u1 = a0;
                            a23.u2 = a1;
                            a23.u3 = a16;
                            a23.u4 = a3;
                            a23.u5 = this.u16;
                            a23.u6 = this.u17;
                            a23.u7 = this.u18;
                            a23.u8 = a22;
                            a23.u9 = a6;
                            a23.u10 = this.u19;
                            a23.u11 = a18;
                            a23.u12 = a21;
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u11, (org.luaj.vm2.Varargs)a23);
                        }
                    }
                }
            }
        }
        if (a5[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            org.luaj.vm2.LuaValue a24 = this.u11;
            Lang$luaj$w$1$5 a25 = new Lang$luaj$w$1$5();
            a25.u0 = a1;
            a25.u1 = a7;
            a25.u2 = a3;
            a25.u3 = a0;
            return org.luaj.vm2.LuaValue.tailcallOf(a24, (org.luaj.vm2.Varargs)a25);
        }
        org.luaj.vm2.LuaValue a26 = this.u11;
        Lang$luaj$w$1$6 a27 = new Lang$luaj$w$1$6();
        a27.u0 = a1;
        a27.u1 = a7;
        a27.u2 = a3;
        a27.u3 = this.u11;
        a27.u4 = this.u12;
        a27.u5 = a0;
        a27.u6 = this.u13;
        a27.u7 = a5;
        return org.luaj.vm2.LuaValue.tailcallOf(a26, (org.luaj.vm2.Varargs)a27);
    }
}
