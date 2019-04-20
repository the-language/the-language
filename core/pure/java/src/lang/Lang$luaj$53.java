package lang;
public class Lang$luaj$53 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue[] u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue[] u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue[] u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
    org.luaj.vm2.LuaValue[] u21;
    org.luaj.vm2.LuaValue[] u22;
    org.luaj.vm2.LuaValue[] u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue u25;
    org.luaj.vm2.LuaValue u26;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$53() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        Lang$luaj$53.newupn();
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue[] a1 = Lang$luaj$53.newupe();
        a1[0] = a0;
        org.luaj.vm2.LuaValue a2 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        Lang$luaj$53$0 a3 = new Lang$luaj$53$0();
        a3.u0 = this.u0;
        a3.u1 = this.u1;
        a3.u2 = this.u2;
        a3.u3 = this.u3;
        a3.u4 = this.u4;
        a3.u5 = a1;
        a3.u6 = this.u5;
        a3.u7 = a2;
        a1[0] = this.u6[0].call(a1[0]);
        if (this.u7.call(a1[0]).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u8, org.luaj.vm2.LuaValue.varargsOf(a1[0], (org.luaj.vm2.Varargs)a2));
        }
        if (!this.u9.call(a1[0]).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        org.luaj.vm2.LuaValue a4 = this.u10[0].invoke(this.u11.invoke((org.luaj.vm2.Varargs)a1[0]).subargs(1)).arg1();
        if (this.u12.call(a4).toboolean() && this.u13.call(a4, this.u14[0]).toboolean()) {
            org.luaj.vm2.LuaValue a5 = this.u10[0].invoke(this.u15.invoke((org.luaj.vm2.Varargs)a1[0]).subargs(1)).arg1();
            if (!this.u16.call(a5).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a6 = this.u17[0].invoke(this.u18.invoke((org.luaj.vm2.Varargs)a5).subargs(1)).arg1();
            org.luaj.vm2.LuaValue a7 = this.u10[0].invoke(this.u19.invoke((org.luaj.vm2.Varargs)a5).subargs(1)).arg1();
            if (this.u16.call(a7).toboolean() && this.u20.invoke(this.u10[0].invoke(this.u19.invoke((org.luaj.vm2.Varargs)a7).subargs(1)).subargs(1)).arg1().toboolean()) {
                org.luaj.vm2.LuaValue a8 = this.u18.call(a7);
                org.luaj.vm2.LuaValue a9 = this.u21[0];
                org.luaj.vm2.LuaValue a10 = k0;
                while(!this.u20.call(a6).toboolean()) {
                    if (this.u22[0].call(a6).toboolean()) {
                        org.luaj.vm2.LuaValue a11 = this.u23[0];
                        org.luaj.vm2.LuaValue a12 = a2.len().sub(k1);
                        while(a10.lteq_b(a12)) {
                            a11 = this.u24.call(a2.get(a12.add(k1)), a11);
                            a12 = a12.sub(k1);
                        }
                        a9 = this.u25.call(a9, a6, a11);
                        a10 = a2.len();
                        a6 = this.u23[0];
                    } else {
                        if (!this.u16.call(a6).toboolean()) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        if (!a10.lt_b(a2.len())) {
                            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                        }
                        org.luaj.vm2.LuaValue a13 = a2.get(a10.add(k1));
                        a10 = a10.add(k1);
                        a9 = this.u25.call(a9, this.u18.call(a6), a13);
                        a6 = this.u19.call(a6);
                    }
                }
                if (!a2.len().eq_b(a10)) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u26, org.luaj.vm2.LuaValue.varargsOf(a9, (org.luaj.vm2.Varargs)a8));
            }
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
