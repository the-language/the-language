package lang;
public class Lang$luaj$symbols_set extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$symbols_set() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaValue a = this.u0.call();
        Lang$luaj$symbols_set$symbols_set a0 = new Lang$luaj$symbols_set$symbols_set();
        a0.u0 = a;
        this.u1[0] = a0;
        return a;
    }
}
