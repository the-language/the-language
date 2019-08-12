package lang;
public class Lang$luaj$65 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$65() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (!a0.get(k0).toboolean()) {
            org.luaj.vm2.Varargs a1 = org.luaj.vm2.LuaValue.FALSE;
            return a1;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, (org.luaj.vm2.Varargs)a0.get(k1));
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
