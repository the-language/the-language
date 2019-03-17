public class lang$luaj$77$15$1 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
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
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf(".");
        k1 = org.luaj.vm2.LuaString.valueOf(":");
        k2 = org.luaj.vm2.LuaString.valueOf("~");
        k3 = org.luaj.vm2.LuaString.valueOf("@");
        k4 = org.luaj.vm2.LuaString.valueOf("?");
        k5 = org.luaj.vm2.LuaString.valueOf("/");
    }
    
    public lang$luaj$77$15$1() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0.call().toboolean()) {
            org.luaj.vm2.Varargs a1 = a0;
            return a1;
        }
        org.luaj.vm2.LuaValue a2 = this.u1.call();
        if (a2.eq_b(k0)) {
            org.luaj.vm2.LuaValue a3 = this.u2[0].call();
            return org.luaj.vm2.LuaValue.tailcallOf(this.u3, org.luaj.vm2.LuaValue.varargsOf(this.u4, this.u3.call(this.u5[0], this.u3.call(a0), this.u6), (org.luaj.vm2.Varargs)a3));
        }
        if (a2.eq_b(k1)) {
            org.luaj.vm2.LuaValue a4 = this.u2[0].call();
            return org.luaj.vm2.LuaValue.tailcallOf(this.u3, org.luaj.vm2.LuaValue.varargsOf(this.u4, a4, (org.luaj.vm2.Varargs)a0));
        }
        if (a2.eq_b(k2)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u3, org.luaj.vm2.LuaValue.varargsOf(this.u7, (org.luaj.vm2.Varargs)a0));
        }
        if (a2.eq_b(k3)) {
            org.luaj.vm2.LuaValue a5 = this.u2[0].call();
            return org.luaj.vm2.LuaValue.tailcallOf(this.u3, org.luaj.vm2.LuaValue.varargsOf(this.u4, this.u3.call(this.u5[0], this.u8.call(a0, this.u6), this.u6), (org.luaj.vm2.Varargs)a5));
        }
        if (a2.eq_b(k4)) {
            org.luaj.vm2.LuaValue a6 = this.u3;
            org.luaj.vm2.LuaValue a7 = this.u4;
            org.luaj.vm2.LuaValue a8 = this.u5[0];
            org.luaj.vm2.Varargs a9 = this.u3.invoke(this.u7, (org.luaj.vm2.Varargs)a0);
            org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[2];
            a10[0] = a7;
            a10[1] = a8;
            return org.luaj.vm2.LuaValue.tailcallOf(a6, org.luaj.vm2.LuaValue.varargsOf(a10, a9));
        }
        if (!a2.eq_b(k5)) {
            this.u10.call(a2);
            org.luaj.vm2.Varargs a11 = a0;
            return a11;
        }
        org.luaj.vm2.LuaTable a12 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a12).rawset(1, a0);
        while(true) {
            org.luaj.vm2.LuaValue a13 = this.u2[0].call((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
            this.u9.call((org.luaj.vm2.LuaValue)a12, a13);
            if (!this.u0.call().toboolean()) {
                org.luaj.vm2.LuaValue a14 = this.u1.call();
                if (a14.eq_b(k5)) {
                    continue;
                }
                this.u10.call(a14);
            }
            org.luaj.vm2.LuaValue a15 = this.u3;
            org.luaj.vm2.LuaValue a16 = this.u11;
            org.luaj.vm2.Varargs a17 = this.u12.invoke((org.luaj.vm2.Varargs)a12);
            org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[1];
            a18[0] = a16;
            return org.luaj.vm2.LuaValue.tailcallOf(a15, org.luaj.vm2.LuaValue.varargsOf(a18, a17));
        }
    }
}
