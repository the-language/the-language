package lang;
public class Lang$luaj$jsbool_no_force_equal_p extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaString.valueOf("unpack");
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$jsbool_no_force_equal_p() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a1).rawset(1, a);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a2).rawset(1, a0);
        org.luaj.vm2.LuaValue a3 = a1;
        org.luaj.vm2.LuaValue a4 = a2;
        while(!a3.len().eq_b(k0)) {
            org.luaj.vm2.Varargs a5 = this.u0.get(k1).invoke(this.u1.invoke((org.luaj.vm2.Varargs)a3).subargs(1));
            org.luaj.vm2.LuaValue a6 = a5.arg1();
            a3 = a5.arg(2);
            org.luaj.vm2.Varargs a7 = this.u0.get(k1).invoke(this.u1.invoke((org.luaj.vm2.Varargs)a4).subargs(1));
            org.luaj.vm2.LuaValue a8 = a7.arg1();
            a4 = a7.arg(2);
            if (!a6.len().eq_b(a8.len())) {
                return org.luaj.vm2.LuaValue.FALSE;
            }
            org.luaj.vm2.LuaValue a9 = k0;
            while(a9.lt_b(a6.len())) {
                if (!a6.get(a9.add(k2)).eq_b(a8.get(a9.add(k2)))) {
                    return org.luaj.vm2.LuaValue.FALSE;
                }
                a9 = a9.add(k2);
            }
        }
        return (a4.len().eq_b(k0)) ? org.luaj.vm2.LuaValue.TRUE : org.luaj.vm2.LuaValue.FALSE;
    }
}
