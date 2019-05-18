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
    org.luaj.vm2.LuaValue[] u10;
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
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaString.valueOf("^");
        k3 = org.luaj.vm2.LuaString.valueOf("");
        k4 = org.luaj.vm2.LuaString.valueOf("tostring");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("#");
        k7 = org.luaj.vm2.LuaString.valueOf("!");
        k8 = org.luaj.vm2.LuaString.valueOf("$");
        k9 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
        k10 = org.luaj.vm2.LuaString.valueOf("_");
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
        while(!((org.luaj.vm2.LuaValue)a2).len().eq_b(k0)) {
            org.luaj.vm2.LuaTable a9 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a10 = k1;
            org.luaj.vm2.LuaValue a11 = ((org.luaj.vm2.LuaValue)a2).len();
            org.luaj.vm2.LuaValue a12 = k1;
            org.luaj.vm2.LuaValue a13 = a10.sub(a12);
            while(true) {
                a13 = a13.add(a12);
                if (a13.testfor_b(a11, a12)) {
                    org.luaj.vm2.LuaValue a14 = ((org.luaj.vm2.LuaValue)a2).get(a13);
                    org.luaj.vm2.LuaValue a15 = ((org.luaj.vm2.LuaValue)a8).call();
                    org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
                    Lang$luaj$machinetext_parse$4 a16 = new Lang$luaj$machinetext_parse$4();
                    a16.u0 = this.u0;
                    a16.u1 = this.u2;
                    a16.u2 = a9;
                    a16.u3 = this.u1;
                    a16.u4 = a14;
                    if (a15.eq_b(k2)) {
                        org.luaj.vm2.LuaValue a17 = k3;
                        while(true) {
                            org.luaj.vm2.LuaValue a18 = ((org.luaj.vm2.LuaValue)a8).call();
                            if (a18.eq_b(k2)) {
                                if (!this.u3.call(a17).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                a14.invoke(this.u4.invoke((org.luaj.vm2.Varargs)a17).subargs(1));
                                break;
                            } else {
                                a17 = this.u2.get(k4).call(a17).concat(this.u2.get(k4).call(a18));
                            }
                        }
                    } else if (a15.eq_b(k5)) {
                        ((org.luaj.vm2.LuaValue)a16).call(this.u5);
                    } else if (a15.eq_b(k6)) {
                        ((org.luaj.vm2.LuaValue)a16).call(this.u6);
                    } else if (a15.eq_b(k7)) {
                        ((org.luaj.vm2.LuaValue)a16).call(this.u7);
                    } else if (a15.eq_b(k8)) {
                        org.luaj.vm2.LuaValue a19 = this.u0.call();
                        org.luaj.vm2.LuaBoolean a20 = org.luaj.vm2.LuaValue.FALSE;
                        org.luaj.vm2.LuaValue[] a21 = Lang$luaj$machinetext_parse.newupe();
                        a21[0] = a20;
                        org.luaj.vm2.LuaValue a22 = this.u2.get(k9);
                        Lang$luaj$machinetext_parse$5 a23 = new Lang$luaj$machinetext_parse$5();
                        a23.u0 = a21;
                        a23.u1 = this.u8;
                        a22.call((org.luaj.vm2.LuaValue)a9, (org.luaj.vm2.LuaValue)a23);
                        org.luaj.vm2.LuaValue a24 = this.u2.get(k9);
                        Lang$luaj$machinetext_parse$6 a25 = new Lang$luaj$machinetext_parse$6();
                        a25.u0 = a21;
                        a25.u1 = a6;
                        a25.u2 = this.u1;
                        a25.u3 = a19;
                        a25.u4 = this.u9;
                        a24.call((org.luaj.vm2.LuaValue)a9, (org.luaj.vm2.LuaValue)a25);
                        a14.call(a19);
                    } else {
                        if (!a15.eq_b(k10)) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        a14.call(this.u10[0]);
                    }
                } else {
                    a2 = a9;
                    break;
                }
            }
        }
        org.luaj.vm2.LuaValue a26 = a0.len();
        ((org.luaj.vm2.LuaValue)a7).call((org.luaj.vm2.LuaValue)((a5[0].eq_b(a26)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.Varargs a27 = a1;
        return a27;
    }
}
