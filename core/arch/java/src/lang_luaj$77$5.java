public class lang_luaj$77$5 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    
    public lang_luaj$77$5() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        if (this.u0.call().toboolean()) {
            return org.luaj.vm2.LuaValue.FALSE;
        }
        org.luaj.vm2.LuaValue a = this.u1.call();
        if (!this.u2.call(a).toboolean()) {
            this.u3.call(a);
            return org.luaj.vm2.LuaValue.FALSE;
        }
        while(true) {
            if (this.u2.call(a).toboolean() && !this.u0.call().toboolean()) {
                a = this.u1.call();
                continue;
            }
            if (!this.u2.call(a).toboolean()) {
                this.u3.call(a);
            }
            return org.luaj.vm2.LuaValue.TRUE;
        }
    }
}
