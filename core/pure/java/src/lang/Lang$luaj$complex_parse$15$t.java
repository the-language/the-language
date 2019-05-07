package lang;
public class Lang$luaj$complex_parse$15$t extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("[");
        k1 = org.luaj.vm2.LuaString.valueOf("]");
    }
    
    public Lang$luaj$complex_parse$15$t() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        this.u0.call(k0);
        org.luaj.vm2.LuaValue a = this.u1[0].call();
        this.u0.call(k1);
        return a;
    }
}
