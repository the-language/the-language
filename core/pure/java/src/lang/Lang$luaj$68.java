package lang;
public class Lang$luaj$68 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$68() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(3, 0);
        org.luaj.vm2.LuaBoolean a1 = org.luaj.vm2.LuaValue.TRUE;
        org.luaj.vm2.LuaValue a2 = this.u0.call(a.get(k0));
        org.luaj.vm2.LuaValue a3 = org.luaj.vm2.LuaValue.NIL;
        ((org.luaj.vm2.LuaValue)a0).rawset(1, (org.luaj.vm2.LuaValue)a1);
        ((org.luaj.vm2.LuaValue)a0).rawset(2, a2);
        ((org.luaj.vm2.LuaValue)a0).rawset(3, a3);
        return a0;
    }
}
