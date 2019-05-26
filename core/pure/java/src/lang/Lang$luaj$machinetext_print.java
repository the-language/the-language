package lang;
public class Lang$luaj$machinetext_print extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
        k3 = org.luaj.vm2.LuaValue.valueOf(2);
        k4 = org.luaj.vm2.LuaString.valueOf("tostring");
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
            org.luaj.vm2.LuaValue a5 = k2;
            org.luaj.vm2.LuaValue a6 = a4.len();
            org.luaj.vm2.LuaValue a7 = k2;
            org.luaj.vm2.LuaValue a8 = a5.sub(a7);
            while(true) {
                a8 = a8.add(a7);
                if (!a8.testfor_b(a6, a7)) {
                    break;
                }
                org.luaj.vm2.LuaValue a9 = a4.get(a8);
                a1 = this.u1.get(k4).call(a1).concat(this.u1.get(k4).call(a9));
            }
        }
        return a1;
    }
}
