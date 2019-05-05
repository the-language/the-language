package lang;
public class Lang$luaj$complex_print$print_sys_name$inner_bracket extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("inner");
        k1 = org.luaj.vm2.LuaString.valueOf("[");
        k2 = org.luaj.vm2.LuaString.valueOf("tostring");
        k3 = org.luaj.vm2.LuaString.valueOf("]");
    }
    
    public Lang$luaj$complex_print$print_sys_name$inner_bracket() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        if (!this.u0.eq_b(k0)) {
            return a;
        }
        return k1.concat(this.u1.get(k2).call(a).concat(k3.buffer())).value();
    }
}
