package lang;
public class Lang$luaj$machinetext_parse$1 extends org.luaj.vm2.lib.VarArgFunction {
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
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
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
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
        k4 = org.luaj.vm2.LuaString.valueOf("^");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("_");
        k7 = org.luaj.vm2.LuaString.valueOf("#");
        k8 = org.luaj.vm2.LuaString.valueOf("!");
        k9 = org.luaj.vm2.LuaString.valueOf("$");
    }
    
    public Lang$luaj$machinetext_parse$1() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue[] a0 = Lang$luaj$machinetext_parse$1.newupn();
        org.luaj.vm2.LuaValue a1 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        a0[0] = a1;
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a0[0]);
        a0[0] = k0;
        while(!((org.luaj.vm2.LuaValue)a2).len().eq_b(k1)) {
            org.luaj.vm2.LuaTable a3 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a4 = k2;
            org.luaj.vm2.LuaValue a5 = ((org.luaj.vm2.LuaValue)a2).len();
            org.luaj.vm2.LuaValue a6 = k2;
            org.luaj.vm2.LuaValue a7 = a4.sub(a6);
            while(true) {
                a7 = a7.add(a6);
                if (a7.testfor_b(a5, a6)) {
                    org.luaj.vm2.LuaValue a8 = ((org.luaj.vm2.LuaValue)a2).get(a7);
                    org.luaj.vm2.LuaValue a9 = this.u0.call(a8);
                    org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
                    Lang$luaj$machinetext_parse$1$0 a10 = new Lang$luaj$machinetext_parse$1$0();
                    a10.u0 = a0;
                    a10.u1 = this.u1;
                    a10.u2 = this.u2;
                    a10.u3 = a3;
                    if (this.u3.call(a9).toboolean()) {
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(k4);
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(this.u1.get(k3).invoke(this.u4.invoke((org.luaj.vm2.Varargs)a9).subargs(1)).arg1());
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(k4);
                    } else if (this.u5.call(a9).toboolean()) {
                        org.luaj.vm2.LuaValue a11 = k5;
                        org.luaj.vm2.LuaValue a12 = this.u6;
                        org.luaj.vm2.LuaValue a13 = this.u7;
                        org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[4];
                        a14[0] = a9;
                        a14[1] = a11;
                        a14[2] = a12;
                        a14[3] = a13;
                        ((org.luaj.vm2.LuaValue)a10).invoke(org.luaj.vm2.LuaValue.varargsOf(a14));
                    } else if (this.u8.call(a9).toboolean()) {
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(k6);
                    } else if (this.u9.call(a9).toboolean()) {
                        org.luaj.vm2.LuaValue a15 = k7;
                        org.luaj.vm2.LuaValue a16 = this.u10;
                        org.luaj.vm2.LuaValue a17 = this.u11;
                        org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[4];
                        a18[0] = a9;
                        a18[1] = a15;
                        a18[2] = a16;
                        a18[3] = a17;
                        ((org.luaj.vm2.LuaValue)a10).invoke(org.luaj.vm2.LuaValue.varargsOf(a18));
                    } else if (this.u12.call(a9).toboolean()) {
                        org.luaj.vm2.LuaValue a19 = k8;
                        org.luaj.vm2.LuaValue a20 = this.u13;
                        org.luaj.vm2.LuaValue a21 = this.u14;
                        org.luaj.vm2.LuaValue[] a22 = new org.luaj.vm2.LuaValue[4];
                        a22[0] = a9;
                        a22[1] = a19;
                        a22[2] = a20;
                        a22[3] = a21;
                        ((org.luaj.vm2.LuaValue)a10).invoke(org.luaj.vm2.LuaValue.varargsOf(a22));
                    } else {
                        if (!this.u15.call(a9).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u20, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a23 = this.u16.call(a9);
                        org.luaj.vm2.LuaValue a24 = k9;
                        Lang$luaj$machinetext_parse$1$1 a25 = new Lang$luaj$machinetext_parse$1$1();
                        a25.u0 = this.u17;
                        a25.u1 = this.u18;
                        org.luaj.vm2.LuaValue a26 = this.u19;
                        org.luaj.vm2.LuaValue[] a27 = new org.luaj.vm2.LuaValue[4];
                        a27[0] = a23;
                        a27[1] = a24;
                        a27[2] = a25;
                        a27[3] = a26;
                        ((org.luaj.vm2.LuaValue)a10).invoke(org.luaj.vm2.LuaValue.varargsOf(a27));
                    }
                } else {
                    a2 = a3;
                    break;
                }
            }
        }
        org.luaj.vm2.Varargs a28 = a0[0];
        return a28;
    }
}
