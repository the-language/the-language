package lang;
public class Lang$luaj$any_delay2delay_evaluate extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("error");
        k1 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$any_delay2delay_evaluate() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        this.u0.get(k0).call(k1);
        return org.luaj.vm2.LuaValue.NONE;
    }
}
