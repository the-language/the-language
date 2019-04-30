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
    final static org.luaj.vm2.LuaValue k11;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
        k4 = org.luaj.vm2.LuaString.valueOf("$");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
        k7 = org.luaj.vm2.LuaString.valueOf("_");
        k8 = org.luaj.vm2.LuaString.valueOf("#");
        k9 = org.luaj.vm2.LuaString.valueOf("!");
        k10 = org.luaj.vm2.LuaString.valueOf("error");
        k11 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$machinetext_parse$1() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a0).rawset(1, a);
        org.luaj.vm2.LuaValue a1 = k0;
        while(!((org.luaj.vm2.LuaValue)a0).len().eq_b(k1)) {
            org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a3 = k2;
            org.luaj.vm2.LuaValue a4 = ((org.luaj.vm2.LuaValue)a0).len();
            org.luaj.vm2.LuaValue a5 = k2;
            org.luaj.vm2.LuaValue a6 = a3.sub(a5);
            while(true) {
                a6 = a6.add(a5);
                if (a6.testfor_b(a4, a5)) {
                    org.luaj.vm2.LuaValue a7 = ((org.luaj.vm2.LuaValue)a0).get(a6);
                    org.luaj.vm2.LuaValue a8 = this.u0.call(a7);
                    if (this.u1.call(a8).toboolean()) {
                        org.luaj.vm2.LuaValue a9 = this.u2.get(k3).call(a1).concat(k4);
                        org.luaj.vm2.LuaValue a10 = this.u2.get(k3).call(a9).concat(this.u2.get(k3).invoke(this.u3.invoke((org.luaj.vm2.Varargs)a8).subargs(1)).arg1());
                        a1 = this.u2.get(k3).call(a10).concat(k4);
                    } else if (this.u4.call(a8).toboolean()) {
                        a1 = this.u2.get(k3).call(a1).concat(k5);
                        org.luaj.vm2.LuaValue a11 = this.u2.get(k6);
                        org.luaj.vm2.Varargs a12 = this.u5.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[1];
                        a13[0] = a2;
                        a11.invoke(org.luaj.vm2.LuaValue.varargsOf(a13, a12));
                        org.luaj.vm2.LuaValue a14 = this.u2.get(k6);
                        org.luaj.vm2.Varargs a15 = this.u6.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a16 = new org.luaj.vm2.LuaValue[1];
                        a16[0] = a2;
                        a14.invoke(org.luaj.vm2.LuaValue.varargsOf(a16, a15));
                    } else if (this.u7.call(a8).toboolean()) {
                        a1 = this.u2.get(k3).call(a1).concat(k7);
                    } else if (this.u8.call(a8).toboolean()) {
                        a1 = this.u2.get(k3).call(a1).concat(k8);
                        org.luaj.vm2.LuaValue a17 = this.u2.get(k6);
                        org.luaj.vm2.Varargs a18 = this.u9.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a19 = new org.luaj.vm2.LuaValue[1];
                        a19[0] = a2;
                        a17.invoke(org.luaj.vm2.LuaValue.varargsOf(a19, a18));
                        org.luaj.vm2.LuaValue a20 = this.u2.get(k6);
                        org.luaj.vm2.Varargs a21 = this.u10.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a22 = new org.luaj.vm2.LuaValue[1];
                        a22[0] = a2;
                        a20.invoke(org.luaj.vm2.LuaValue.varargsOf(a22, a21));
                    } else if (this.u11.call(a8).toboolean()) {
                        a1 = this.u2.get(k3).call(a1).concat(k9);
                        org.luaj.vm2.LuaValue a23 = this.u2.get(k6);
                        org.luaj.vm2.Varargs a24 = this.u12.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a25 = new org.luaj.vm2.LuaValue[1];
                        a25[0] = a2;
                        a23.invoke(org.luaj.vm2.LuaValue.varargsOf(a25, a24));
                        org.luaj.vm2.LuaValue a26 = this.u2.get(k6);
                        org.luaj.vm2.Varargs a27 = this.u13.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a28 = new org.luaj.vm2.LuaValue[1];
                        a28[0] = a2;
                        a26.invoke(org.luaj.vm2.LuaValue.varargsOf(a28, a27));
                    } else {
                        this.u2.get(k10).call(k11);
                    }
                } else {
                    a0 = a2;
                    break;
                }
            }
        }
        return a1;
    }
}
