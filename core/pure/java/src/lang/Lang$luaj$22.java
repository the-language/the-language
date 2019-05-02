package lang;
public class Lang$luaj$22 extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$22() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(4, 0);
        org.luaj.vm2.LuaValue a2 = this.u0[0];
        org.luaj.vm2.LuaValue a3 = this.u1[0];
        ((org.luaj.vm2.LuaValue)a1).rawset(1, a2);
        ((org.luaj.vm2.LuaValue)a1).rawset(2, a3);
        ((org.luaj.vm2.LuaValue)a1).rawset(3, a);
        ((org.luaj.vm2.LuaValue)a1).rawset(4, a0);
        return a1;
    }
}
