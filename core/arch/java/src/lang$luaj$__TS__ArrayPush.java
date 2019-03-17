public class lang$luaj$__TS__ArrayPush extends org.luaj.vm2.lib.VarArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang$luaj$__TS__ArrayPush() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.Varargs a1 = a.subargs(2);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        ((org.luaj.vm2.LuaValue)a2).rawsetlist(1, a1);
        org.luaj.vm2.LuaValue a3 = k0;
        org.luaj.vm2.LuaValue a4 = ((org.luaj.vm2.LuaValue)a2).len();
        org.luaj.vm2.LuaValue a5 = k0;
        org.luaj.vm2.LuaValue a6 = a3.sub(a5);
        while(true) {
            a6 = a6.add(a5);
            if (!a6.testfor_b(a4, a5)) {
                return a0.len();
            }
            org.luaj.vm2.LuaValue a7 = ((org.luaj.vm2.LuaValue)a2).get(a6);
            a0.set(a0.len().add(k0), a7);
        }
    }
}
