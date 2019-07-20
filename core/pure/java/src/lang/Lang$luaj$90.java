package lang;
public class Lang$luaj$90 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue[] u5;
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
    
    public Lang$luaj$90() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(4);
        if (a0.eq_b(a1)) {
            org.luaj.vm2.Varargs a2 = this.u0;
            return a2;
        }
        org.luaj.vm2.LuaValue a3 = this.u1[0].call(a0);
        org.luaj.vm2.LuaValue a4 = this.u1[0].call(a1);
        if (!this.u2.call(a3).toboolean() && !this.u2.call(a4).toboolean()) {
            if (a3.eq_b(a4)) {
                org.luaj.vm2.Varargs a5 = this.u0;
                return a5;
            }
            Lang$luaj$90$H_if a6 = new Lang$luaj$90$H_if();
            a6.u0 = this.u3;
            a6.u1 = this.u5;
            Lang$luaj$90$H_and a7 = new Lang$luaj$90$H_and();
            a7.u0 = a6;
            a7.u1 = this.u6;
            this.u7.call(this.u2.call(a3).not());
            Lang$luaj$90$end_2 a8 = new Lang$luaj$90$end_2();
            a8.u0 = a7;
            a8.u1 = this.u3;
            a8.u2 = this.u4;
            if (this.u8.call(a3).toboolean()) {
                if (!this.u8.call(a3).toboolean()) {
                    org.luaj.vm2.Varargs a9 = this.u6;
                    return a9;
                }
                org.luaj.vm2.Varargs a10 = this.u0;
                return a10;
            } else if (this.u9.call(a3).toboolean()) {
                if (!this.u9.call(a4).toboolean()) {
                    org.luaj.vm2.Varargs a11 = this.u6;
                    return a11;
                }
                if (this.u10.call(a3, a4).toboolean()) {
                    org.luaj.vm2.Varargs a12 = this.u0;
                    return a12;
                }
                org.luaj.vm2.Varargs a13 = this.u6;
                return a13;
            } else if (this.u11.call(a3).toboolean()) {
                if (!this.u11.call(a4).toboolean()) {
                    org.luaj.vm2.Varargs a14 = this.u6;
                    return a14;
                }
                org.luaj.vm2.LuaValue a15 = this.u12;
                org.luaj.vm2.LuaValue a16 = this.u13;
                org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[4];
                a17[0] = a3;
                a17[1] = a4;
                a17[2] = a15;
                a17[3] = a16;
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a8, org.luaj.vm2.LuaValue.varargsOf(a17));
            } else if (this.u14.call(a3).toboolean()) {
                if (!this.u14.call(a4).toboolean()) {
                    org.luaj.vm2.Varargs a18 = this.u6;
                    return a18;
                }
                org.luaj.vm2.LuaValue a19 = this.u15;
                org.luaj.vm2.LuaValue a20 = this.u16;
                org.luaj.vm2.LuaValue[] a21 = new org.luaj.vm2.LuaValue[4];
                a21[0] = a3;
                a21[1] = a4;
                a21[2] = a19;
                a21[3] = a20;
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a8, org.luaj.vm2.LuaValue.varargsOf(a21));
            } else {
                if (!this.u17.call(a3).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u20, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (!this.u17.call(a4).toboolean()) {
                    org.luaj.vm2.Varargs a22 = this.u6;
                    return a22;
                }
                org.luaj.vm2.LuaValue a23 = this.u18;
                org.luaj.vm2.LuaValue a24 = this.u19;
                org.luaj.vm2.LuaValue[] a25 = new org.luaj.vm2.LuaValue[4];
                a25[0] = a3;
                a25[1] = a4;
                a25[2] = a23;
                a25[3] = a24;
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a8, org.luaj.vm2.LuaValue.varargsOf(a25));
            }
        }
        org.luaj.vm2.LuaValue a26 = this.u3;
        org.luaj.vm2.LuaValue a27 = this.u4[0];
        org.luaj.vm2.LuaTable a28 = org.luaj.vm2.LuaValue.tableOf(2, 0);
        ((org.luaj.vm2.LuaValue)a28).rawset(1, a3);
        ((org.luaj.vm2.LuaValue)a28).rawset(2, a4);
        return org.luaj.vm2.LuaValue.tailcallOf(a26, org.luaj.vm2.LuaValue.varargsOf(a27, (org.luaj.vm2.Varargs)a28));
    }
}
