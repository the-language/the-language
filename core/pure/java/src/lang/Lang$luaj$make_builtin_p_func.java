package lang;
public class Lang$luaj$make_builtin_p_func extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$make_builtin_p_func() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(3, 0);
        org.luaj.vm2.LuaValue a2 = k0;
        Lang$luaj$make_builtin_p_func$0 a3 = new Lang$luaj$make_builtin_p_func$0();
        a3.u0 = this.u0;
        a3.u1 = this.u1;
        a3.u2 = this.u2;
        a3.u3 = a;
        a3.u4 = a0;
        a3.u5 = this.u3;
        a3.u6 = this.u4;
        ((org.luaj.vm2.LuaValue)a1).rawset(1, a);
        ((org.luaj.vm2.LuaValue)a1).rawset(2, a2);
        ((org.luaj.vm2.LuaValue)a1).rawset(3, (org.luaj.vm2.LuaValue)a3);
        return a1;
    }
}
