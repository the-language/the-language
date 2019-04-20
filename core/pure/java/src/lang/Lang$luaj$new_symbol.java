package lang;
public class Lang$luaj$new_symbol extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public Lang$luaj$new_symbol() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(2, 0);
        ((org.luaj.vm2.LuaValue)a0).rawset(1, this.u0);
        ((org.luaj.vm2.LuaValue)a0).rawset(2, a);
        return a0;
    }
}
