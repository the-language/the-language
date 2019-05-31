package lang;
public class Lang$luaj$machinetext_parse extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue[] u12;
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
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k2 = org.luaj.vm2.LuaString.valueOf("^");
        k3 = org.luaj.vm2.LuaString.valueOf("");
        k4 = org.luaj.vm2.LuaString.valueOf("tostring");
        k5 = org.luaj.vm2.LuaString.valueOf("can_new_symbol_unicodechar_p(\"");
        k6 = org.luaj.vm2.LuaString.valueOf("\") == false");
        k7 = org.luaj.vm2.LuaString.valueOf(".");
        k8 = org.luaj.vm2.LuaString.valueOf("#");
        k9 = org.luaj.vm2.LuaString.valueOf("!");
        k10 = org.luaj.vm2.LuaString.valueOf("$");
        k11 = org.luaj.vm2.LuaString.valueOf("_");
        k12 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$machinetext_parse() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0.call();
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        Lang$luaj$machinetext_parse$0 a3 = new Lang$luaj$machinetext_parse$0();
        a3.u0 = this.u1;
        a3.u1 = a1;
        ((org.luaj.vm2.LuaValue)a2).rawset(1, (org.luaj.vm2.LuaValue)a3);
        org.luaj.vm2.LuaValue a4 = k0;
        org.luaj.vm2.LuaValue[] a5 = Lang$luaj$machinetext_parse.newupe();
        a5[0] = a4;
        Lang$luaj$machinetext_parse$parse_error a6 = new Lang$luaj$machinetext_parse$parse_error();
        a6.u0 = this.u2;
        Lang$luaj$machinetext_parse$parse_assert a7 = new Lang$luaj$machinetext_parse$parse_assert();
        a7.u0 = a6;
        Lang$luaj$machinetext_parse$get_do a8 = new Lang$luaj$machinetext_parse$get_do();
        a8.u0 = a7;
        a8.u1 = a0;
        a8.u2 = a5;
        a8.u3 = this.u2;
        org.luaj.vm2.LuaTable a9 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        while(!((org.luaj.vm2.LuaValue)a2).len().eq_b(k0)) {
            org.luaj.vm2.LuaTable a10 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.Varargs a11 = this.u2.get(k1).invoke((org.luaj.vm2.Varargs)a2);
            org.luaj.vm2.LuaValue a12 = a11.arg1();
            org.luaj.vm2.LuaValue a13 = a11.arg(2);
            org.luaj.vm2.LuaValue a14 = a11.arg(3);
            while(true) {
                org.luaj.vm2.Varargs a15 = a12.invoke(a13, (org.luaj.vm2.Varargs)a14);
                a14 = a15.arg1();
                org.luaj.vm2.LuaValue a16 = a15.arg(2);
                if (a14.isnil()) {
                    a2 = a10;
                    break;
                } else {
                    org.luaj.vm2.LuaValue a17 = ((org.luaj.vm2.LuaValue)a8).call();
                    Lang$luaj$machinetext_parse$conslike a18 = new Lang$luaj$machinetext_parse$conslike();
                    a18.u0 = this.u0;
                    a18.u1 = this.u3;
                    a18.u2 = a10;
                    a18.u3 = this.u1;
                    a18.u4 = a16;
                    if (a17.eq_b(k2)) {
                        org.luaj.vm2.LuaValue a19 = k3;
                        while(true) {
                            org.luaj.vm2.LuaValue a20 = ((org.luaj.vm2.LuaValue)a8).call();
                            if (a20.eq_b(k2)) {
                                if (!this.u4.call(a19).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)k5.concat(this.u2.get(k4).call(a19).concat(k6.buffer())).value());
                                }
                                a16.invoke(this.u5.invoke((org.luaj.vm2.Varargs)a19).subargs(1));
                                break;
                            } else {
                                a19 = this.u2.get(k4).call(a19).concat(this.u2.get(k4).call(a20));
                            }
                        }
                    } else if (a17.eq_b(k7)) {
                        ((org.luaj.vm2.LuaValue)a18).call(this.u6);
                    } else if (a17.eq_b(k8)) {
                        ((org.luaj.vm2.LuaValue)a18).call(this.u7);
                    } else if (a17.eq_b(k9)) {
                        ((org.luaj.vm2.LuaValue)a18).call(this.u8);
                    } else if (a17.eq_b(k10)) {
                        org.luaj.vm2.LuaBoolean a21 = org.luaj.vm2.LuaValue.FALSE;
                        org.luaj.vm2.LuaValue[] a22 = Lang$luaj$machinetext_parse.newupe();
                        a22[0] = a21;
                        org.luaj.vm2.LuaBoolean a23 = org.luaj.vm2.LuaValue.FALSE;
                        org.luaj.vm2.LuaValue[] a24 = Lang$luaj$machinetext_parse.newupe();
                        a24[0] = a23;
                        org.luaj.vm2.LuaValue a25 = this.u3;
                        Lang$luaj$machinetext_parse$5 a26 = new Lang$luaj$machinetext_parse$5();
                        a26.u0 = a22;
                        a25.call((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.LuaValue)a26);
                        org.luaj.vm2.LuaValue a27 = this.u3;
                        Lang$luaj$machinetext_parse$6 a28 = new Lang$luaj$machinetext_parse$6();
                        a28.u0 = a24;
                        a27.call((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.LuaValue)a28);
                        org.luaj.vm2.LuaValue a29 = this.u3;
                        Lang$luaj$machinetext_parse$7 a30 = new Lang$luaj$machinetext_parse$7();
                        a30.u0 = a22;
                        a30.u1 = a24;
                        a30.u2 = this.u9;
                        a30.u3 = this.u10;
                        a30.u4 = a6;
                        a30.u5 = a16;
                        a30.u6 = this.u11;
                        a29.call((org.luaj.vm2.LuaValue)a9, (org.luaj.vm2.LuaValue)a30);
                    } else {
                        if (!a17.eq_b(k11)) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        a16.call(this.u12[0]);
                    }
                }
            }
        }
        org.luaj.vm2.LuaValue a31 = a0.len();
        ((org.luaj.vm2.LuaValue)a7).call((org.luaj.vm2.LuaValue)((a5[0].eq_b(a31)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.LuaValue a32 = ((org.luaj.vm2.LuaValue)a9).len().sub(k12);
        while(k0.lteq_b(a32)) {
            ((org.luaj.vm2.LuaValue)a9).get(a32.add(k12)).call();
            a32 = a32.sub(k12);
        }
        org.luaj.vm2.Varargs a33 = a1;
        return a33;
    }
}
