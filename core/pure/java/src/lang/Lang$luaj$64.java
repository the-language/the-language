package lang;
public class Lang$luaj$64 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue[] u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue[] u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
    org.luaj.vm2.LuaValue u21;
    org.luaj.vm2.LuaValue[] u22;
    org.luaj.vm2.LuaValue u23;
    org.luaj.vm2.LuaValue u24;
    org.luaj.vm2.LuaValue u25;
    org.luaj.vm2.LuaValue u26;
    org.luaj.vm2.LuaValue u27;
    org.luaj.vm2.LuaValue u28;
    org.luaj.vm2.LuaValue[] u29;
    org.luaj.vm2.LuaValue u30;
    org.luaj.vm2.LuaValue u31;
    org.luaj.vm2.LuaValue u32;
    
    public Lang$luaj$64() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0[0].call(a1);
        if (this.u1.call(a3).toboolean()) {
            org.luaj.vm2.Varargs a4 = a2;
            return a4;
        }
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        Lang$luaj$64$0 a5 = new Lang$luaj$64$0();
        a5.u0 = this.u2;
        a5.u1 = this.u3;
        a5.u2 = this.u4;
        a5.u3 = this.u5;
        a5.u4 = this.u6;
        a5.u5 = this.u7;
        a5.u6 = a0;
        a5.u7 = a3;
        if (this.u8.call(a3).toboolean()) {
            org.luaj.vm2.LuaValue a6 = this.u9;
            Lang$luaj$64$1 a7 = new Lang$luaj$64$1();
            a7.u0 = a2;
            Lang$luaj$64$2 a8 = new Lang$luaj$64$2();
            a8.u0 = this.u10;
            a8.u1 = this.u11;
            a8.u2 = this.u12;
            a8.u3 = a5;
            a8.u4 = this.u13;
            a8.u5 = this.u14;
            a8.u6 = a0;
            a8.u7 = this.u15;
            a8.u8 = this.u16;
            a8.u9 = this.u17;
            a8.u10 = this.u18;
            a8.u11 = this.u0;
            a8.u12 = this.u19;
            a8.u13 = this.u1;
            a8.u14 = a2;
            a8.u15 = this.u20;
            a8.u16 = this.u21;
            a8.u17 = this.u22;
            a8.u18 = this.u23;
            a8.u19 = this.u8;
            a8.u20 = this.u24;
            a8.u21 = this.u25;
            a8.u22 = this.u26;
            a8.u23 = this.u7;
            a8.u24 = this.u27;
            a8.u25 = this.u5;
            a8.u26 = this.u28;
            org.luaj.vm2.LuaValue[] a9 = new org.luaj.vm2.LuaValue[4];
            a9[0] = a3;
            a9[1] = a5;
            a9[2] = a7;
            a9[3] = a8;
            return org.luaj.vm2.LuaValue.tailcallOf(a6, org.luaj.vm2.LuaValue.varargsOf(a9));
        }
        if (this.u26.call(a3).toboolean()) {
            org.luaj.vm2.Varargs a10 = a3;
            return a10;
        }
        if (this.u29[0].call(a3).toboolean()) {
            org.luaj.vm2.LuaValue a11 = this.u30;
            org.luaj.vm2.Varargs a12 = ((org.luaj.vm2.LuaValue)a5).invoke();
            org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[2];
            a13[0] = a0;
            a13[1] = a3;
            return org.luaj.vm2.LuaValue.tailcallOf(a11, org.luaj.vm2.LuaValue.varargsOf(a13, a12));
        }
        if (this.u31.call(a3).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u32, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
