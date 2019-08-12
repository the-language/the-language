package lang;
public class Lang$luaj$6$0 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public Lang$luaj$6$0() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaTable a = org.luaj.vm2.LuaValue.tableOf(2, 0);
        org.luaj.vm2.LuaBoolean a0 = org.luaj.vm2.LuaValue.FALSE;
        org.luaj.vm2.LuaValue a1 = this.u0;
        ((org.luaj.vm2.LuaValue)a).rawset(1, (org.luaj.vm2.LuaValue)a0);
        ((org.luaj.vm2.LuaValue)a).rawset(2, a1);
        return a;
    }
}
