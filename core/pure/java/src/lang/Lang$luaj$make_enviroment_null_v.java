package lang;
public class Lang$luaj$make_enviroment_null_v extends org.luaj.vm2.lib.ZeroArgFunction {
    public Lang$luaj$make_enviroment_null_v() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaTable a = org.luaj.vm2.LuaValue.tableOf(3, 0);
        org.luaj.vm2.LuaBoolean a0 = org.luaj.vm2.LuaValue.TRUE;
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a2 = org.luaj.vm2.LuaValue.NIL;
        ((org.luaj.vm2.LuaValue)a).rawset(1, (org.luaj.vm2.LuaValue)a0);
        ((org.luaj.vm2.LuaValue)a).rawset(2, (org.luaj.vm2.LuaValue)a1);
        ((org.luaj.vm2.LuaValue)a).rawset(3, a2);
        return a;
    }
}
