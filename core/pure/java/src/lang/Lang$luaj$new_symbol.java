package lang;
public class Lang$luaj$new_symbol extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$new_symbol() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        this.u0.call((org.luaj.vm2.LuaValue)((this.u1[0].get(a0).eq_b(org.luaj.vm2.LuaValue.NIL)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE));
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)this.u1[0].get(a0));
    }
}
