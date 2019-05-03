package lang;
public class Lang$luaj$7 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$7() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u1.call(a);
        return this.u0[0].get(a0);
    }
}
