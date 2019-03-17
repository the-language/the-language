public class lang_luaj$78$0$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("inner");
        k1 = org.luaj.vm2.LuaString.valueOf("[");
        k2 = org.luaj.vm2.LuaString.valueOf("]");
        k3 = org.luaj.vm2.LuaString.valueOf("top");
    }
    
    public lang_luaj$78$0$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0.eq_b(k0)) {
            org.luaj.vm2.Varargs a1 = k1.concat(a0).concat(k2);
            return a1;
        }
        if (this.u0.eq_b(k3)) {
            org.luaj.vm2.Varargs a2 = a0;
            return a2;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
