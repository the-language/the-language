package lang;
public class Lang$luaj$79 extends org.luaj.vm2.lib.VarArgFunction {
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
    
    public Lang$luaj$79() {
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
        Lang$luaj$79$end_2 a6 = new Lang$luaj$79$end_2();
        a6.u0 = this.u1;
        a6.u1 = this.u2;
        if (this.u3.call(a3).toboolean()) {
            org.luaj.vm2.LuaValue a7 = this.u4.call(a3);
            org.luaj.vm2.LuaValue a8 = this.u1[0].call(a7, a4);
            if (a8.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                a8 = org.luaj.vm2.LuaValue.NIL;
            }
            org.luaj.vm2.Varargs a9 = a8;
            return a9;
        } else if (this.u3.call(a4).toboolean()) {
            org.luaj.vm2.LuaValue a10 = this.u4.call(a4);
            org.luaj.vm2.LuaValue a11 = this.u1[0].call(a3, a10);
            if (a11.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
                a11 = org.luaj.vm2.LuaValue.NIL;
            }
            org.luaj.vm2.Varargs a12 = a11;
            return a12;
        } else if (this.u5.call(a3).toboolean()) {
            if (!this.u5.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a13 = org.luaj.vm2.LuaValue.FALSE;
                return a13;
            }
            this.u2[0].call(a3, a4);
            org.luaj.vm2.Varargs a14 = org.luaj.vm2.LuaValue.TRUE;
            return a14;
        } else if (this.u6.call(a3).toboolean()) {
            if (!this.u6.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a15 = org.luaj.vm2.LuaValue.FALSE;
                return a15;
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u7, org.luaj.vm2.LuaValue.varargsOf(a3, (org.luaj.vm2.Varargs)a4));
        } else if (this.u8.call(a3).toboolean()) {
            if (!this.u8.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a16 = org.luaj.vm2.LuaValue.FALSE;
                return a16;
            }
            org.luaj.vm2.LuaValue a17 = this.u9;
            org.luaj.vm2.LuaValue a18 = this.u10;
            org.luaj.vm2.LuaValue[] a19 = new org.luaj.vm2.LuaValue[4];
            a19[0] = a3;
            a19[1] = a4;
            a19[2] = a17;
            a19[3] = a18;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, org.luaj.vm2.LuaValue.varargsOf(a19));
        } else {
            if (!this.u11.call(a3).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u14, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            if (!this.u11.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a20 = org.luaj.vm2.LuaValue.FALSE;
                return a20;
            }
            org.luaj.vm2.LuaValue a21 = this.u12;
            org.luaj.vm2.LuaValue a22 = this.u13;
            org.luaj.vm2.LuaValue[] a23 = new org.luaj.vm2.LuaValue[4];
            a23[0] = a3;
            a23[1] = a4;
            a23[2] = a21;
            a23[3] = a22;
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, org.luaj.vm2.LuaValue.varargsOf(a23));
        }
    }
}
