package lang;
public class Lang$luaj$enviroment_helper_print0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("^");
        k1 = org.luaj.vm2.LuaString.valueOf(".");
        k2 = org.luaj.vm2.LuaString.valueOf("_");
        k3 = org.luaj.vm2.LuaString.valueOf("#");
    }
    
    public Lang$luaj$enviroment_helper_print0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0.call(a0);
        if (this.u1.call(a3).toboolean()) {
            org.luaj.vm2.LuaValue a4 = this.u2;
            org.luaj.vm2.LuaValue a5 = k0;
            org.luaj.vm2.Varargs a6 = this.u3.invoke((org.luaj.vm2.Varargs)a3);
            org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[2];
            a7[0] = a2;
            a7[1] = a5;
            a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a7, a6));
        } else if (this.u4.call(a3).toboolean()) {
            this.u2.call(a2, k1);
            org.luaj.vm2.LuaValue a8 = this.u2;
            org.luaj.vm2.LuaValue a9 = this.u5.call(a3);
            org.luaj.vm2.Varargs a10 = this.u6.invoke((org.luaj.vm2.Varargs)a3);
            org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[2];
            a11[0] = a1;
            a11[1] = a9;
            a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a11, a10));
        } else if (this.u7.call(a3).toboolean()) {
            this.u2.call(a2, k2);
        } else {
            if (!this.u8.call(a3).toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u11, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            this.u2.call(a2, k3);
            org.luaj.vm2.LuaValue a12 = this.u2;
            org.luaj.vm2.LuaValue a13 = this.u9.call(a3);
            org.luaj.vm2.Varargs a14 = this.u10.invoke((org.luaj.vm2.Varargs)a3);
            org.luaj.vm2.LuaValue[] a15 = new org.luaj.vm2.LuaValue[2];
            a15[0] = a1;
            a15[1] = a13;
            a12.invoke(org.luaj.vm2.LuaValue.varargsOf(a15, a14));
        }
        org.luaj.vm2.Varargs a16 = org.luaj.vm2.LuaValue.NONE;
        return a16;
    }
}
