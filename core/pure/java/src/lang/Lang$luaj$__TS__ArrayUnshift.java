package lang;
public class Lang$luaj$__TS__ArrayUnshift extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
        k2 = org.luaj.vm2.LuaString.valueOf("table");
        k3 = org.luaj.vm2.LuaString.valueOf("insert");
    }
    
    public Lang$luaj$__TS__ArrayUnshift() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.Varargs a1 = a.subargs(2);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        ((org.luaj.vm2.LuaValue)a2).rawsetlist(1, a1);
        org.luaj.vm2.LuaValue a3 = ((org.luaj.vm2.LuaValue)a2).len().sub(k0);
        while(k1.lteq_b(a3)) {
            this.u0.get(k2).get(k3).call(a0, k0, ((org.luaj.vm2.LuaValue)a2).get(a3.add(k0)));
            a3 = a3.sub(k0);
        }
        return a0.len();
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
