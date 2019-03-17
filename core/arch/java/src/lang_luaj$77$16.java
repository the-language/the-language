public class lang_luaj$77$16 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public lang_luaj$77$16() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = this.u0[0].call();
        if (a0.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            org.luaj.vm2.Varargs a1 = org.luaj.vm2.LuaValue.FALSE;
            return a1;
        }
        if (this.u1.call(a0).toboolean()) {
            org.luaj.vm2.Varargs a2 = a0;
            return a2;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)a0);
    }
}
