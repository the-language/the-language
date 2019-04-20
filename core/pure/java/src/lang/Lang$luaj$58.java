package lang;
public class Lang$luaj$58 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
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
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaString.valueOf("()");
        k2 = org.luaj.vm2.LuaString.valueOf("(");
        k3 = org.luaj.vm2.LuaString.valueOf(" ");
        k4 = org.luaj.vm2.LuaString.valueOf(")");
        k5 = org.luaj.vm2.LuaString.valueOf(" . ");
        k6 = org.luaj.vm2.LuaString.valueOf("#");
        k7 = org.luaj.vm2.LuaString.valueOf("!");
        k8 = org.luaj.vm2.LuaString.valueOf("$(");
        k9 = org.luaj.vm2.LuaString.valueOf("%(");
        k10 = org.luaj.vm2.LuaString.valueOf("@(");
        k11 = org.luaj.vm2.LuaString.valueOf("^(");
    }
    
    public Lang$luaj$58() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0.call(a0);
        org.luaj.vm2.LuaValue dummy = k0;
        org.luaj.vm2.LuaValue dummy0 = k0;
        if (this.u1.call(a1).toboolean()) {
            org.luaj.vm2.Varargs a2 = k1;
            return a2;
        }
        if (this.u2.call(a1).toboolean()) {
            org.luaj.vm2.LuaValue a3 = k2;
            org.luaj.vm2.LuaValue a4 = k0;
            while(this.u2.call(a1).toboolean()) {
                a3 = a3.concat(a4.concat(this.u3[0].invoke(this.u4.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1().buffer())).value();
                a4 = k3;
                a1 = this.u0.invoke(this.u5.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1();
            }
            org.luaj.vm2.Varargs a5 = (this.u1.call(a1).toboolean()) ? a3.concat(k4) : a3.concat(k5.concat(this.u3[0].call(a1)).concat(k4.buffer())).value();
            return a5;
        } else {
            if (this.u6.call(a1).toboolean()) {
                org.luaj.vm2.LuaValue a6 = k6;
                org.luaj.vm2.LuaValue a7 = this.u3[0];
                org.luaj.vm2.LuaValue a8 = this.u7;
                org.luaj.vm2.LuaValue a9 = this.u8.call(a1);
                org.luaj.vm2.Varargs a10 = this.u9.invoke((org.luaj.vm2.Varargs)a1);
                org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[1];
                a11[0] = a9;
                org.luaj.vm2.Varargs a12 = a6.concat(a7.invoke(a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a11, a10)).subargs(1)).arg1());
                return a12;
            }
            if (this.u10.call(a1).toboolean()) {
                org.luaj.vm2.LuaValue a13 = k7;
                org.luaj.vm2.LuaValue a14 = this.u3[0];
                org.luaj.vm2.LuaValue a15 = this.u7;
                org.luaj.vm2.LuaValue a16 = this.u11.call(a1);
                org.luaj.vm2.Varargs a17 = this.u12.invoke((org.luaj.vm2.Varargs)a1);
                org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[1];
                a18[0] = a16;
                org.luaj.vm2.Varargs a19 = a13.concat(a14.invoke(a15.invoke(org.luaj.vm2.LuaValue.varargsOf(a18, a17)).subargs(1)).arg1());
                return a19;
            }
            if (this.u13.call(a1).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u14, (org.luaj.vm2.Varargs)a1);
            }
            if (this.u15.call(a1).toboolean()) {
                org.luaj.vm2.Varargs a20 = k8.concat(this.u3[0].invoke(this.u16.invoke(this.u17.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1()).concat(k3).concat(this.u3[0].invoke(this.u18.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1()).concat(k4);
                return a20;
            }
            if (this.u19.call(a1).toboolean()) {
                org.luaj.vm2.Varargs a21 = k9.concat(this.u3[0].invoke(this.u20.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1()).concat(k3).concat(this.u3[0].invoke(this.u21.invoke(this.u22.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1()).concat(k4);
                return a21;
            }
            if (this.u23.call(a1).toboolean()) {
                org.luaj.vm2.Varargs a22 = k10.concat(this.u3[0].invoke(this.u16.invoke(this.u24.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1()).concat(k3).concat(this.u3[0].invoke(this.u25.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1()).concat(k3).concat(this.u3[0].invoke(this.u21.invoke(this.u26.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1()).concat(k4);
                return a22;
            }
            if (!this.u27.call(a1).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u30, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.Varargs a23 = k11.concat(this.u3[0].invoke(this.u28.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).arg1()).concat(k3).concat(this.u3[0].invoke(this.u21.invoke(this.u29.invoke((org.luaj.vm2.Varargs)a1).subargs(1)).subargs(1)).arg1()).concat(k4);
            return a23;
        }
    }
}
