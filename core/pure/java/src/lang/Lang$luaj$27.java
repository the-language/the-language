package lang;
public class Lang$luaj$27 extends org.luaj.vm2.lib.ThreeArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    
    public Lang$luaj$27() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0, org.luaj.vm2.LuaValue a1) {
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(4, 0);
        ((org.luaj.vm2.LuaValue)a2).rawset(1, this.u0[0]);
        ((org.luaj.vm2.LuaValue)a2).rawset(2, a);
        ((org.luaj.vm2.LuaValue)a2).rawset(3, a0);
        ((org.luaj.vm2.LuaValue)a2).rawset(4, a1);
        return a2;
    }
}
