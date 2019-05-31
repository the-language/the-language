package lang;
public class Lang$luaj$75$conslike extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$75$conslike() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        this.u0.call(a1);
        this.u1.invoke(a2.invoke((org.luaj.vm2.Varargs)a0).subargs(1));
        return org.luaj.vm2.LuaValue.tailcallOf(this.u1, a3.invoke((org.luaj.vm2.Varargs)a0).subargs(1));
    }
}
