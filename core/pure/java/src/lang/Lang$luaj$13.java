package lang;
public class Lang$luaj$13 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$13() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        return this.u0[0].call().get(this.u1.call(a));
    }
}
