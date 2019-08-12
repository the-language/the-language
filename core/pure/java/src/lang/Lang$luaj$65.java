package lang;
public class Lang$luaj$65 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(0);
        k3 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$65() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0.call(a.get(k0));
        org.luaj.vm2.LuaValue a1 = a0.get(k1);
        org.luaj.vm2.LuaValue a2 = a0.get(k0);
        org.luaj.vm2.LuaTable a3 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        this.u1.call((org.luaj.vm2.LuaValue)((a1.len().eq_b(k2)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE));
        org.luaj.vm2.LuaValue a4 = a1.get(a1.len());
        org.luaj.vm2.LuaTable a5 = org.luaj.vm2.LuaValue.tableOf(3, 0);
        org.luaj.vm2.LuaBoolean a6 = org.luaj.vm2.LuaValue.FALSE;
        org.luaj.vm2.LuaValue a7 = a.get(k3);
        ((org.luaj.vm2.LuaValue)a5).rawset(1, (org.luaj.vm2.LuaValue)a6);
        ((org.luaj.vm2.LuaValue)a5).rawset(2, a2);
        ((org.luaj.vm2.LuaValue)a5).rawset(3, a7);
        ((org.luaj.vm2.LuaValue)a3).set(a4, (org.luaj.vm2.LuaValue)a5);
        org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(3, 0);
        org.luaj.vm2.LuaBoolean a9 = org.luaj.vm2.LuaValue.TRUE;
        org.luaj.vm2.LuaValue a10 = org.luaj.vm2.LuaValue.NIL;
        ((org.luaj.vm2.LuaValue)a8).rawset(1, (org.luaj.vm2.LuaValue)a9);
        ((org.luaj.vm2.LuaValue)a8).rawset(2, (org.luaj.vm2.LuaValue)a3);
        ((org.luaj.vm2.LuaValue)a8).rawset(3, a10);
        org.luaj.vm2.LuaValue a11 = a1.len().sub(k0);
        while(k2.lteq_b(a11)) {
            org.luaj.vm2.LuaTable a12 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            ((org.luaj.vm2.LuaValue)a12).set(a1.get(a11.add(k1)), (org.luaj.vm2.LuaValue)a8);
            a8 = org.luaj.vm2.LuaValue.tableOf(3, 0);
            org.luaj.vm2.LuaBoolean a13 = org.luaj.vm2.LuaValue.TRUE;
            org.luaj.vm2.LuaValue a14 = org.luaj.vm2.LuaValue.NIL;
            ((org.luaj.vm2.LuaValue)a8).rawset(1, (org.luaj.vm2.LuaValue)a13);
            ((org.luaj.vm2.LuaValue)a8).rawset(2, (org.luaj.vm2.LuaValue)a12);
            ((org.luaj.vm2.LuaValue)a8).rawset(3, a14);
            a11 = a11.sub(k1);
        }
        return a8;
    }
}
