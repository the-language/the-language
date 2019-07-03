package lang;
public class Lang$luaj$73 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue[] u2;
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
    
    public Lang$luaj$73() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        if (a0.eq_b(a1)) {
            org.luaj.vm2.Varargs a2 = org.luaj.vm2.LuaValue.TRUE;
            return a2;
        }
        org.luaj.vm2.LuaValue a3 = this.u0[0].call(a0);
        org.luaj.vm2.LuaValue a4 = this.u0[0].call(a1);
        if (a3.eq_b(a4)) {
            org.luaj.vm2.Varargs a5 = org.luaj.vm2.LuaValue.TRUE;
            return a5;
        }
        Lang$luaj$73$end_2 a6 = new Lang$luaj$73$end_2();
        a6.u0 = this.u1;
        a6.u1 = this.u2;
        if (this.u3.call(a3).toboolean()) {
            if (!this.u3.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a7 = org.luaj.vm2.LuaValue.FALSE;
                return a7;
            }
            this.u2[0].call(a3, a4);
            org.luaj.vm2.Varargs a8 = org.luaj.vm2.LuaValue.TRUE;
            return a8;
        } else if (this.u4.call(a3).toboolean()) {
            if (!this.u4.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a9 = org.luaj.vm2.LuaValue.FALSE;
                return a9;
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(a3, (org.luaj.vm2.Varargs)a4));
        } else if (this.u6.call(a3).toboolean()) {
            if (!this.u6.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a10 = org.luaj.vm2.LuaValue.FALSE;
                return a10;
            }
            org.luaj.vm2.LuaValue a11 = this.u7;
            org.luaj.vm2.LuaValue a12 = this.u8;
            org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[4];
            a13[0] = a3;
            a13[1] = a4;
            a13[2] = a11;
            a13[3] = a12;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, org.luaj.vm2.LuaValue.varargsOf(a13));
        } else if (this.u9.call(a3).toboolean()) {
            if (!this.u9.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a14 = org.luaj.vm2.LuaValue.FALSE;
                return a14;
            }
            org.luaj.vm2.LuaValue a15 = this.u10;
            org.luaj.vm2.LuaValue a16 = this.u11;
            org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[4];
            a17[0] = a3;
            a17[1] = a4;
            a17[2] = a15;
            a17[3] = a16;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, org.luaj.vm2.LuaValue.varargsOf(a17));
        } else {
            if (!this.u12.call(a3).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u15, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            if (!this.u12.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a18 = org.luaj.vm2.LuaValue.FALSE;
                return a18;
            }
            org.luaj.vm2.LuaValue a19 = this.u13;
            org.luaj.vm2.LuaValue a20 = this.u14;
            org.luaj.vm2.LuaValue[] a21 = new org.luaj.vm2.LuaValue[4];
            a21[0] = a3;
            a21[1] = a4;
            a21[2] = a19;
            a21[3] = a20;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, org.luaj.vm2.LuaValue.varargsOf(a21));
        }
    }
}
