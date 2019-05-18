package lang;
public class Lang$luaj$complex_print$print_sys_name$inner_bracket extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("[");
        k1 = org.luaj.vm2.LuaString.valueOf("tostring");
        k2 = org.luaj.vm2.LuaString.valueOf("]");
    }
    
    public Lang$luaj$complex_print$print_sys_name$inner_bracket() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        if (!this.u0.toboolean()) {
            return a;
        }
        return k0.concat(this.u1.get(k1).call(a).concat(k2.buffer())).value();
    }
}
