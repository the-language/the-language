package lang;
public class Lang$luaj$machinetext_parse$1 extends org.luaj.vm2.lib.OneArgFunction {
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
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
        k4 = org.luaj.vm2.LuaString.valueOf("$");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("_");
        k7 = org.luaj.vm2.LuaString.valueOf("#");
        k8 = org.luaj.vm2.LuaString.valueOf("!");
        k9 = org.luaj.vm2.LuaString.valueOf("error");
        k10 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$machinetext_parse$1() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue[] a0 = Lang$luaj$machinetext_parse$1.newupn();
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        a0[0] = a;
        ((org.luaj.vm2.LuaValue)a1).rawset(1, a0[0]);
        a0[0] = k0;
        while(!((org.luaj.vm2.LuaValue)a1).len().eq_b(k1)) {
            org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a3 = k2;
            org.luaj.vm2.LuaValue a4 = ((org.luaj.vm2.LuaValue)a1).len();
            org.luaj.vm2.LuaValue a5 = k2;
            org.luaj.vm2.LuaValue a6 = a3.sub(a5);
            while(true) {
                a6 = a6.add(a5);
                if (a6.testfor_b(a4, a5)) {
                    org.luaj.vm2.LuaValue a7 = ((org.luaj.vm2.LuaValue)a1).get(a6);
                    org.luaj.vm2.LuaValue a8 = this.u0.call(a7);
                    org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
                    Lang$luaj$machinetext_parse$1$0 a9 = new Lang$luaj$machinetext_parse$1$0();
                    a9.u0 = a0;
                    a9.u1 = this.u1;
                    a9.u2 = a2;
                    if (this.u2.call(a8).toboolean()) {
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(k4);
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(this.u1.get(k3).invoke(this.u3.invoke((org.luaj.vm2.Varargs)a8).subargs(1)).arg1());
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(k4);
                    } else if (this.u4.call(a8).toboolean()) {
                        org.luaj.vm2.LuaValue a10 = k5;
                        org.luaj.vm2.LuaValue a11 = this.u5;
                        org.luaj.vm2.LuaValue a12 = this.u6;
                        org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[4];
                        a13[0] = a8;
                        a13[1] = a10;
                        a13[2] = a11;
                        a13[3] = a12;
                        ((org.luaj.vm2.LuaValue)a9).invoke(org.luaj.vm2.LuaValue.varargsOf(a13));
                    } else if (this.u7.call(a8).toboolean()) {
                        a0[0] = this.u1.get(k3).call(a0[0]).concat(k6);
                    } else if (this.u8.call(a8).toboolean()) {
                        org.luaj.vm2.LuaValue a14 = k7;
                        org.luaj.vm2.LuaValue a15 = this.u9;
                        org.luaj.vm2.LuaValue a16 = this.u10;
                        org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[4];
                        a17[0] = a8;
                        a17[1] = a14;
                        a17[2] = a15;
                        a17[3] = a16;
                        ((org.luaj.vm2.LuaValue)a9).invoke(org.luaj.vm2.LuaValue.varargsOf(a17));
                    } else if (this.u11.call(a8).toboolean()) {
                        org.luaj.vm2.LuaValue a18 = k8;
                        org.luaj.vm2.LuaValue a19 = this.u12;
                        org.luaj.vm2.LuaValue a20 = this.u13;
                        org.luaj.vm2.LuaValue[] a21 = new org.luaj.vm2.LuaValue[4];
                        a21[0] = a8;
                        a21[1] = a18;
                        a21[2] = a19;
                        a21[3] = a20;
                        ((org.luaj.vm2.LuaValue)a9).invoke(org.luaj.vm2.LuaValue.varargsOf(a21));
                    } else {
                        this.u1.get(k9).call(k10);
                    }
                } else {
                    a1 = a2;
                    break;
                }
            }
        }
        return a0[0];
    }
}
