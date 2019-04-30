package lang;
public class Lang$luaj$machinetext_parse$parse_error extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("error");
        k1 = org.luaj.vm2.LuaString.valueOf("MT parse ERROR");
    }
    
    public Lang$luaj$machinetext_parse$parse_error() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        this.u0.get(k0).call(k1);
        return org.luaj.vm2.LuaValue.NONE;
    }
}
