package lang;
public class Lang$luaj$new_symbol extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue[] u2;
    
    public Lang$luaj$new_symbol() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        this.u0.call((org.luaj.vm2.LuaValue)((this.u1[0].get(a).eq_b(org.luaj.vm2.LuaValue.NIL)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE));
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(2, 0);
        org.luaj.vm2.LuaValue a1 = this.u2[0];
        org.luaj.vm2.LuaValue a2 = this.u1[0].get(a);
        ((org.luaj.vm2.LuaValue)a0).rawset(1, a1);
        ((org.luaj.vm2.LuaValue)a0).rawset(2, a2);
        return a0;
    }
}
