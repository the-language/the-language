package lang;
public class Lang$luaj$8 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$8() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        while(this.u0.call(a).toboolean()) {
            a = this.u1.call(a);
        }
        return a;
    }
}
