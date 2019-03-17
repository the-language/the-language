public class lang_luaj$43 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    
    public lang_luaj$43() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0.call(a);
        if (!a0.toboolean()) {
            a0 = this.u1.call(a);
            if (!a0.toboolean()) {
                a0 = this.u2.call(a);
                if (!a0.toboolean()) {
                    a0 = this.u3.call(a);
                    if (!a0.toboolean()) {
                        a0 = this.u4.call(a);
                    }
                }
            }
        }
        return a0;
    }
}
