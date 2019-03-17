public class lang_luaj$68 extends org.luaj.vm2.lib.ThreeArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$68() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0, org.luaj.vm2.LuaValue a1) {
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(3, 0);
        org.luaj.vm2.LuaValue a3 = k0;
        lang_luaj$68$0 a4 = new lang_luaj$68$0();
        a4.u0 = this.u0;
        a4.u1 = this.u1;
        a4.u2 = this.u2;
        a4.u3 = a;
        a4.u4 = a0;
        a4.u5 = a1;
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a);
        ((org.luaj.vm2.LuaValue)a2).rawset(2, a3);
        ((org.luaj.vm2.LuaValue)a2).rawset(3, (org.luaj.vm2.LuaValue)a4);
        return a2;
    }
}
