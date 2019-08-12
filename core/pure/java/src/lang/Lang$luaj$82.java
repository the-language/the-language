package lang;
public class Lang$luaj$82 extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    
    public Lang$luaj$82() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        return (this.u0[0].call(a, a0).eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE;
    }
}
