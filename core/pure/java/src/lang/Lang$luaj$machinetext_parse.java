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
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue[] u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue[] u14;
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
        k9 = org.luaj.vm2.LuaString.valueOf("_");
    }
    
    public Lang$luaj$machinetext_parse() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0.call();
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a1);
        org.luaj.vm2.LuaValue a3 = k0;
        org.luaj.vm2.LuaValue[] a4 = Lang$luaj$machinetext_parse.newupe();
        a4[0] = a3;
        Lang$luaj$machinetext_parse$parse_error a5 = new Lang$luaj$machinetext_parse$parse_error();
        a5.u0 = this.u1;
        Lang$luaj$machinetext_parse$parse_assert a6 = new Lang$luaj$machinetext_parse$parse_assert();
        a6.u0 = a5;
        Lang$luaj$machinetext_parse$get_do a7 = new Lang$luaj$machinetext_parse$get_do();
        a7.u0 = a6;
        a7.u1 = a0;
        a7.u2 = a4;
        a7.u3 = this.u1;
        while(!((org.luaj.vm2.LuaValue)a2).len().eq_b(k0)) {
            org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a9 = k1;
            org.luaj.vm2.LuaValue a10 = ((org.luaj.vm2.LuaValue)a2).len();
            org.luaj.vm2.LuaValue a11 = k1;
            org.luaj.vm2.LuaValue a12 = a9.sub(a11);
            while(true) {
                a12 = a12.add(a11);
                if (a12.testfor_b(a10, a11)) {
                    org.luaj.vm2.LuaValue a13 = ((org.luaj.vm2.LuaValue)a2).get(a12);
                    org.luaj.vm2.LuaValue a14 = ((org.luaj.vm2.LuaValue)a7).call();
                    org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
                    Lang$luaj$machinetext_parse$3 a15 = new Lang$luaj$machinetext_parse$3();
                    a15.u0 = this.u0;
                    a15.u1 = this.u1;
                    a15.u2 = a8;
                    a15.u3 = this.u2;
                    a15.u4 = a13;
                    if (a14.eq_b(k2)) {
                        org.luaj.vm2.LuaValue a16 = k3;
                        while(true) {
                            org.luaj.vm2.LuaValue a17 = ((org.luaj.vm2.LuaValue)a7).call();
                            if (a17.eq_b(k2)) {
                                if (!this.u3.call(a16).toboolean()) {
                                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                                }
                                org.luaj.vm2.LuaValue a18 = this.u2;
                                org.luaj.vm2.Varargs a19 = this.u4.invoke((org.luaj.vm2.Varargs)a16);
                                org.luaj.vm2.LuaValue[] a20 = new org.luaj.vm2.LuaValue[1];
                                a20[0] = a13;
                                a18.invoke(org.luaj.vm2.LuaValue.varargsOf(a20, a19));
                                break;
                            } else {
                                a16 = this.u1.get(k4).call(a16).concat(this.u1.get(k4).call(a17));
                            }
                        }
                    } else if (a14.eq_b(k5)) {
                        ((org.luaj.vm2.LuaValue)a15).call(this.u5);
                    } else if (a14.eq_b(k6)) {
                        ((org.luaj.vm2.LuaValue)a15).call(this.u6);
                    } else if (a14.eq_b(k7)) {
                        ((org.luaj.vm2.LuaValue)a15).call(this.u7);
                    } else if (a14.eq_b(k8)) {
                        Lang$luaj$machinetext_parse$4 a21 = new Lang$luaj$machinetext_parse$4();
                        a21.u0 = this.u8;
                        a21.u1 = this.u9;
                        a21.u2 = this.u10;
                        a21.u3 = this.u11;
                        a21.u4 = this.u12;
                        a21.u5 = this.u13;
                        ((org.luaj.vm2.LuaValue)a15).call((org.luaj.vm2.LuaValue)a21);
                    } else {
                        if (!a14.eq_b(k9)) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        this.u2.call(a13, this.u14[0]);
                    }
                } else {
                    a2 = a8;
                    break;
                }
            }
        }
        org.luaj.vm2.LuaValue a22 = a0.len();
        ((org.luaj.vm2.LuaValue)a6).call((org.luaj.vm2.LuaValue)((a4[0].eq_b(a22)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.Varargs a23 = a1;
        return a23;
    }
}
