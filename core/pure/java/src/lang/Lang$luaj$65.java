package lang;
public class Lang$luaj$65 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$65() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaValue a = this.u0.call();
        Lang$luaj$65$symbols_set a0 = new Lang$luaj$65$symbols_set();
        a0.u0 = a;
        this.u1[0] = a0;
        return a;
    }
}
