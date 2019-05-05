package lang;
public class Lang$luaj$run_monad_helper extends org.luaj.vm2.lib.VarArgFunction {
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
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("\u5e8f\u7532");
    }
    
    public Lang$luaj$run_monad_helper() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        org.luaj.vm2.LuaValue a4 = a.arg(5);
        a.subargs(6);
        if (a4.eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a4 = org.luaj.vm2.LuaValue.FALSE;
        }
        Lang$luaj$run_monad_helper$make_bind a5 = new Lang$luaj$run_monad_helper$make_bind();
        a5.u0 = this.u0;
        org.luaj.vm2.LuaValue a6 = this.u1[0].call(a2);
        if (this.u2.call(a6).toboolean()) {
            org.luaj.vm2.LuaValue a7 = this.u3.call(a6);
            org.luaj.vm2.LuaValue a8 = this.u4.call(a6);
            if (this.u5[0].call(a7, this.u6).toboolean()) {
                org.luaj.vm2.LuaValue a9 = this.u1[0].call(a8);
                if (this.u7.call(a9).toboolean()) {
                    org.luaj.vm2.LuaValue a10 = this.u8.call(a9);
                    org.luaj.vm2.LuaValue a11 = this.u1[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a9).subargs(1)).arg1();
                    if (this.u10.call(a11).toboolean()) {
                        if (a4.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                            Lang$luaj$run_monad_helper$1 a12 = new Lang$luaj$run_monad_helper$1();
                            a12.u0 = a0;
                            a12.u1 = a10;
                            a12.u2 = a3;
                            org.luaj.vm2.Varargs a13 = a12;
                            return a13;
                        }
                        org.luaj.vm2.LuaValue a14 = this.u11;
                        org.luaj.vm2.LuaValue a15 = this.u12.call(a4, a10);
                        org.luaj.vm2.LuaValue[] a16 = new org.luaj.vm2.LuaValue[4];
                        a16[0] = a0;
                        a16[1] = a1;
                        a16[2] = a15;
                        a16[3] = a3;
                        return org.luaj.vm2.LuaValue.tailcallOf(a14, org.luaj.vm2.LuaValue.varargsOf(a16));
                    }
                }
            } else if (this.u5[0].call(a7, this.u13).toboolean()) {
                org.luaj.vm2.LuaValue a17 = this.u1[0].call(a8);
                if (this.u7.call(a17).toboolean()) {
                    org.luaj.vm2.LuaValue a18 = this.u8.call(a17);
                    org.luaj.vm2.LuaValue a19 = this.u1[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a17).subargs(1)).arg1();
                    if (this.u7.call(a19).toboolean()) {
                        org.luaj.vm2.LuaValue a20 = this.u8.call(a19);
                        org.luaj.vm2.LuaValue a21 = this.u1[0].invoke(this.u9.invoke((org.luaj.vm2.Varargs)a19).subargs(1)).arg1();
                        if (this.u10.call(a21).toboolean()) {
                            if (a4.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                                org.luaj.vm2.LuaValue a22 = this.u11;
                                org.luaj.vm2.LuaValue[] a23 = new org.luaj.vm2.LuaValue[4];
                                a23[0] = a0;
                                a23[1] = a1;
                                a23[2] = a18;
                                a23[3] = a20;
                                return org.luaj.vm2.LuaValue.tailcallOf(a22, org.luaj.vm2.LuaValue.varargsOf(a23));
                            }
                            org.luaj.vm2.LuaValue a24 = this.u14.call(k0);
                            org.luaj.vm2.LuaValue a25 = this.u11;
                            org.luaj.vm2.LuaValue a26 = this.u15;
                            org.luaj.vm2.LuaValue a27 = this.u16[0];
                            org.luaj.vm2.LuaValue a28 = this.u17;
                            org.luaj.vm2.LuaValue a29 = this.u17.call(a24);
                            org.luaj.vm2.LuaValue a30 = this.u17.call(this.u18.call(a20), a24);
                            org.luaj.vm2.Varargs a31 = this.u18.invoke((org.luaj.vm2.Varargs)a4);
                            org.luaj.vm2.LuaValue[] a32 = new org.luaj.vm2.LuaValue[1];
                            a32[0] = a30;
                            org.luaj.vm2.Varargs a33 = ((org.luaj.vm2.LuaValue)a5).invoke(org.luaj.vm2.LuaValue.varargsOf(a32, a31));
                            org.luaj.vm2.LuaValue[] a34 = new org.luaj.vm2.LuaValue[1];
                            a34[0] = a29;
                            org.luaj.vm2.Varargs a35 = a28.invoke(org.luaj.vm2.LuaValue.varargsOf(a34, a33));
                            org.luaj.vm2.LuaValue[] a36 = new org.luaj.vm2.LuaValue[1];
                            a36[0] = a27;
                            org.luaj.vm2.Varargs a37 = a26.invoke(org.luaj.vm2.LuaValue.varargsOf(a36, a35));
                            org.luaj.vm2.LuaValue[] a38 = new org.luaj.vm2.LuaValue[4];
                            a38[0] = a0;
                            a38[1] = a1;
                            a38[2] = a18;
                            a38[3] = a3;
                            return org.luaj.vm2.LuaValue.tailcallOf(a25, org.luaj.vm2.LuaValue.varargsOf(a38, a37));
                        }
                    }
                }
            }
        }
        if (a4.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            Lang$luaj$run_monad_helper$2 a39 = new Lang$luaj$run_monad_helper$2();
            a39.u0 = a1;
            a39.u1 = a6;
            a39.u2 = a3;
            a39.u3 = a0;
            org.luaj.vm2.Varargs a40 = a39;
            return a40;
        }
        Lang$luaj$run_monad_helper$3 a41 = new Lang$luaj$run_monad_helper$3();
        a41.u0 = a1;
        a41.u1 = a6;
        a41.u2 = a3;
        a41.u3 = this.u11;
        a41.u4 = a0;
        a41.u5 = this.u12;
        a41.u6 = a4;
        org.luaj.vm2.Varargs a42 = a41;
        return a42;
    }
}
