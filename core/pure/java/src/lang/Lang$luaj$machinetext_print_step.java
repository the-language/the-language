package lang;
public class Lang$luaj$machinetext_print_step extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("ipairs");
    }
    
    public Lang$luaj$machinetext_print_step() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.Varargs a2 = this.u0.get(k0).invoke((org.luaj.vm2.Varargs)a);
        org.luaj.vm2.LuaValue a3 = a2.arg1();
        org.luaj.vm2.LuaValue a4 = a2.arg(2);
        org.luaj.vm2.LuaValue a5 = a2.arg(3);
        while(true) {
            org.luaj.vm2.Varargs a6 = a3.invoke(a4, (org.luaj.vm2.Varargs)a5);
            a5 = a6.arg1();
            org.luaj.vm2.LuaValue a7 = a6.arg(2);
            if (a5.isnil()) {
                org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(2, 0);
                ((org.luaj.vm2.LuaValue)a8).rawset(1, (org.luaj.vm2.LuaValue)a0);
                ((org.luaj.vm2.LuaValue)a8).rawset(2, (org.luaj.vm2.LuaValue)a1);
                return a8;
            }
            org.luaj.vm2.LuaValue a9 = this.u1;
            Lang$luaj$machinetext_print_step$0 a10 = new Lang$luaj$machinetext_print_step$0();
            a10.u0 = this.u2;
            a10.u1 = a0;
            Lang$luaj$machinetext_print_step$1 a11 = new Lang$luaj$machinetext_print_step$1();
            a11.u0 = this.u2;
            a11.u1 = a1;
            a9.call(a7, (org.luaj.vm2.LuaValue)a10, (org.luaj.vm2.LuaValue)a11);
        }
    }
}