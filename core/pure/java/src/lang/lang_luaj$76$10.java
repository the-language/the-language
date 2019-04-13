package lang;
public class lang_luaj$76$10 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    final static org.luaj.vm2.LuaValue k7;
    final static org.luaj.vm2.LuaValue k8;
    final static org.luaj.vm2.LuaValue k9;
    final static org.luaj.vm2.LuaValue k10;
    final static org.luaj.vm2.LuaValue k11;
    final static org.luaj.vm2.LuaValue k12;
    final static org.luaj.vm2.LuaValue k13;
    final static org.luaj.vm2.LuaValue k14;
    final static org.luaj.vm2.LuaValue k15;
    final static org.luaj.vm2.LuaValue k16;
    final static org.luaj.vm2.LuaValue k17;
    final static org.luaj.vm2.LuaValue k18;
    final static org.luaj.vm2.LuaValue k19;
    final static org.luaj.vm2.LuaValue k20;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("(");
        k1 = org.luaj.vm2.LuaString.valueOf(")");
        k2 = org.luaj.vm2.LuaString.valueOf("!");
        k3 = org.luaj.vm2.LuaString.valueOf("#");
        k4 = org.luaj.vm2.LuaString.valueOf(".");
        k5 = org.luaj.vm2.LuaString.valueOf("$");
        k6 = org.luaj.vm2.LuaString.valueOf("%");
        k7 = org.luaj.vm2.LuaString.valueOf("^");
        k8 = org.luaj.vm2.LuaString.valueOf("@");
        k9 = org.luaj.vm2.LuaString.valueOf("~");
        k10 = org.luaj.vm2.LuaString.valueOf("/");
        k11 = org.luaj.vm2.LuaString.valueOf("-");
        k12 = org.luaj.vm2.LuaString.valueOf(">");
        k13 = org.luaj.vm2.LuaString.valueOf("_");
        k14 = org.luaj.vm2.LuaString.valueOf(":");
        k15 = org.luaj.vm2.LuaString.valueOf("?");
        k16 = org.luaj.vm2.LuaString.valueOf("[");
        k17 = org.luaj.vm2.LuaString.valueOf("]");
        k18 = org.luaj.vm2.LuaString.valueOf("&");
        k19 = org.luaj.vm2.LuaValue.valueOf(0);
        k20 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$76$10() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        if (this.u0.call(a).toboolean()) {
            return org.luaj.vm2.LuaValue.FALSE;
        }
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(18, 0);
        org.luaj.vm2.LuaValue a1 = k0;
        org.luaj.vm2.LuaValue a2 = k1;
        org.luaj.vm2.LuaValue a3 = k2;
        org.luaj.vm2.LuaValue a4 = k3;
        org.luaj.vm2.LuaValue a5 = k4;
        org.luaj.vm2.LuaValue a6 = k5;
        org.luaj.vm2.LuaValue a7 = k6;
        org.luaj.vm2.LuaValue a8 = k7;
        org.luaj.vm2.LuaValue a9 = k8;
        org.luaj.vm2.LuaValue a10 = k9;
        org.luaj.vm2.LuaValue a11 = k10;
        org.luaj.vm2.LuaValue a12 = k11;
        org.luaj.vm2.LuaValue a13 = k12;
        org.luaj.vm2.LuaValue a14 = k13;
        org.luaj.vm2.LuaValue a15 = k14;
        org.luaj.vm2.LuaValue a16 = k15;
        org.luaj.vm2.LuaValue a17 = k16;
        org.luaj.vm2.LuaValue a18 = k17;
        org.luaj.vm2.LuaValue a19 = k18;
        ((org.luaj.vm2.LuaValue)a0).rawset(1, a1);
        ((org.luaj.vm2.LuaValue)a0).rawset(2, a2);
        ((org.luaj.vm2.LuaValue)a0).rawset(3, a3);
        ((org.luaj.vm2.LuaValue)a0).rawset(4, a4);
        ((org.luaj.vm2.LuaValue)a0).rawset(5, a5);
        ((org.luaj.vm2.LuaValue)a0).rawset(6, a6);
        ((org.luaj.vm2.LuaValue)a0).rawset(7, a7);
        ((org.luaj.vm2.LuaValue)a0).rawset(8, a8);
        ((org.luaj.vm2.LuaValue)a0).rawset(9, a9);
        ((org.luaj.vm2.LuaValue)a0).rawset(10, a10);
        ((org.luaj.vm2.LuaValue)a0).rawset(11, a11);
        ((org.luaj.vm2.LuaValue)a0).rawset(12, a12);
        ((org.luaj.vm2.LuaValue)a0).rawset(13, a13);
        ((org.luaj.vm2.LuaValue)a0).rawset(14, a14);
        ((org.luaj.vm2.LuaValue)a0).rawset(15, a15);
        ((org.luaj.vm2.LuaValue)a0).rawset(16, a16);
        ((org.luaj.vm2.LuaValue)a0).rawset(17, a17);
        ((org.luaj.vm2.LuaValue)a0).rawset(18, a18);
        ((org.luaj.vm2.LuaValue)a0).rawset(19, a19);
        org.luaj.vm2.LuaValue a20 = k19;
        while(a20.lt_b(((org.luaj.vm2.LuaValue)a0).len())) {
            if (a.eq_b(((org.luaj.vm2.LuaValue)a0).get(a20.add(k20)))) {
                return org.luaj.vm2.LuaValue.FALSE;
            }
            a20 = a20.add(k20);
        }
        return org.luaj.vm2.LuaValue.TRUE;
    }
}
