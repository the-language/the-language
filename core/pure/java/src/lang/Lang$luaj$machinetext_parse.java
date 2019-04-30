package lang;
public class Lang$luaj$machinetext_parse extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    final static org.luaj.vm2.LuaValue k7;
    final static org.luaj.vm2.LuaValue k8;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaString.valueOf("$");
        k3 = org.luaj.vm2.LuaString.valueOf("");
        k4 = org.luaj.vm2.LuaString.valueOf("tostring");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
        k7 = org.luaj.vm2.LuaString.valueOf("error");
        k8 = org.luaj.vm2.LuaString.valueOf("WIP");
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
                    if (a13.eq_b(k2)) {
                        org.luaj.vm2.LuaValue a14 = k3;
                        while(true) {
                            org.luaj.vm2.LuaValue a15 = ((org.luaj.vm2.LuaValue)a6).call();
                            if (a15.eq_b(k2)) {
                                org.luaj.vm2.LuaValue a16 = this.u2;
                                org.luaj.vm2.Varargs a17 = this.u3.invoke((org.luaj.vm2.Varargs)a14);
                                org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[1];
                                a18[0] = a12;
                                a16.invoke(org.luaj.vm2.LuaValue.varargsOf(a18, a17));
                                break;
                            } else {
                                a14 = this.u1.get(k4).call(a14).concat(this.u1.get(k4).call(a15));
                            }
                        }
                    } else if (a13.eq_b(k5)) {
                        org.luaj.vm2.LuaValue a19 = this.u0.call();
                        org.luaj.vm2.LuaValue a20 = this.u0.call();
                        this.u1.get(k6).call((org.luaj.vm2.LuaValue)a7, a19);
                        this.u1.get(k6).call((org.luaj.vm2.LuaValue)a7, a20);
                        org.luaj.vm2.LuaValue a21 = this.u2;
                        org.luaj.vm2.Varargs a22 = this.u4.invoke(a19, (org.luaj.vm2.Varargs)a20);
                        org.luaj.vm2.LuaValue[] a23 = new org.luaj.vm2.LuaValue[1];
                        a23[0] = a12;
                        a21.invoke(org.luaj.vm2.LuaValue.varargsOf(a23, a22));
                    } else {
                        this.u1.get(k7).call(k8);
                    }
                } else {
                    a1 = a7;
                    break;
                }
            }
        }
        org.luaj.vm2.LuaValue a24 = a.len();
        ((org.luaj.vm2.LuaValue)a5).call((org.luaj.vm2.LuaValue)((a3[0].eq_b(a24)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        return a0;
    }
}
