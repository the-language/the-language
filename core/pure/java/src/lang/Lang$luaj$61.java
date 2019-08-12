package lang;
public class Lang$luaj$61 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    
    public Lang$luaj$61() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        while(this.u0.call(a).toboolean()) {
            a = this.u1.call(a);
        }
        org.luaj.vm2.LuaValue a0 = this.u2[0].call(a);
        while(this.u0.call(a0).toboolean()) {
            a0 = this.u1.call(a0);
        }
        return a0;
    }
}
