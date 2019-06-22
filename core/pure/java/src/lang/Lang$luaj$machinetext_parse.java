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
        k0 = org.luaj.vm2.LuaString.valueOf("^");
        k1 = org.luaj.vm2.LuaString.valueOf("");
        k2 = org.luaj.vm2.LuaString.valueOf("tostring");
        k3 = org.luaj.vm2.LuaString.valueOf("can_new_atom_unicodechar_p(\"");
        k4 = org.luaj.vm2.LuaString.valueOf("\") == false");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("#");
        k7 = org.luaj.vm2.LuaString.valueOf("!");
        k8 = org.luaj.vm2.LuaString.valueOf("$");
        k9 = org.luaj.vm2.LuaString.valueOf("_");
        k10 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$machinetext_parse() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = org.luaj.vm2.LuaValue.NIL;
        org.luaj.vm2.LuaValue[] a2 = Lang$luaj$machinetext_parse.newupe();
        a2[0] = a1;
        Lang$luaj$machinetext_parse$0 a3 = new Lang$luaj$machinetext_parse$0();
        a3.u0 = a2;
        Lang$luaj$machinetext_parse$1 a4 = new Lang$luaj$machinetext_parse$1();
        a4.u0 = a3;
        a2[0] = a0.len();
        Lang$luaj$machinetext_parse$parse_error a5 = new Lang$luaj$machinetext_parse$parse_error();
        a5.u0 = this.u0;
        Lang$luaj$machinetext_parse$parse_assert a6 = new Lang$luaj$machinetext_parse$parse_assert();
        a6.u0 = a5;
        Lang$luaj$machinetext_parse$get_do a7 = new Lang$luaj$machinetext_parse$get_do();
        a7.u0 = a6;
        a7.u1 = a4;
        a7.u2 = a2;
        a7.u3 = this.u0;
        a7.u4 = a0;
        org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        Lang$luaj$machinetext_parse$conslike a9 = new Lang$luaj$machinetext_parse$conslike();
        a9.u0 = this.u0;
        a9.u1 = a8;
        a9.u2 = a5;
        a9.u3 = this.u1;
        while(((org.luaj.vm2.LuaValue)a4).call().toboolean()) {
            org.luaj.vm2.LuaValue a10 = ((org.luaj.vm2.LuaValue)a7).call();
            if (a10.eq_b(k0)) {
                org.luaj.vm2.LuaValue a11 = k1;
                while(true) {
                    org.luaj.vm2.LuaValue a12 = ((org.luaj.vm2.LuaValue)a7).call();
                    if (a12.eq_b(k0)) {
                        if (!this.u2.call(a11).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)k3.concat(this.u0.get(k2).call(a11).concat(k4.buffer())).value());
                        }
                        org.luaj.vm2.LuaValue a13 = this.u1;
                        org.luaj.vm2.Varargs a14 = this.u3.invoke((org.luaj.vm2.Varargs)a11);
                        org.luaj.vm2.LuaValue[] a15 = new org.luaj.vm2.LuaValue[1];
                        a15[0] = a8;
                        a13.invoke(org.luaj.vm2.LuaValue.varargsOf(a15, a14));
                        break;
                    } else {
                        a11 = this.u0.get(k2).call(a12).concat(this.u0.get(k2).call(a11));
                    }
                }
            } else if (a10.eq_b(k5)) {
                ((org.luaj.vm2.LuaValue)a9).call(this.u4);
            } else if (a10.eq_b(k6)) {
                ((org.luaj.vm2.LuaValue)a9).call(this.u5);
            } else if (a10.eq_b(k7)) {
                ((org.luaj.vm2.LuaValue)a9).call(this.u6);
            } else if (a10.eq_b(k8)) {
                Lang$luaj$machinetext_parse$6 a16 = new Lang$luaj$machinetext_parse$6();
                a16.u0 = this.u7;
                a16.u1 = a5;
                a16.u2 = this.u8;
                ((org.luaj.vm2.LuaValue)a9).call((org.luaj.vm2.LuaValue)a16);
            } else {
                if (!a10.eq_b(k9)) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                this.u1.call((org.luaj.vm2.LuaValue)a8, this.u9[0]);
            }
        }
        ((org.luaj.vm2.LuaValue)a6).invoke(((org.luaj.vm2.LuaValue)a3).invoke().subargs(1));
        ((org.luaj.vm2.LuaValue)a6).call((org.luaj.vm2.LuaValue)((((org.luaj.vm2.LuaValue)a8).len().eq_b(k10)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        org.luaj.vm2.Varargs a17 = ((org.luaj.vm2.LuaValue)a8).get(k10);
        return a17;
    }
}
