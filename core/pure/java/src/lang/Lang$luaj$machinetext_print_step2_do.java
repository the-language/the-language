package lang;
public class Lang$luaj$machinetext_print_step2_do extends org.luaj.vm2.lib.VarArgFunction {
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
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("^");
        k1 = org.luaj.vm2.LuaString.valueOf(".");
        k2 = org.luaj.vm2.LuaString.valueOf("_");
        k3 = org.luaj.vm2.LuaString.valueOf("#");
        k4 = org.luaj.vm2.LuaString.valueOf("!");
        k5 = org.luaj.vm2.LuaString.valueOf("$");
    }
    
    public Lang$luaj$machinetext_print_step2_do() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0.call(a0);
        Lang$luaj$machinetext_print_step2_do$conslike a4 = new Lang$luaj$machinetext_print_step2_do$conslike();
        a4.u0 = a1;
        a4.u1 = a2;
        if (this.u1.call(a3).toboolean()) {
            a1.call(k0);
            a1.invoke(this.u2.invoke((org.luaj.vm2.Varargs)a3).subargs(1));
            return org.luaj.vm2.LuaValue.tailcallOf(a1, (org.luaj.vm2.Varargs)k0);
        }
        if (this.u3.call(a3).toboolean()) {
            org.luaj.vm2.LuaValue a5 = k1;
            org.luaj.vm2.LuaValue a6 = this.u4;
            org.luaj.vm2.LuaValue a7 = this.u5;
            org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[4];
            a8[0] = a3;
            a8[1] = a5;
            a8[2] = a6;
            a8[3] = a7;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, org.luaj.vm2.LuaValue.varargsOf(a8));
        }
        if (this.u6.call(a3).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(a1, (org.luaj.vm2.Varargs)k2);
        }
        if (this.u7.call(a3).toboolean()) {
            org.luaj.vm2.LuaValue a9 = k3;
            org.luaj.vm2.LuaValue a10 = this.u8;
            org.luaj.vm2.LuaValue a11 = this.u9;
            org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[4];
            a12[0] = a3;
            a12[1] = a9;
            a12[2] = a10;
            a12[3] = a11;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, org.luaj.vm2.LuaValue.varargsOf(a12));
        }
        if (this.u10.call(a3).toboolean()) {
            org.luaj.vm2.LuaValue a13 = k4;
            org.luaj.vm2.LuaValue a14 = this.u11;
            org.luaj.vm2.LuaValue a15 = this.u12;
            org.luaj.vm2.LuaValue[] a16 = new org.luaj.vm2.LuaValue[4];
            a16[0] = a3;
            a16[1] = a13;
            a16[2] = a14;
            a16[3] = a15;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, org.luaj.vm2.LuaValue.varargsOf(a16));
        }
        if (!this.u13.call(a3).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u18, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        org.luaj.vm2.LuaValue a17 = this.u14.call(a3);
        org.luaj.vm2.LuaValue a18 = k5;
        Lang$luaj$machinetext_print_step2_do$1 a19 = new Lang$luaj$machinetext_print_step2_do$1();
        a19.u0 = this.u15;
        a19.u1 = this.u16;
        org.luaj.vm2.LuaValue a20 = this.u17;
        org.luaj.vm2.LuaValue[] a21 = new org.luaj.vm2.LuaValue[4];
        a21[0] = a17;
        a21[1] = a18;
        a21[2] = a19;
        a21[3] = a20;
        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, org.luaj.vm2.LuaValue.varargsOf(a21));
    }
}
