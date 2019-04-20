package lang;
public class Lang$luaj$complex_parse$14 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$complex_parse$14() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        this.u0.invoke(this.u1.invoke().subargs(1));
        this.u0.call((org.luaj.vm2.LuaValue)((this.u2.call().eq_b(a)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE));
        return org.luaj.vm2.LuaValue.NONE;
    }
}
