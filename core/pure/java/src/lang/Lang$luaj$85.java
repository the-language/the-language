package lang;
public class Lang$luaj$85 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$85() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaValue a = this.u0.call();
        Lang$luaj$85$symbols_set_neg a0 = new Lang$luaj$85$symbols_set_neg();
        a0.u0 = a;
        this.u1[0] = a0;
        return a;
    }
}
