public class lang_luaj$76$12$0 extends org.luaj.vm2.lib.VarArgFunction {
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
    
    public lang_luaj$76$12$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (this.u0.call().toboolean()) {
            org.luaj.vm2.Varargs a0 = org.luaj.vm2.LuaValue.FALSE;
            return a0;
        }
        org.luaj.vm2.LuaValue a1 = this.u1.call();
        if (!a1.eq_b(this.u2)) {
            this.u3.call(a1);
            org.luaj.vm2.Varargs a2 = org.luaj.vm2.LuaValue.FALSE;
            return a2;
        }
        org.luaj.vm2.LuaValue a3 = this.u4.call();
        if (a3.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        if (!this.u6.call(a3).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        org.luaj.vm2.LuaValue a4 = this.u7.call(a3);
        if (this.u6.call(a4).toboolean() && this.u8.invoke(this.u7.invoke((org.luaj.vm2.Varargs)a4).subargs(1)).arg1().toboolean()) {
            org.luaj.vm2.LuaValue a5 = this.u9;
            org.luaj.vm2.LuaValue a6 = this.u10.call(a3);
            org.luaj.vm2.Varargs a7 = this.u10.invoke((org.luaj.vm2.Varargs)a4);
            org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[1];
            a8[0] = a6;
            return org.luaj.vm2.LuaValue.tailcallOf(a5, org.luaj.vm2.LuaValue.varargsOf(a8, a7));
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
