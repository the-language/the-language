package lang;
public class Lang$luaj$new_symbol extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$new_symbol() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, (org.luaj.vm2.Varargs)this.u1[0].call().get(a0));
    }
}
