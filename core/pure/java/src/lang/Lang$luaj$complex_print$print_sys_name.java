package lang;
public class Lang$luaj$complex_print$print_sys_name extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue[] u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue[] u18;
    org.luaj.vm2.LuaValue u19;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    final static org.luaj.vm2.LuaValue k7;
    final static org.luaj.vm2.LuaValue k8;
    final static org.luaj.vm2.LuaValue k9;
    final static org.luaj.vm2.LuaValue k10;
    final static org.luaj.vm2.LuaValue k11;
    final static org.luaj.vm2.LuaValue k12;
    final static org.luaj.vm2.LuaValue k13;
    final static org.luaj.vm2.LuaValue k14;
    final static org.luaj.vm2.LuaValue k15;
    final static org.luaj.vm2.LuaValue k16;
    final static org.luaj.vm2.LuaValue k17;
    final static org.luaj.vm2.LuaValue k18;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(3);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
        k4 = org.luaj.vm2.LuaString.valueOf("inner");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("@");
        k7 = org.luaj.vm2.LuaString.valueOf(":>");
        k8 = org.luaj.vm2.LuaString.valueOf("?");
        k9 = org.luaj.vm2.LuaString.valueOf(":&>");
        k10 = org.luaj.vm2.LuaString.valueOf("_");
        k11 = org.luaj.vm2.LuaString.valueOf("");
        k12 = org.luaj.vm2.LuaString.valueOf(":");
        k13 = org.luaj.vm2.LuaString.valueOf("&+");
        k14 = org.luaj.vm2.LuaString.valueOf("&");
        k15 = org.luaj.vm2.LuaString.valueOf("~");
        k16 = org.luaj.vm2.LuaString.valueOf("+");
        k17 = org.luaj.vm2.LuaString.valueOf("/");
        k18 = org.luaj.vm2.LuaString.valueOf("top");
    }
    
    public Lang$luaj$complex_print$print_sys_name() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        if (this.u0.call(a0).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)a0);
        }
        Lang$luaj$complex_print$print_sys_name$inner_bracket a2 = new Lang$luaj$complex_print$print_sys_name$inner_bracket();
        a2.u0 = a1;
        a2.u1 = this.u2;
        a2.u2 = this.u3;
        org.luaj.vm2.LuaValue a3 = this.u4.call(a0);
        if (!a3.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a3.len().eq_b(k0) && this.u5.call(a3.get(k1), this.u6).toboolean()) {
            org.luaj.vm2.LuaValue a4 = null;
            org.luaj.vm2.LuaValue a5 = this.u4.call(a3.get(k2));
            if (!a5.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a5.len().eq_b(k0) && this.u5.call(a5.get(k1), this.u7[0]).toboolean()) {
                org.luaj.vm2.LuaValue a6 = a5.get(k2);
                org.luaj.vm2.LuaValue a7 = this.u4.call(a6);
                if (!a7.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a7.len().eq_b(k1) && this.u5.call(a5.get(k0), this.u8).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)this.u2.get(k3).invoke(this.u9.invoke(a7.get(k1), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().concat(k5.concat(this.u2.get(k3).invoke(this.u9.invoke(a3.get(k0), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().buffer())).value());
                }
                if (this.u10.call(a6).toboolean() && this.u5.call(this.u11.call(a6), this.u8).toboolean() && this.u5.call(a5.get(k0), this.u8).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)this.u2.get(k3).invoke(this.u9.invoke(this.u12.call(a6), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().concat(k6.concat(this.u2.get(k3).invoke(this.u9.invoke(a3.get(k0), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().buffer())).value());
                }
                if (this.u5.call(a6, this.u8).toboolean() && this.u5.call(a3.get(k0), this.u13).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)k7.concat(this.u2.get(k3).invoke(this.u9.invoke(a5.get(k0), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1()));
                }
            }
            org.luaj.vm2.LuaValue a8 = this.u4.call(a3.get(k0));
            if (this.u5.call(a3.get(k2), this.u7[0]).toboolean() && !a8.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a8.len().eq_b(k2) && this.u5.call(a8.get(k1), this.u14).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)this.u2.get(k3).invoke(this.u9.invoke(a8.get(k2), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().concat(k8));
            }
            if (!a5.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a5.len().eq_b(k2) && this.u5.call(a3.get(k0), this.u13).toboolean() && this.u5.call(a5.get(k1), this.u15[0]).toboolean()) {
                org.luaj.vm2.LuaValue a9 = this.u4.call(a5.get(k2));
                if (!a9.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a9.len().eq_b(k0) && this.u5.call(a9.get(k1), this.u7[0]).toboolean() && this.u5.call(a9.get(k2), this.u8).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)k9.concat(this.u2.get(k3).invoke(this.u9.invoke(a9.get(k0), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1()));
                }
            }
            boolean b = this.u5.call(a3.get(k0), this.u8).toboolean();
            label0: {
                label3: {
                    label4: {
                        if (b) {
                            break label4;
                        }
                        break label3;
                    }
                    a4 = k10;
                    if (!a4.toboolean()) {
                        break label3;
                    }
                    break label0;
                }
                boolean b0 = this.u5.call(a3.get(k0), this.u13).toboolean();
                label2: {
                    label1: {
                        if (b0) {
                            break label1;
                        }
                        break label2;
                    }
                    a4 = k11;
                    if (a4.toboolean()) {
                        break label0;
                    }
                }
                a4 = this.u9.call(a3.get(k0), k4);
            }
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)this.u2.get(k3).call(a4).concat(k12.concat(this.u2.get(k3).invoke(this.u9.invoke(a3.get(k2), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().buffer())).value());
        }
        if (!a3.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a3.len().eq_b(k2)) {
            if (this.u5.call(a3.get(k1), this.u15[0]).toboolean()) {
                org.luaj.vm2.LuaValue a10 = this.u4.call(a3.get(k2));
                if (!a10.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a10.len().eq_b(k2) && this.u5.call(a10.get(k1), this.u16[0]).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)k13.concat(this.u2.get(k3).invoke(this.u9.invoke(a10.get(k2), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1()));
                }
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)k14.concat(this.u2.get(k3).invoke(this.u9.invoke(a3.get(k2), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1()));
            }
            if (this.u5.call(a3.get(k1), this.u14).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)this.u2.get(k3).invoke(this.u9.invoke(a3.get(k2), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().concat(k15));
            }
            if (this.u5.call(a3.get(k1), this.u16[0]).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)k16.concat(this.u2.get(k3).invoke(this.u9.invoke(a3.get(k2), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1()));
            }
            if (this.u5.call(a3.get(k1), this.u17).toboolean()) {
                org.luaj.vm2.LuaValue a11 = this.u4.call(a3.get(k2));
                if (!a11.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                    org.luaj.vm2.LuaValue a12 = a11.len();
                    if (k1.lt_b(a12)) {
                        org.luaj.vm2.LuaValue a13 = this.u9.call(a11.get(k1), k4);
                        org.luaj.vm2.LuaValue a14 = k1;
                        while(a14.lt_b(a11.len())) {
                            a13 = this.u2.get(k3).call(a13).concat(k17.concat(this.u2.get(k3).invoke(this.u9.invoke(a11.get(a14.add(k1)), (org.luaj.vm2.Varargs)k4).subargs(1)).arg1().buffer())).value();
                            a14 = a14.add(k1);
                        }
                        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a13);
                    }
                }
            }
        }
        if (a1.eq_b(k4)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u18[0], (org.luaj.vm2.Varargs)a0);
        }
        if (!a1.eq_b(k18)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u18[0], this.u19.invoke((org.luaj.vm2.Varargs)a0).subargs(1));
    }
}
