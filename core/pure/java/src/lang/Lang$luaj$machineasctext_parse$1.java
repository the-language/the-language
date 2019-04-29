package lang;
public class Lang$luaj$machineasctext_parse$1 extends org.luaj.vm2.lib.OneArgFunction {
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
    final static org.luaj.vm2.LuaValue k12;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
        k3 = org.luaj.vm2.LuaString.valueOf("encodeURI");
        k4 = org.luaj.vm2.LuaString.valueOf("tostring");
        k5 = org.luaj.vm2.LuaString.valueOf("$");
        k6 = org.luaj.vm2.LuaString.valueOf(".");
        k7 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
        k8 = org.luaj.vm2.LuaString.valueOf("_");
        k9 = org.luaj.vm2.LuaString.valueOf("#");
        k10 = org.luaj.vm2.LuaString.valueOf("!");
        k11 = org.luaj.vm2.LuaString.valueOf("error");
        k12 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$machineasctext_parse$1() {
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
                        org.luaj.vm2.LuaValue a9 = this.u2.get(k3);
                        org.luaj.vm2.LuaValue a10 = org.luaj.vm2.LuaValue.NIL;
                        org.luaj.vm2.Varargs a11 = this.u3.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
                        a12[0] = a10;
                        org.luaj.vm2.LuaValue a13 = a9.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11)).arg1();
                        org.luaj.vm2.LuaValue a14 = this.u2.get(k4).call(a1).concat(k5);
                        org.luaj.vm2.LuaValue a15 = this.u2.get(k4).call(a14).concat(this.u2.get(k4).call(a13));
                        a1 = this.u2.get(k4).call(a15).concat(k5);
                    } else if (this.u4.call(a8).toboolean()) {
                        a1 = this.u2.get(k4).call(a1).concat(k6);
                        org.luaj.vm2.LuaValue a16 = this.u2.get(k7);
                        org.luaj.vm2.Varargs a17 = this.u5.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[1];
                        a18[0] = a2;
                        a16.invoke(org.luaj.vm2.LuaValue.varargsOf(a18, a17));
                        org.luaj.vm2.LuaValue a19 = this.u2.get(k7);
                        org.luaj.vm2.Varargs a20 = this.u6.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a21 = new org.luaj.vm2.LuaValue[1];
                        a21[0] = a2;
                        a19.invoke(org.luaj.vm2.LuaValue.varargsOf(a21, a20));
                    } else if (this.u7.call(a8).toboolean()) {
                        a1 = this.u2.get(k4).call(a1).concat(k8);
                    } else if (this.u8.call(a8).toboolean()) {
                        a1 = this.u2.get(k4).call(a1).concat(k9);
                        org.luaj.vm2.LuaValue a22 = this.u2.get(k7);
                        org.luaj.vm2.Varargs a23 = this.u9.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a24 = new org.luaj.vm2.LuaValue[1];
                        a24[0] = a2;
                        a22.invoke(org.luaj.vm2.LuaValue.varargsOf(a24, a23));
                        org.luaj.vm2.LuaValue a25 = this.u2.get(k7);
                        org.luaj.vm2.Varargs a26 = this.u10.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a27 = new org.luaj.vm2.LuaValue[1];
                        a27[0] = a2;
                        a25.invoke(org.luaj.vm2.LuaValue.varargsOf(a27, a26));
                    } else if (this.u11.call(a8).toboolean()) {
                        a1 = this.u2.get(k4).call(a1).concat(k10);
                        org.luaj.vm2.LuaValue a28 = this.u2.get(k7);
                        org.luaj.vm2.Varargs a29 = this.u12.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a30 = new org.luaj.vm2.LuaValue[1];
                        a30[0] = a2;
                        a28.invoke(org.luaj.vm2.LuaValue.varargsOf(a30, a29));
                        org.luaj.vm2.LuaValue a31 = this.u2.get(k7);
                        org.luaj.vm2.Varargs a32 = this.u13.invoke((org.luaj.vm2.Varargs)a8);
                        org.luaj.vm2.LuaValue[] a33 = new org.luaj.vm2.LuaValue[1];
                        a33[0] = a2;
                        a31.invoke(org.luaj.vm2.LuaValue.varargsOf(a33, a32));
                    } else {
                        this.u2.get(k11).call(k12);
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
