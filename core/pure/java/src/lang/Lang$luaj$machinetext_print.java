package lang;
public class Lang$luaj$machinetext_print extends org.luaj.vm2.lib.VarArgFunction {
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
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
        k4 = org.luaj.vm2.LuaString.valueOf("^");
        k5 = org.luaj.vm2.LuaString.valueOf(".");
        k6 = org.luaj.vm2.LuaString.valueOf("_");
        k7 = org.luaj.vm2.LuaString.valueOf("#");
        k8 = org.luaj.vm2.LuaString.valueOf("$");
    }
    
    public Lang$luaj$machinetext_print() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue[] a0 = Lang$luaj$machinetext_print.newupn();
        org.luaj.vm2.LuaValue a1 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        a0[0] = a1;
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a0[0]);
        a0[0] = k0;
        while(!((org.luaj.vm2.LuaValue)a2).len().eq_b(k1)) {
            org.luaj.vm2.LuaTable a3 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.Varargs a4 = this.u0.get(k2).invoke((org.luaj.vm2.Varargs)a2);
            org.luaj.vm2.LuaValue a5 = a4.arg1();
            org.luaj.vm2.LuaValue a6 = a4.arg(2);
            org.luaj.vm2.LuaValue a7 = a4.arg(3);
            while(true) {
                org.luaj.vm2.Varargs a8 = a5.invoke(a6, (org.luaj.vm2.Varargs)a7);
                a7 = a8.arg1();
                org.luaj.vm2.LuaValue a9 = a8.arg(2);
                if (a7.isnil()) {
                    a2 = a3;
                    break;
                } else {
                    org.luaj.vm2.LuaValue a10 = this.u1.call(a9);
                    Lang$luaj$machinetext_print$conslike a11 = new Lang$luaj$machinetext_print$conslike();
                    a11.u0 = a0;
                    a11.u1 = this.u0;
                    a11.u2 = this.u2;
                    a11.u3 = a3;
                    if (this.u3.call(a10).toboolean()) {
                        a0[0] = this.u0.get(k3).call(a0[0]).concat(this.u0.get(k3).call(k4.concat(this.u0.get(k3).invoke(this.u4.invoke((org.luaj.vm2.Varargs)a10).subargs(1)).arg1().concat(k4.buffer())).value()));
                    } else if (this.u5.call(a10).toboolean()) {
                        org.luaj.vm2.LuaValue a12 = k5;
                        org.luaj.vm2.LuaValue a13 = this.u6;
                        org.luaj.vm2.LuaValue a14 = this.u7;
                        org.luaj.vm2.LuaValue[] a15 = new org.luaj.vm2.LuaValue[4];
                        a15[0] = a10;
                        a15[1] = a12;
                        a15[2] = a13;
                        a15[3] = a14;
                        ((org.luaj.vm2.LuaValue)a11).invoke(org.luaj.vm2.LuaValue.varargsOf(a15));
                    } else if (this.u8.call(a10).toboolean()) {
                        a0[0] = this.u0.get(k3).call(a0[0]).concat(this.u0.get(k3).call(k6));
                    } else if (this.u9.call(a10).toboolean()) {
                        org.luaj.vm2.LuaValue a16 = k7;
                        org.luaj.vm2.LuaValue a17 = this.u10;
                        org.luaj.vm2.LuaValue a18 = this.u11;
                        org.luaj.vm2.LuaValue[] a19 = new org.luaj.vm2.LuaValue[4];
                        a19[0] = a10;
                        a19[1] = a16;
                        a19[2] = a17;
                        a19[3] = a18;
                        ((org.luaj.vm2.LuaValue)a11).invoke(org.luaj.vm2.LuaValue.varargsOf(a19));
                    } else {
                        if (!this.u12.call(a10).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf(this.u17, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a20 = this.u13.call(a10);
                        org.luaj.vm2.LuaValue a21 = k8;
                        Lang$luaj$machinetext_print$1 a22 = new Lang$luaj$machinetext_print$1();
                        a22.u0 = this.u14;
                        a22.u1 = this.u15;
                        org.luaj.vm2.LuaValue a23 = this.u16;
                        org.luaj.vm2.LuaValue[] a24 = new org.luaj.vm2.LuaValue[4];
                        a24[0] = a20;
                        a24[1] = a21;
                        a24[2] = a22;
                        a24[3] = a23;
                        ((org.luaj.vm2.LuaValue)a11).invoke(org.luaj.vm2.LuaValue.varargsOf(a24));
                    }
                }
            }
        }
        org.luaj.vm2.Varargs a25 = a0[0];
        return a25;
    }
}
