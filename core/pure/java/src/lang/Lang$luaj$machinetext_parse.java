package lang;
public class Lang$luaj$machinetext_parse extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
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
        k2 = org.luaj.vm2.LuaString.valueOf("$");
        k3 = org.luaj.vm2.LuaString.valueOf("");
        k4 = org.luaj.vm2.LuaString.valueOf("tostring");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("#");
        k7 = org.luaj.vm2.LuaString.valueOf("!");
        k8 = org.luaj.vm2.LuaString.valueOf("_");
        k9 = org.luaj.vm2.LuaString.valueOf("error");
        k10 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$machinetext_parse() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0.call();
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a1).rawset(1, a0);
        org.luaj.vm2.LuaValue a2 = k0;
        org.luaj.vm2.LuaValue[] a3 = Lang$luaj$machinetext_parse.newupe();
        a3[0] = a2;
        Lang$luaj$machinetext_parse$parse_error a4 = new Lang$luaj$machinetext_parse$parse_error();
        a4.u0 = this.u1;
        Lang$luaj$machinetext_parse$parse_assert a5 = new Lang$luaj$machinetext_parse$parse_assert();
        a5.u0 = a4;
        Lang$luaj$machinetext_parse$get_do a6 = new Lang$luaj$machinetext_parse$get_do();
        a6.u0 = a5;
        a6.u1 = a;
        a6.u2 = a3;
        a6.u3 = this.u1;
        while(!((org.luaj.vm2.LuaValue)a1).len().eq_b(k0)) {
            org.luaj.vm2.LuaTable a7 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a8 = k1;
            org.luaj.vm2.LuaValue a9 = ((org.luaj.vm2.LuaValue)a1).len();
            org.luaj.vm2.LuaValue a10 = k1;
            org.luaj.vm2.LuaValue a11 = a8.sub(a10);
            while(true) {
                a11 = a11.add(a10);
                if (a11.testfor_b(a9, a10)) {
                    org.luaj.vm2.LuaValue a12 = ((org.luaj.vm2.LuaValue)a1).get(a11);
                    org.luaj.vm2.LuaValue a13 = ((org.luaj.vm2.LuaValue)a6).call();
                    org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
                    Lang$luaj$machinetext_parse$3 a14 = new Lang$luaj$machinetext_parse$3();
                    a14.u0 = this.u0;
                    a14.u1 = this.u1;
                    a14.u2 = a7;
                    a14.u3 = this.u2;
                    a14.u4 = a12;
                    if (a13.eq_b(k2)) {
                        org.luaj.vm2.LuaValue a15 = k3;
                        while(true) {
                            org.luaj.vm2.LuaValue a16 = ((org.luaj.vm2.LuaValue)a6).call();
                            if (a16.eq_b(k2)) {
                                org.luaj.vm2.LuaValue a17 = this.u2;
                                org.luaj.vm2.Varargs a18 = this.u3.invoke((org.luaj.vm2.Varargs)a15);
                                org.luaj.vm2.LuaValue[] a19 = new org.luaj.vm2.LuaValue[1];
                                a19[0] = a12;
                                a17.invoke(org.luaj.vm2.LuaValue.varargsOf(a19, a18));
                                break;
                            } else {
                                a15 = this.u1.get(k4).call(a15).concat(this.u1.get(k4).call(a16));
                            }
                        }
                    } else if (a13.eq_b(k5)) {
                        ((org.luaj.vm2.LuaValue)a14).call(this.u4);
                    } else if (a13.eq_b(k6)) {
                        ((org.luaj.vm2.LuaValue)a14).call(this.u5);
                    } else if (a13.eq_b(k7)) {
                        ((org.luaj.vm2.LuaValue)a14).call(this.u6);
                    } else if (a13.eq_b(k8)) {
                        this.u2.call(a12, this.u7[0]);
                    } else {
                        this.u1.get(k9).call(k10);
                    }
                } else {
                    a1 = a7;
                    break;
                }
            }
        }
        org.luaj.vm2.LuaValue a20 = a.len();
        ((org.luaj.vm2.LuaValue)a5).call((org.luaj.vm2.LuaValue)((a3[0].eq_b(a20)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        return a0;
    }
}
