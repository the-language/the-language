package lang;
public class Lang$luaj$47 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    
    public Lang$luaj$47() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaTable a = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a).rawset(1, this.u0[0]);
        return a;
    }
}
