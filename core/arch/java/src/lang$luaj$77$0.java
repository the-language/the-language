public class lang$luaj$77$0 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public lang$luaj$77$0() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        return (this.u0[0].len().eq_b(this.u1[0])) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE;
    }
}
