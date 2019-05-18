package lang;
public class Lang$luaj$80$12 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public Lang$luaj$80$12() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (!a0.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            org.luaj.vm2.Varargs a1 = a0;
            return a1;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
