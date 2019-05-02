package lang;
public class Lang$luaj$57 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue[] u10;
    org.luaj.vm2.LuaValue u11;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
        k2 = org.luaj.vm2.LuaString.valueOf("error");
        k3 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$57() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(5);
        org.luaj.vm2.LuaValue a3 = this.u0;
        org.luaj.vm2.LuaValue a4 = this.u1[0];
        org.luaj.vm2.LuaValue a5 = this.u2;
        org.luaj.vm2.LuaValue a6 = this.u3[0];
        org.luaj.vm2.LuaValue a7 = this.u2;
        org.luaj.vm2.LuaValue a8 = this.u4.call(a0);
        org.luaj.vm2.Varargs a9 = this.u5.invoke((org.luaj.vm2.Varargs)a2);
        org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[2];
        a10[0] = a8;
        a10[1] = a1;
        org.luaj.vm2.Varargs a11 = a7.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a6;
        org.luaj.vm2.Varargs a13 = a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[1];
        a14[0] = a4;
        org.luaj.vm2.LuaValue a15 = a3.invoke(org.luaj.vm2.LuaValue.varargsOf(a14, a13)).arg1();
        if (this.u6[0].call(a1, this.u7[0]).toboolean()) {
            if (!a2.len().eq_b(k0)) {
                org.luaj.vm2.Varargs a16 = a15;
                return a16;
            }
            org.luaj.vm2.Varargs a17 = a2.get(k0);
            return a17;
        } else if (this.u6[0].call(a1, this.u8[0]).toboolean()) {
            if (!a2.len().eq_b(k1)) {
                org.luaj.vm2.Varargs a18 = a15;
                return a18;
            }
            org.luaj.vm2.LuaValue a19 = this.u9[0];
            org.luaj.vm2.LuaValue a20 = a2.get(k0);
            org.luaj.vm2.LuaValue a21 = a2.get(k1);
            org.luaj.vm2.LuaValue[] a22 = new org.luaj.vm2.LuaValue[4];
            a22[0] = a0;
            a22[1] = a20;
            a22[2] = a21;
            a22[3] = a15;
            return org.luaj.vm2.LuaValue.tailcallOf(a19, org.luaj.vm2.LuaValue.varargsOf(a22));
        } else {
            if (this.u6[0].call(a1, this.u10[0]).toboolean()) {
                if (!a2.len().eq_b(k1)) {
                    org.luaj.vm2.Varargs a23 = a15;
                    return a23;
                }
                this.u11.get(k2).call(k3);
            }
            org.luaj.vm2.Varargs a24 = a15;
            return a24;
        }
    }
}
