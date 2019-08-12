package lang;
public class Lang$luaj$53 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$53() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0.call(a);
        if (!a0.toboolean()) {
            a0 = this.u1.call(a);
        }
        return a0;
    }
}
