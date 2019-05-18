package lang;
public class Lang$luaj$43 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    
    public Lang$luaj$43() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaTable a = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a).rawset(1, this.u0[0]);
        return a;
    }
}
