public class lang$luaj$30 extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    
    public lang$luaj$30() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(3, 0);
        ((org.luaj.vm2.LuaValue)a1).rawset(1, this.u0[0]);
        ((org.luaj.vm2.LuaValue)a1).rawset(2, a);
        ((org.luaj.vm2.LuaValue)a1).rawset(3, a0);
        return a1;
    }
}
