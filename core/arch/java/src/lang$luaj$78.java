public class lang$luaj$78 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue[] u13;
    org.luaj.vm2.LuaValue[] u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue[] u20;
    org.luaj.vm2.LuaValue u21;
    org.luaj.vm2.LuaValue u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue u25;
    org.luaj.vm2.LuaValue u26;
    org.luaj.vm2.LuaValue u27;
    org.luaj.vm2.LuaValue u28;
    org.luaj.vm2.LuaValue u29;
    org.luaj.vm2.LuaValue u30;
    org.luaj.vm2.LuaValue u31;
    org.luaj.vm2.LuaValue u32;
    org.luaj.vm2.LuaValue u33;
    org.luaj.vm2.LuaValue u34;
    org.luaj.vm2.LuaValue u35;
    org.luaj.vm2.LuaValue u36;
    org.luaj.vm2.LuaValue u37;
    org.luaj.vm2.LuaValue u38;
    org.luaj.vm2.LuaValue u39;
    org.luaj.vm2.LuaValue u40;
    org.luaj.vm2.LuaValue u41;
    org.luaj.vm2.LuaValue u42;
    org.luaj.vm2.LuaValue u43;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    final static org.luaj.vm2.LuaValue k7;
    final static org.luaj.vm2.LuaValue k8;
    final static org.luaj.vm2.LuaValue k9;
    final static org.luaj.vm2.LuaValue k10;
    final static org.luaj.vm2.LuaValue k11;
    final static org.luaj.vm2.LuaValue k12;
    final static org.luaj.vm2.LuaValue k13;
    final static org.luaj.vm2.LuaValue k14;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaString.valueOf("()");
        k2 = org.luaj.vm2.LuaString.valueOf("(");
        k3 = org.luaj.vm2.LuaString.valueOf(" ");
        k4 = org.luaj.vm2.LuaString.valueOf(")");
        k5 = org.luaj.vm2.LuaString.valueOf(" . ");
        k6 = org.luaj.vm2.LuaValue.valueOf(2);
        k7 = org.luaj.vm2.LuaValue.valueOf(1);
        k8 = org.luaj.vm2.LuaString.valueOf("top");
        k9 = org.luaj.vm2.LuaString.valueOf("#");
        k10 = org.luaj.vm2.LuaString.valueOf("!");
        k11 = org.luaj.vm2.LuaString.valueOf("$(");
        k12 = org.luaj.vm2.LuaString.valueOf("%(");
        k13 = org.luaj.vm2.LuaString.valueOf("@(");
        k14 = org.luaj.vm2.LuaString.valueOf("^(");
    }
    
    public lang$luaj$78() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = org.luaj.vm2.LuaValue.NIL;
        org.luaj.vm2.LuaValue[] a2 = lang$luaj$78.newupe();
        a2[0] = a1;
        lang$luaj$78$0 a3 = new lang$luaj$78$0();
        a3.u0 = this.u0;
        a3.u1 = this.u1;
        a3.u2 = this.u2;
        a3.u3 = this.u3;
        a3.u4 = this.u4;
        a3.u5 = this.u5;
        a3.u6 = this.u6;
        a3.u7 = this.u7;
        a3.u8 = a2;
        a3.u9 = this.u8;
        a3.u10 = this.u9;
        a3.u11 = this.u10;
        a3.u12 = this.u11;
        a3.u13 = this.u12;
        a3.u14 = this.u13;
        a3.u15 = this.u14;
        a3.u16 = this.u15;
        a3.u17 = this.u16;
        a3.u18 = this.u17;
        a2[0] = a3;
        org.luaj.vm2.LuaValue a4 = this.u18.invoke(this.u16[0].invoke((org.luaj.vm2.Varargs)a0).subargs(1)).arg1();
        org.luaj.vm2.LuaValue dummy = k0;
        org.luaj.vm2.LuaValue dummy0 = k0;
        if (this.u19.call(a4).toboolean()) {
            org.luaj.vm2.Varargs a5 = k1;
            return a5;
        }
        if (this.u8.call(a4).toboolean()) {
            org.luaj.vm2.LuaValue a6 = k2;
            org.luaj.vm2.LuaValue a7 = k0;
            while(this.u8.call(a4).toboolean()) {
                a6 = a6.concat(a7.concat(this.u20[0].invoke(this.u10.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).arg1().buffer())).value();
                a7 = k3;
                a4 = this.u9.call(a4);
            }
            org.luaj.vm2.Varargs a8 = (this.u19.call(a4).toboolean()) ? a6.concat(k4) : a6.concat(k5.concat(this.u20[0].call(a4)).concat(k4.buffer())).value();
            return a8;
        } else if (this.u21.call(a4).toboolean()) {
            org.luaj.vm2.LuaValue a9 = this.u22.call(a4);
            org.luaj.vm2.LuaValue a10 = this.u23.call(a4);
            org.luaj.vm2.LuaValue a11 = this.u3.call(a10);
            if (!a11.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a11.len().eq_b(k6) && this.u4[0].call(a9, this.u24).toboolean() && this.u4[0].call(a11.get(k7), this.u14[0]).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(a2[0], org.luaj.vm2.LuaValue.varargsOf(a11.get(k6), (org.luaj.vm2.Varargs)k8));
            }
            org.luaj.vm2.Varargs a12 = k9.concat(this.u20[0].invoke(this.u25.invoke(a9, (org.luaj.vm2.Varargs)a10).subargs(1)).arg1());
            return a12;
        } else {
            if (this.u26.call(a4).toboolean()) {
                org.luaj.vm2.LuaValue a13 = k10;
                org.luaj.vm2.LuaValue a14 = this.u20[0];
                org.luaj.vm2.LuaValue a15 = this.u25;
                org.luaj.vm2.LuaValue a16 = this.u27.call(a4);
                org.luaj.vm2.Varargs a17 = this.u28.invoke((org.luaj.vm2.Varargs)a4);
                org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[1];
                a18[0] = a16;
                org.luaj.vm2.Varargs a19 = a13.concat(a14.invoke(a15.invoke(org.luaj.vm2.LuaValue.varargsOf(a18, a17)).subargs(1)).arg1());
                return a19;
            }
            if (this.u0.call(a4).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)a4);
            }
            if (this.u29.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a20 = k11.concat(this.u20[0].invoke(this.u30.invoke(this.u31.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).subargs(1)).arg1()).concat(k3).concat(this.u20[0].invoke(this.u32.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).arg1()).concat(k4);
                return a20;
            }
            if (this.u33.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a21 = k12.concat(this.u20[0].invoke(this.u34.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).arg1()).concat(k3).concat(this.u20[0].invoke(this.u35.invoke(this.u36.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).subargs(1)).arg1()).concat(k4);
                return a21;
            }
            if (this.u37.call(a4).toboolean()) {
                org.luaj.vm2.Varargs a22 = k13.concat(this.u20[0].invoke(this.u30.invoke(this.u38.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).subargs(1)).arg1()).concat(k3).concat(this.u20[0].invoke(this.u39.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).arg1()).concat(k3).concat(this.u20[0].invoke(this.u35.invoke(this.u40.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).subargs(1)).arg1()).concat(k4);
                return a22;
            }
            if (!this.u41.call(a4).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.Varargs a23 = k14.concat(this.u20[0].invoke(this.u42.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).arg1()).concat(k3).concat(this.u20[0].invoke(this.u35.invoke(this.u43.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).subargs(1)).arg1()).concat(k4);
            return a23;
        }
    }
}
