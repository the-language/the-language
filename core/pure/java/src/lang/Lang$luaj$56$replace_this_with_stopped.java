package lang;
public class Lang$luaj$56$replace_this_with_stopped extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$56$replace_this_with_stopped() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        this.u0[0].set(k0, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)this.u2[0]);
    }
}
