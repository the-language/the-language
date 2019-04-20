package lang;
public class Lang$luaj$complex_print$print_sys_name$inner_bracket extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("inner");
        k1 = org.luaj.vm2.LuaString.valueOf("[");
        k2 = org.luaj.vm2.LuaString.valueOf("tostring");
        k3 = org.luaj.vm2.LuaString.valueOf("]");
        k4 = org.luaj.vm2.LuaString.valueOf("top");
    }
    
    public Lang$luaj$complex_print$print_sys_name$inner_bracket() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0.eq_b(k0)) {
            org.luaj.vm2.Varargs a1 = k1.concat(this.u1.get(k2).call(a0).concat(k3.buffer())).value();
            return a1;
        }
        if (this.u0.eq_b(k4)) {
            org.luaj.vm2.Varargs a2 = a0;
            return a2;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
