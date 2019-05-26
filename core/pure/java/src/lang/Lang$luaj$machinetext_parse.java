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
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
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
            org.luaj.vm2.LuaValue a11 = k1;
            org.luaj.vm2.LuaValue a12 = ((org.luaj.vm2.LuaValue)a2).len();
            org.luaj.vm2.LuaValue a13 = k1;
            org.luaj.vm2.LuaValue a14 = a11.sub(a13);
            while(true) {
                a14 = a14.add(a13);
                if (a14.testfor_b(a12, a13)) {
                    org.luaj.vm2.LuaValue a15 = ((org.luaj.vm2.LuaValue)a2).get(a14);
                    org.luaj.vm2.LuaValue a16 = ((org.luaj.vm2.LuaValue)a8).call();
                    Lang$luaj$machinetext_parse$conslike a17 = new Lang$luaj$machinetext_parse$conslike();
                    a17.u0 = this.u0;
                    a17.u1 = this.u3;
                    a17.u2 = a10;
                    a17.u3 = this.u1;
                    a17.u4 = a15;
                    if (a16.eq_b(k2)) {
                        org.luaj.vm2.LuaValue a18 = k3;
                        while(true) {
                            org.luaj.vm2.LuaValue a19 = ((org.luaj.vm2.LuaValue)a8).call();
                            if (a19.eq_b(k2)) {
                                if (!this.u4.call(a18).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)k5.concat(this.u2.get(k4).call(a18).concat(k6.buffer())).value());
                                }
                                a15.invoke(this.u5.invoke((org.luaj.vm2.Varargs)a18).subargs(1));
                                break;
                            } else {
                                a18 = this.u2.get(k4).call(a18).concat(this.u2.get(k4).call(a19));
                            }
                        }
                    } else if (a16.eq_b(k7)) {
                        ((org.luaj.vm2.LuaValue)a17).call(this.u6);
                    } else if (a16.eq_b(k8)) {
                        ((org.luaj.vm2.LuaValue)a17).call(this.u7);
                    } else if (a16.eq_b(k9)) {
                        ((org.luaj.vm2.LuaValue)a17).call(this.u8);
                    } else if (a16.eq_b(k10)) {
                        org.luaj.vm2.LuaBoolean a20 = org.luaj.vm2.LuaValue.FALSE;
                        org.luaj.vm2.LuaValue[] a21 = Lang$luaj$machinetext_parse.newupe();
                        a21[0] = a20;
                        org.luaj.vm2.LuaBoolean a22 = org.luaj.vm2.LuaValue.FALSE;
                        org.luaj.vm2.LuaValue[] a23 = Lang$luaj$machinetext_parse.newupe();
                        a23[0] = a22;
                        org.luaj.vm2.LuaValue a24 = this.u3;
                        Lang$luaj$machinetext_parse$5 a25 = new Lang$luaj$machinetext_parse$5();
                        a25.u0 = a21;
                        a24.call((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.LuaValue)a25);
                        org.luaj.vm2.LuaValue a26 = this.u3;
                        Lang$luaj$machinetext_parse$6 a27 = new Lang$luaj$machinetext_parse$6();
                        a27.u0 = a23;
                        a26.call((org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.LuaValue)a27);
                        org.luaj.vm2.LuaValue a28 = this.u3;
                        Lang$luaj$machinetext_parse$7 a29 = new Lang$luaj$machinetext_parse$7();
                        a29.u0 = a21;
                        a29.u1 = a23;
                        a29.u2 = this.u9;
                        a29.u3 = this.u10;
                        a29.u4 = a6;
                        a29.u5 = a15;
                        a29.u6 = this.u11;
                        a28.call((org.luaj.vm2.LuaValue)a9, (org.luaj.vm2.LuaValue)a29);
                    } else {
                        if (!a16.eq_b(k11)) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        a15.call(this.u12[0]);
                    }
                } else {
                    a2 = a10;
                    break;
                }
            }
        }
        org.luaj.vm2.LuaValue a30 = a0.len();
        ((org.luaj.vm2.LuaValue)a7).call((org.luaj.vm2.LuaValue)((a5[0].eq_b(a30)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.LuaValue a31 = ((org.luaj.vm2.LuaValue)a9).len().sub(k1);
        while(k0.lteq_b(a31)) {
            ((org.luaj.vm2.LuaValue)a9).get(a31.add(k1)).call();
            a31 = a31.sub(k1);
        }
        org.luaj.vm2.Varargs a32 = a1;
        return a32;
    }
}
