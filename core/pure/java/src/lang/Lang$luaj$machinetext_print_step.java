package lang;
public class Lang$luaj$machinetext_print_step extends org.luaj.vm2.lib.VarArgFunction {
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
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k1 = org.luaj.vm2.LuaString.valueOf("^");
        k2 = org.luaj.vm2.LuaString.valueOf(".");
        k3 = org.luaj.vm2.LuaString.valueOf("_");
        k4 = org.luaj.vm2.LuaString.valueOf("#");
        k5 = org.luaj.vm2.LuaString.valueOf("!");
        k6 = org.luaj.vm2.LuaString.valueOf("$");
    }
    
    public Lang$luaj$machinetext_print_step() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.Varargs a3 = this.u0.get(k0).invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue a4 = a3.arg1();
        org.luaj.vm2.LuaValue a5 = a3.arg(2);
        org.luaj.vm2.LuaValue a6 = a3.arg(3);
        while(true) {
            org.luaj.vm2.Varargs a7 = a4.invoke(a5, (org.luaj.vm2.Varargs)a6);
            a6 = a7.arg1();
            org.luaj.vm2.LuaValue a8 = a7.arg(2);
            if (a6.isnil()) {
                org.luaj.vm2.LuaTable a9 = org.luaj.vm2.LuaValue.tableOf(2, 0);
                ((org.luaj.vm2.LuaValue)a9).rawset(1, (org.luaj.vm2.LuaValue)a1);
                ((org.luaj.vm2.LuaValue)a9).rawset(2, (org.luaj.vm2.LuaValue)a2);
                org.luaj.vm2.Varargs a10 = a9;
                return a10;
            }
            org.luaj.vm2.LuaValue a11 = this.u1.call(a8);
            Lang$luaj$machinetext_print_step$conslike a12 = new Lang$luaj$machinetext_print_step$conslike();
            a12.u0 = this.u2;
            a12.u1 = a1;
            a12.u2 = a2;
            if (this.u3.call(a11).toboolean()) {
                org.luaj.vm2.LuaValue a13 = this.u2;
                org.luaj.vm2.LuaValue a14 = k1;
                org.luaj.vm2.LuaValue a15 = this.u4.call(a11);
                org.luaj.vm2.LuaValue a16 = k1;
                org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[4];
                a17[0] = a1;
                a17[1] = a14;
                a17[2] = a15;
                a17[3] = a16;
                a13.invoke(org.luaj.vm2.LuaValue.varargsOf(a17));
            } else if (this.u5.call(a11).toboolean()) {
                org.luaj.vm2.LuaValue a18 = k2;
                org.luaj.vm2.LuaValue a19 = this.u6;
                org.luaj.vm2.LuaValue a20 = this.u7;
                org.luaj.vm2.LuaValue[] a21 = new org.luaj.vm2.LuaValue[4];
                a21[0] = a11;
                a21[1] = a18;
                a21[2] = a19;
                a21[3] = a20;
                ((org.luaj.vm2.LuaValue)a12).invoke(org.luaj.vm2.LuaValue.varargsOf(a21));
            } else if (this.u8.call(a11).toboolean()) {
                this.u2.call((org.luaj.vm2.LuaValue)a1, k3);
            } else if (this.u9.call(a11).toboolean()) {
                org.luaj.vm2.LuaValue a22 = k4;
                org.luaj.vm2.LuaValue a23 = this.u10;
                org.luaj.vm2.LuaValue a24 = this.u11;
                org.luaj.vm2.LuaValue[] a25 = new org.luaj.vm2.LuaValue[4];
                a25[0] = a11;
                a25[1] = a22;
                a25[2] = a23;
                a25[3] = a24;
                ((org.luaj.vm2.LuaValue)a12).invoke(org.luaj.vm2.LuaValue.varargsOf(a25));
            } else if (this.u12.call(a11).toboolean()) {
                org.luaj.vm2.LuaValue a26 = k5;
                org.luaj.vm2.LuaValue a27 = this.u13;
                org.luaj.vm2.LuaValue a28 = this.u14;
                org.luaj.vm2.LuaValue[] a29 = new org.luaj.vm2.LuaValue[4];
                a29[0] = a11;
                a29[1] = a26;
                a29[2] = a27;
                a29[3] = a28;
                ((org.luaj.vm2.LuaValue)a12).invoke(org.luaj.vm2.LuaValue.varargsOf(a29));
            } else {
                if (!this.u15.call(a11).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u20, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a30 = this.u16.call(a11);
                org.luaj.vm2.LuaValue a31 = k6;
                Lang$luaj$machinetext_print_step$1 a32 = new Lang$luaj$machinetext_print_step$1();
                a32.u0 = this.u17;
                a32.u1 = this.u18;
                org.luaj.vm2.LuaValue a33 = this.u19;
                org.luaj.vm2.LuaValue[] a34 = new org.luaj.vm2.LuaValue[4];
                a34[0] = a30;
                a34[1] = a31;
                a34[2] = a32;
                a34[3] = a33;
                ((org.luaj.vm2.LuaValue)a12).invoke(org.luaj.vm2.LuaValue.varargsOf(a34));
            }
        }
    }
}
