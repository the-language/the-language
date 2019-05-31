package lang;
public class Lang$luaj$machinetext_print_step extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$machinetext_print_step() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a2 = k0;
        org.luaj.vm2.LuaValue a3 = a.len();
        org.luaj.vm2.LuaValue a4 = k0;
        org.luaj.vm2.LuaValue a5 = a2.sub(a4);
        while(true) {
            a5 = a5.add(a4);
            if (!a5.testfor_b(a3, a4)) {
                org.luaj.vm2.LuaTable a6 = org.luaj.vm2.LuaValue.tableOf(2, 0);
                ((org.luaj.vm2.LuaValue)a6).rawset(1, (org.luaj.vm2.LuaValue)a0);
                ((org.luaj.vm2.LuaValue)a6).rawset(2, (org.luaj.vm2.LuaValue)a1);
                return a6;
            }
            org.luaj.vm2.LuaValue a7 = a.get(a5);
            org.luaj.vm2.LuaValue a8 = this.u0;
            Lang$luaj$machinetext_print_step$0 a9 = new Lang$luaj$machinetext_print_step$0();
            a9.u0 = this.u1;
            a9.u1 = a0;
            Lang$luaj$machinetext_print_step$1 a10 = new Lang$luaj$machinetext_print_step$1();
            a10.u0 = this.u1;
            a10.u1 = a1;
            a8.call(a7, (org.luaj.vm2.LuaValue)a9, (org.luaj.vm2.LuaValue)a10);
        }
    }
}
