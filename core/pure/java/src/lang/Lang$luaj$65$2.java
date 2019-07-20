package lang;
public class Lang$luaj$65$2 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
    org.luaj.vm2.LuaValue u21;
    org.luaj.vm2.LuaValue u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue[] u25;
    org.luaj.vm2.LuaValue u26;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaString.valueOf("error");
        k2 = org.luaj.vm2.LuaString.valueOf("WIP");
        k3 = org.luaj.vm2.LuaValue.valueOf(1);
        k4 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$65$2() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        if (!a0.len().eq_b(k0)) {
            this.u0.get(k1).call(k2);
        }
        if (this.u1[0].call(a1.get(k3), this.u2[0]).toboolean()) {
            if (a1.len().eq_b(k3)) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a2 = a1.get(k4);
            org.luaj.vm2.LuaTable a3 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a4 = k4;
            while(a4.lt_b(a1.len())) {
                this.u4.call((org.luaj.vm2.LuaValue)a3, a1.get(a4.add(k3)));
                a4 = a4.add(k3);
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(this.u6, a2, (org.luaj.vm2.Varargs)a3));
        } else if (this.u1[0].call(a1.get(k3), this.u7[0]).toboolean()) {
            if (a1.len().eq_b(k3)) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a5 = this.u8[0].invoke(this.u9.invoke(this.u6, (org.luaj.vm2.Varargs)a1.get(k4)).subargs(1)).arg1();
            if (!this.u10.call(a5).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a6 = this.u11[0].invoke(this.u12.invoke((org.luaj.vm2.Varargs)a5).subargs(1)).arg1();
            if (this.u13.call(a6).toboolean()) {
                org.luaj.vm2.Varargs a7 = this.u14;
                return a7;
            }
            if (!this.u15.call(a6).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            if (!this.u16.call(a6, this.u17[0]).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a8 = this.u11[0].invoke(this.u18.invoke((org.luaj.vm2.Varargs)a5).subargs(1)).arg1();
            if (this.u13.call(a8).toboolean()) {
                org.luaj.vm2.Varargs a9 = this.u14;
                return a9;
            }
            if (!this.u19.call(a8).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a10 = this.u20.call(a8);
            org.luaj.vm2.LuaValue a11 = this.u11[0].invoke(this.u21.invoke((org.luaj.vm2.Varargs)a8).subargs(1)).arg1();
            if (this.u13.call(a11).toboolean()) {
                org.luaj.vm2.Varargs a12 = this.u14;
                return a12;
            }
            if (!this.u22.call(a11).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaTable a13 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            ((org.luaj.vm2.LuaValue)a13).rawsetlist(1, this.u23.invoke((org.luaj.vm2.Varargs)this.u6));
            org.luaj.vm2.LuaValue a14 = k4;
            while(a14.lt_b(a1.len())) {
                this.u4.call((org.luaj.vm2.LuaValue)a13, a1.get(a14.add(k3)));
                a14 = a14.add(k3);
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u24, org.luaj.vm2.LuaValue.varargsOf(a10, (org.luaj.vm2.Varargs)a13));
        } else if (this.u1[0].call(a1.get(k3), this.u25[0]).toboolean()) {
            if (a1.len().eq_b(k3)) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a15 = a1.get(k4);
            org.luaj.vm2.LuaTable a16 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a17 = k4;
            while(a17.lt_b(a1.len())) {
                org.luaj.vm2.LuaValue a18 = this.u4;
                org.luaj.vm2.Varargs a19 = this.u9.invoke(this.u6, (org.luaj.vm2.Varargs)a1.get(a17.add(k3)));
                org.luaj.vm2.LuaValue[] a20 = new org.luaj.vm2.LuaValue[1];
                a20[0] = a16;
                a18.invoke(org.luaj.vm2.LuaValue.varargsOf(a20, a19));
                a17 = a17.add(k3);
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u26, org.luaj.vm2.LuaValue.varargsOf(a15, (org.luaj.vm2.Varargs)a16));
        } else {
            org.luaj.vm2.LuaValue a21 = this.u9.call(this.u6, a1.get(k3));
            org.luaj.vm2.LuaTable a22 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a23 = k3;
            while(a23.lt_b(a1.len())) {
                org.luaj.vm2.LuaValue a24 = this.u4;
                org.luaj.vm2.Varargs a25 = this.u9.invoke(this.u6, (org.luaj.vm2.Varargs)a1.get(a23.add(k3)));
                org.luaj.vm2.LuaValue[] a26 = new org.luaj.vm2.LuaValue[1];
                a26[0] = a22;
                a24.invoke(org.luaj.vm2.LuaValue.varargsOf(a26, a25));
                a23 = a23.add(k3);
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u24, org.luaj.vm2.LuaValue.varargsOf(a21, (org.luaj.vm2.Varargs)a22));
        }
    }
}
