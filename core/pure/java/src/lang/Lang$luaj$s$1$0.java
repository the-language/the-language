package lang;
public class Lang$luaj$s$1$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$s$1$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, this.u1.invoke(a0, (org.luaj.vm2.Varargs)a1).subargs(1));
    }
}
