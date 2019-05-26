package lang;
public class Lang$luaj$machinetext_parse$parse_error extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaString.valueOf("error");
        k2 = org.luaj.vm2.LuaString.valueOf("MT parse ERROR ");
        k3 = org.luaj.vm2.LuaString.valueOf("tostring");
    }
    
    public Lang$luaj$machinetext_parse$parse_error() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        if (a.eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a = k0;
        }
        this.u0.get(k1).call(k2.concat(this.u0.get(k3).call(a)));
        return org.luaj.vm2.LuaValue.NONE;
    }
}
