package lang;
public class Lang$luaj$72 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue[] u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue[] u20;
    org.luaj.vm2.LuaValue[] u21;
    org.luaj.vm2.LuaValue[] u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue u25;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$72() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        Lang$luaj$72.newupn();
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue[] a1 = Lang$luaj$72.newupe();
        a1[0] = a0;
        org.luaj.vm2.LuaValue a2 = a.arg(2);
        org.luaj.vm2.LuaValue a3 = a.arg(3);
        a.subargs(4);
        Lang$luaj$72$make_error_v a4 = new Lang$luaj$72$make_error_v();
        a4.u0 = this.u0;
        a4.u1 = this.u1;
        a4.u2 = this.u2;
        a4.u3 = this.u3;
        a4.u4 = this.u4;
        a4.u5 = a1;
        a4.u6 = this.u5;
        a4.u7 = a2;
        a1[0] = this.u6[0].call(a1[0]);
        if (this.u7.call(a1[0]).toboolean()) {
            org.luaj.vm2.Varargs a5 = a3;
            return a5;
        }
        if (!this.u8.call(a1[0]).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        org.luaj.vm2.LuaValue a6 = this.u9[0].invoke(this.u10.invoke((org.luaj.vm2.Varargs)a1[0]).subargs(1)).arg1();
        if (this.u11.call(a6).toboolean() && this.u12.call(a6, this.u13[0]).toboolean()) {
            org.luaj.vm2.LuaValue a7 = this.u9[0].invoke(this.u14.invoke((org.luaj.vm2.Varargs)a1[0]).subargs(1)).arg1();
            if (!this.u15.call(a7).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a8 = this.u16[0].invoke(this.u17.invoke((org.luaj.vm2.Varargs)a7).subargs(1)).arg1();
            org.luaj.vm2.LuaValue a9 = this.u9[0].invoke(this.u18.invoke((org.luaj.vm2.Varargs)a7).subargs(1)).arg1();
            if (this.u15.call(a9).toboolean() && this.u19.invoke(this.u9[0].invoke(this.u18.invoke((org.luaj.vm2.Varargs)a9).subargs(1)).subargs(1)).arg1().toboolean()) {
                org.luaj.vm2.LuaValue a10 = this.u17.call(a9);
                org.luaj.vm2.LuaValue a11 = this.u20[0];
                org.luaj.vm2.LuaValue a12 = k0;
                while(!this.u19.call(a8).toboolean()) {
                    if (this.u21[0].call(a8).toboolean()) {
                        org.luaj.vm2.LuaValue a13 = this.u22[0];
                        org.luaj.vm2.LuaValue a14 = a2.len().sub(k1);
                        while(a12.lteq_b(a14)) {
                            a13 = this.u23.call(a2.get(a14.add(k1)), a13);
                            a14 = a14.sub(k1);
                        }
                        a11 = this.u24.call(a11, a8, a13);
                        a12 = a2.len();
                        a8 = this.u22[0];
                    } else {
                        if (!this.u15.call(a8).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (!a12.lt_b(a2.len())) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a15 = a2.get(a12.add(k1));
                        a12 = a12.add(k1);
                        a11 = this.u24.call(a11, this.u17.call(a8), a15);
                        a8 = this.u18.call(a8);
                    }
                }
                if (!a2.len().eq_b(a12)) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u25, org.luaj.vm2.LuaValue.varargsOf(a11, (org.luaj.vm2.Varargs)a10));
            }
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
