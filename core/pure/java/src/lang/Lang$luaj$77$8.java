package lang;
public class Lang$luaj$77$8 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("#");
    }
    
    public Lang$luaj$77$8() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (this.u0.call().toboolean()) {
            org.luaj.vm2.Varargs a0 = org.luaj.vm2.LuaValue.FALSE;
            return a0;
        }
        org.luaj.vm2.LuaValue a1 = this.u1.call();
        if (!a1.eq_b(k0)) {
            this.u2.call(a1);
            org.luaj.vm2.Varargs a2 = org.luaj.vm2.LuaValue.FALSE;
            return a2;
        }
        org.luaj.vm2.LuaValue a3 = this.u3.call();
        if (a3.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        if (!this.u5.call(a3).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        org.luaj.vm2.LuaValue a4 = this.u6;
        org.luaj.vm2.LuaValue a5 = this.u7.call(a3);
        org.luaj.vm2.Varargs a6 = this.u8.invoke((org.luaj.vm2.Varargs)a3);
        org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[1];
        a7[0] = a5;
        return org.luaj.vm2.LuaValue.tailcallOf(a4, org.luaj.vm2.LuaValue.varargsOf(a7, a6));
    }
}
