package lang;
public class lang_luaj$44$1 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    
    public lang_luaj$44$1() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        this.u0.call(a);
        if (this.u1.call(a).toboolean()) {
            org.luaj.vm2.LuaValue a0 = this.u2[0].call(a);
            this.u0.call(a0);
            a = a0;
        }
        return a;
    }
}
