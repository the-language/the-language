public class lang$luaj$2 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public lang$luaj$2() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (a0.toboolean()) {
            org.luaj.vm2.Varargs a1 = org.luaj.vm2.LuaValue.NONE;
            return a1;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
