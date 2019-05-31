package lang;
public class Lang$luaj$machinetext_print extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
        k3 = org.luaj.vm2.LuaValue.valueOf(2);
        k4 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k5 = org.luaj.vm2.LuaString.valueOf("tostring");
    }
    
    public Lang$luaj$machinetext_print() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a0).rawset(1, a);
        org.luaj.vm2.LuaValue a1 = k0;
        org.luaj.vm2.LuaValue a2 = a0;
        while(!a2.len().eq_b(k1)) {
            org.luaj.vm2.LuaValue a3 = this.u0.call(a2);
            org.luaj.vm2.LuaValue a4 = a3.get(k2);
            a2 = a3.get(k3);
            org.luaj.vm2.Varargs a5 = this.u1.get(k4).invoke((org.luaj.vm2.Varargs)a4);
            org.luaj.vm2.LuaValue a6 = a5.arg1();
            org.luaj.vm2.LuaValue a7 = a5.arg(2);
            org.luaj.vm2.LuaValue a8 = a5.arg(3);
            while(true) {
                org.luaj.vm2.Varargs a9 = a6.invoke(a7, (org.luaj.vm2.Varargs)a8);
                a8 = a9.arg1();
                org.luaj.vm2.LuaValue a10 = a9.arg(2);
                if (a8.isnil()) {
                    break;
                }
                a1 = this.u1.get(k5).call(a1).concat(this.u1.get(k5).call(a10));
            }
        }
        return a1;
    }
}
