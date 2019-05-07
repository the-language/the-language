package lang;
public class Lang$luaj$q extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$q() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, org.luaj.vm2.LuaValue.varargsOf(this.u1, (org.luaj.vm2.Varargs)a0));
    }
}
