package lang;
public class Lang$luaj$83 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
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
    org.luaj.vm2.LuaValue u16;
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
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaString.valueOf("()");
        k2 = org.luaj.vm2.LuaString.valueOf("(");
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
        k4 = org.luaj.vm2.LuaString.valueOf(" ");
        k5 = org.luaj.vm2.LuaString.valueOf(")");
        k6 = org.luaj.vm2.LuaString.valueOf(" . ");
        k7 = org.luaj.vm2.LuaString.valueOf("#");
        k8 = org.luaj.vm2.LuaString.valueOf(";(");
        k9 = org.luaj.vm2.LuaString.valueOf("$(");
        k10 = org.luaj.vm2.LuaString.valueOf("%(");
        k11 = org.luaj.vm2.LuaString.valueOf("@(");
        k12 = org.luaj.vm2.LuaString.valueOf("^(");
    }
    
    public Lang$luaj$83() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0.call(a0);


        if (this.u1.call(a1).toboolean()) {
            org.luaj.vm2.Varargs a2 = k1;
            return a2;
        }
        if (this.u2.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a3 = k2;
            org.luaj.vm2.LuaValue a4 = k0;
            while(this.u2.call(a1).toboolean()) {
                a3 = this.u3.get(k3).call(a3).concat(this.u3.get(k3).call(a4).concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u5.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1().buffer())).value();
                a4 = k4;
                a1 = this.u0.invoke(this.u6.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1();
            }
            org.luaj.vm2.Varargs a5 = (this.u1.call(a1).toboolean()) ? this.u3.get(k3).call(a3).concat(k5) : this.u3.get(k3).call(a3).concat(k6.concat(this.u3.get(k3).invoke(this.u4[0].invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1().concat(k5.buffer()))).value();
            return a5;
        } else {
            if (this.u7.call(a1).toboolean()) {
                org.luaj.vm2.LuaValue a6 = k7;
                org.luaj.vm2.LuaValue a7 = this.u3.get(k3);
                org.luaj.vm2.LuaValue a8 = this.u4[0];
                org.luaj.vm2.LuaValue a9 = this.u8;
                org.luaj.vm2.LuaValue a10 = this.u9.call(a1);
                org.luaj.vm2.Varargs a11 = this.u10.invoke((org.luaj.vm2.Varargs)a1);
                org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
                a12[0] = a10;
                org.luaj.vm2.Varargs a13 = a6.concat(a7.invoke(a8.invoke(a9.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11)).subargs(1)).subargs(1)).arg1());
                return a13;
            }
            if (this.u11.call(a1).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u12, (org.luaj.vm2.Varargs)a1);
            }
            if (this.u13.call(a1).toboolean()) {
                org.luaj.vm2.Varargs a14 = k8.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u14.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u15.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a14;
            }
            if (this.u16.call(a1).toboolean()) {
                org.luaj.vm2.Varargs a15 = k9.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u17.invoke(this.u18.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u19.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a15;
            }
            if (this.u20.call(a1).toboolean()) {
                org.luaj.vm2.Varargs a16 = k10.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u21.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u22.invoke(this.u23.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
                return a16;
            }
            if (this.u24.call(a1).toboolean()) {
                org.luaj.vm2.Varargs a17 = k11.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u17.invoke(this.u25.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u26.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u22.invoke(this.u27.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))))).value();
                return a17;
            }
            if (!this.u28.call(a1).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u31, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.Varargs a18 = k12.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u29.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1().concat(k4.concat(this.u3.get(k3).invoke(this.u4[0].invoke(this.u22.invoke(this.u30.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).subargs(1)).arg1().concat(k5.buffer())))).value();
            return a18;
        }
    }
}
