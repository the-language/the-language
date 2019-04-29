package lang;
public class Lang$luaj$__TS__ArrayShift extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("table");
        k1 = org.luaj.vm2.LuaString.valueOf("remove");
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$__TS__ArrayShift() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0.get(k0).get(k1), org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.Varargs)k2));
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
