package lang;
public class Lang$luaj$28 extends org.luaj.vm2.lib.ThreeArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$28() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0, org.luaj.vm2.LuaValue a1) {
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(5, 0);
        org.luaj.vm2.LuaValue a3 = this.u0[0];
        org.luaj.vm2.LuaValue a4 = this.u1[0];
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a3);
        ((org.luaj.vm2.LuaValue)a2).rawset(2, a4);
        ((org.luaj.vm2.LuaValue)a2).rawset(3, a);
        ((org.luaj.vm2.LuaValue)a2).rawset(4, a0);
        ((org.luaj.vm2.LuaValue)a2).rawset(5, a1);
        return a2;
    }
}
