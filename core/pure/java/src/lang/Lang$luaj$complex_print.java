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
    org.luaj.vm2.LuaValue[] u24;
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
        k9 = org.luaj.vm2.LuaString.valueOf("#");
        k10 = org.luaj.vm2.LuaString.valueOf(";(");
        k11 = org.luaj.vm2.LuaString.valueOf("$(");
        k12 = org.luaj.vm2.LuaString.valueOf("%(");
        k13 = org.luaj.vm2.LuaString.valueOf("@(");
        k14 = org.luaj.vm2.LuaString.valueOf("^(");
    }
    
    public Lang$luaj$complex_print() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);

        Lang$luaj$complex_print$print_sys_name a1 = new Lang$luaj$complex_print$print_sys_name();
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
        org.luaj.vm2.LuaValue a2 = this.u18.invoke(this.u16[0].invoke((org.luaj.vm2.Varargs)a0).subargs(1)).arg1();


        if (this.u19.call(a2).toboolean()) {
            org.luaj.vm2.Varargs a3 = k1;
            return a3;
        }
        if (this.u8.call(a2).toboolean()) {
            org.luaj.vm2.LuaValue a4 = k2;
            org.luaj.vm2.LuaValue a5 = k0;
            while(this.u8.call(a2).toboolean()) {
                a4 = this.u2.get(k3).call(a4).concat(this.u2.get(k3).call(a5).concat(this.u2.get(k3).invoke(this.u20.invoke(this.u10.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().buffer())).value();
                a5 = k4;
                a2 = this.u9.call(a2);
            }
            org.luaj.vm2.Varargs a6 = (this.u19.call(a2).toboolean()) ? this.u2.get(k3).call(a4).concat(k5) : this.u2.get(k3).call(a4).concat(k6.concat(this.u2.get(k3).invoke(this.u20.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).arg1().concat(k5.buffer()))).value();
            return a6;
        } else if (this.u21.call(a2).toboolean()) {
            org.luaj.vm2.LuaValue a7 = this.u22.call(a2);
            org.luaj.vm2.LuaValue a8 = this.u23.call(a2);
            org.luaj.vm2.LuaValue a9 = this.u3.call(a8);
            if (!a9.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && a9.len().eq_b(k7) && this.u4.call(a7, this.u24[0]).toboolean() && this.u4.call(a9.get(k8), this.u14[0]).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a1, org.luaj.vm2.LuaValue.varargsOf(a9.get(k7), (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.FALSE));
            }
            org.luaj.vm2.Varargs a10 = k9.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u25.invoke(a7, (org.luaj.vm2.Varargs)a8).subargs(1)).subargs(1)).arg1());
            return a10;
        } else {
            if (this.u0.call(a2).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)a2);
            }
            if (this.u26.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a11 = k10.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u27.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u28.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a11;
            }
            if (this.u29.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a12 = k11.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u30.invoke(this.u31.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u32.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a12;
            }
            if (this.u33.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a13 = k12.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u34.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u35.invoke(this.u36.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a13;
            }
            if (this.u37.call(a2).toboolean()) {
                org.luaj.vm2.Varargs a14 = k13.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u30.invoke(this.u38.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u39.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u35.invoke(this.u40.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))))).value();
                return a14;
            }
            if (!this.u41.call(a2).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u44, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.Varargs a15 = k14.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u42.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u2.get(k3).invoke(this.u20.invoke(this.u35.invoke(this.u43.invoke((org.luaj.vm2.Varargs)a2).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
            return a15;
        }
    }
}
