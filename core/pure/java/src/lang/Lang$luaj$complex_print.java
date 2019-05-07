package lang;
public class Lang$luaj$complex_print extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
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
    org.luaj.vm2.LuaValue u20;
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
    org.luaj.vm2.LuaValue u44;
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
    final static org.luaj.vm2.LuaValue k15;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaString.valueOf("()");
        k2 = org.luaj.vm2.LuaString.valueOf("(");
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
        k4 = org.luaj.vm2.LuaString.valueOf(" ");
        k5 = org.luaj.vm2.LuaString.valueOf(")");
        k6 = org.luaj.vm2.LuaString.valueOf(" . ");
        k7 = org.luaj.vm2.LuaValue.valueOf(2);
        k8 = org.luaj.vm2.LuaValue.valueOf(1);
        k9 = org.luaj.vm2.LuaString.valueOf("top");
        k10 = org.luaj.vm2.LuaString.valueOf("#");
        k11 = org.luaj.vm2.LuaString.valueOf("!");
        k12 = org.luaj.vm2.LuaString.valueOf("$(");
        k13 = org.luaj.vm2.LuaString.valueOf("%(");
        k14 = org.luaj.vm2.LuaString.valueOf("@(");
        k15 = org.luaj.vm2.LuaString.valueOf("^(");
    }
    
    public Lang$luaj$complex_print() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        Lang$luaj$complex_print$i a1 = new Lang$luaj$complex_print$i();
        a1.u0 = this.u0;
        a1.u1 = this.u1;
        a1.u2 = this.u2;
        a1.u3 = this.u3;
        a1.u4 = this.u4;
        a1.u5 = this.u5;
        a1.u6 = this.u6;
        a1.u7 = this.u7;
        a1.u8 = a1;
        a1.u9 = this.u8;
        a1.u10 = this.u9;
        a1.u11 = this.u10;
        a1.u12 = this.u11;
        a1.u13 = this.u12;
        a1.u14 = this.u13;
        a1.u15 = this.u14;
        a1.u16 = this.u15;
        a1.u17 = this.u16;
        a1.u18 = this.u17;
        a1.u19 = this.u18;
        org.luaj.vm2.LuaValue a2 = this.u19.invoke(this.u16[0].invoke((org.luaj.vm2.Varargs)a0).subargs(1)).arg1();
        org.luaj.vm2.LuaValue dummy0 = k0;
        org.luaj.vm2.LuaValue dummy1 = k0;
        if (this.u20.call(a2).toboolean()) {
            org.luaj.vm2.Varargs a3 = k1;
            return a3;
        }
        if (this.u8.call(a2).toboolean()) {
            org.luaj.vm2.LuaValue a4 = k2;
            org.luaj.vm2.LuaValue a5 = k0;
            while(this.u8.call(a2).toboolean()) {
                a4 = this.u2.get(k3).call(a4).concat(this.u2.get(k3).call(a5).concat(this.u2.get(k3).invoke(this.u21.invoke(this.u10.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().buffer())).value();
                a5 = k4;
                a2 = this.u9.call(a2);
            }
            org.luaj.vm2.Varargs a6 = (this.u20.call(a2).toboolean()) ? this.u2.get(k3).call(a4).concat(k5) : this.u2.get(k3).call(a4).concat(k6.concat(this.u2.get(k3).invoke(this.u21.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).arg1().concat(k5.buffer()))).value();
            return a6;
        } else if (this.u22.call(a2).toboolean()) {
            org.luaj.vm2.LuaValue a7 = this.u23.call(a2);
            org.luaj.vm2.LuaValue a8 = this.u24.call(a2);
            org.luaj.vm2.LuaValue a9 = this.u3.call(a8);
            if (!a9.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a9.len().eq_b(k7) && this.u4.call(a7, this.u25).toboolean() && this.u4.call(a9.get(k8), this.u14[0]).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a1, org.luaj.vm2.LuaValue.varargsOf(a9.get(k7), (org.luaj.vm2.Varargs)k9));
            }
            org.luaj.vm2.Varargs a10 = k10.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u26.invoke(a7, (org.luaj.vm2.Varargs)a8).subargs(1)).subargs(1)).arg1());
            return a10;
        } else {
            if (this.u27.call(a2).toboolean()) {
                org.luaj.vm2.LuaValue a11 = k11;
                org.luaj.vm2.LuaValue a12 = this.u2.get(k3);
                org.luaj.vm2.LuaValue a13 = this.u21;
                org.luaj.vm2.LuaValue a14 = this.u26;
                org.luaj.vm2.LuaValue a15 = this.u28.call(a2);
                org.luaj.vm2.Varargs a16 = this.u29.invoke((org.luaj.vm2.Varargs)a2);
                org.luaj.vm2.LuaValue[] a17 = new org.luaj.vm2.LuaValue[1];
                a17[0] = a15;
                org.luaj.vm2.Varargs a18 = a11.concat(a12.invoke(a13.invoke(a14.invoke(org.luaj.vm2.LuaValue.varargsOf(a17, a16)).subargs(1)).subargs(1)).arg1());
                return a18;
            }
            if (this.u0.call(a2).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)a2);
            }
            if (this.u30.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a19 = k12.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u31.invoke(this.u32.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u33.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a19;
            }
            if (this.u34.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a20 = k13.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u35.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u36.invoke(this.u37.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a20;
            }
            if (this.u38.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a21 = k14.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u31.invoke(this.u39.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u40.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u36.invoke(this.u41.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))))).value();
                return a21;
            }
            if (!this.u42.call(a2).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u18, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.Varargs a22 = k15.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u43.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u21.invoke(this.u36.invoke(this.u44.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
            return a22;
        }
    }
}
