package lang;
public class Lang$luaj$l$1$0 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public Lang$luaj$l$1$0() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaTable a = org.luaj.vm2.LuaValue.tableOf(1, 0);
        org.luaj.vm2.LuaBoolean a0 = org.luaj.vm2.LuaValue.TRUE;
        org.luaj.vm2.Varargs a1 = this.u0.invoke();
        ((org.luaj.vm2.LuaValue)a).rawset(1, (org.luaj.vm2.LuaValue)a0);
        ((org.luaj.vm2.LuaValue)a).rawsetlist(2, a1);
        return a;
    }
}
