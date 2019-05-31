package lang;
public class Lang$luaj$jsbool_no_force_equal_p extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$jsbool_no_force_equal_p() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        if (a.eq_b(a0)) {
            return org.luaj.vm2.LuaValue.TRUE;
        }
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a1).rawset(1, a);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a0);
        while(!((org.luaj.vm2.LuaValue)a1).len().eq_b(k0)) {
            if (!((org.luaj.vm2.LuaValue)a1).len().eq_b(((org.luaj.vm2.LuaValue)a2).len())) {
                return org.luaj.vm2.LuaValue.FALSE;
            }
            org.luaj.vm2.LuaTable a3 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaTable a4 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaTable a5 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaTable a6 = org.luaj.vm2.LuaValue.tableOf(0, 0);
            org.luaj.vm2.LuaValue a7 = k0;
            while(a7.lt_b(((org.luaj.vm2.LuaValue)a1).len())) {
                if (!((org.luaj.vm2.LuaValue)a1).get(a7.add(k1)).eq_b(((org.luaj.vm2.LuaValue)a2).get(a7.add(k1)))) {
                    org.luaj.vm2.LuaValue a8 = this.u0;
                    org.luaj.vm2.LuaValue a9 = ((org.luaj.vm2.LuaValue)a1).get(a7.add(k1));
                    Lang$luaj$jsbool_no_force_equal_p$0 a10 = new Lang$luaj$jsbool_no_force_equal_p$0();
                    a10.u0 = this.u1;
                    a10.u1 = a3;
                    Lang$luaj$jsbool_no_force_equal_p$1 a11 = new Lang$luaj$jsbool_no_force_equal_p$1();
                    a11.u0 = this.u1;
                    a11.u1 = a5;
                    a8.call(a9, (org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.LuaValue)a11);
                    org.luaj.vm2.LuaValue a12 = this.u0;
                    org.luaj.vm2.LuaValue a13 = ((org.luaj.vm2.LuaValue)a2).get(a7.add(k1));
                    Lang$luaj$jsbool_no_force_equal_p$2 a14 = new Lang$luaj$jsbool_no_force_equal_p$2();
                    a14.u0 = this.u1;
                    a14.u1 = a4;
                    Lang$luaj$jsbool_no_force_equal_p$3 a15 = new Lang$luaj$jsbool_no_force_equal_p$3();
                    a15.u0 = this.u1;
                    a15.u1 = a6;
                    a12.call(a13, (org.luaj.vm2.LuaValue)a14, (org.luaj.vm2.LuaValue)a15);
                }
                a7 = a7.add(k1);
            }
            if (!((org.luaj.vm2.LuaValue)a3).len().eq_b(((org.luaj.vm2.LuaValue)a4).len())) {
                return org.luaj.vm2.LuaValue.FALSE;
            }
            org.luaj.vm2.LuaValue a16 = k0;
            while(a16.lt_b(((org.luaj.vm2.LuaValue)a3).len())) {
                if (!((org.luaj.vm2.LuaValue)a3).get(a16.add(k1)).eq_b(((org.luaj.vm2.LuaValue)a4).get(a16.add(k1)))) {
                    return org.luaj.vm2.LuaValue.FALSE;
                }
                a16 = a16.add(k1);
            }
            a1 = a5;
            a2 = a6;
        }
        return (((org.luaj.vm2.LuaValue)a2).len().eq_b(k0)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE;
    }
}
