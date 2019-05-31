package lang;
public class Lang$luaj$__TS__ArrayPush extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$__TS__ArrayPush() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.Varargs a1 = a.subargs(2);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        ((org.luaj.vm2.LuaValue)a2).rawsetlist(1, a1);
        org.luaj.vm2.Varargs a3 = this.u0.get(k0).invoke((org.luaj.vm2.Varargs)a2);
        org.luaj.vm2.LuaValue a4 = a3.arg1();
        org.luaj.vm2.LuaValue a5 = a3.arg(2);
        org.luaj.vm2.LuaValue a6 = a3.arg(3);
        while(true) {
            org.luaj.vm2.Varargs a7 = a4.invoke(a5, (org.luaj.vm2.Varargs)a6);
            a6 = a7.arg1();
            org.luaj.vm2.LuaValue a8 = a7.arg(2);
            if (a6.isnil()) {
                return a0.len();
            }
            a0.set(a0.len().add(k1), a8);
        }
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
