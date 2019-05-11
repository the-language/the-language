package lang;
public class Lang$luaj$can_new_symbol_unicodechar_p extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    
    public Lang$luaj$can_new_symbol_unicodechar_p() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        return (this.u0[0].call().get(a).eq_b(org.luaj.vm2.LuaValue.NIL)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE;
    }
}
