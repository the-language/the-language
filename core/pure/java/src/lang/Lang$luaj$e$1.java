package lang;
public class Lang$luaj$e$1 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$e$1() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0;
        org.luaj.vm2.LuaValue a4 = this.u1;
        Lang$luaj$e$1$0 a5 = new Lang$luaj$e$1$0();
        a5.u0 = this.u2;
        a5.u1 = a2;
        return org.luaj.vm2.LuaValue.tailcallOf(a3, a4.invoke(a0, a1, (org.luaj.vm2.Varargs)a5).subargs(1));
    }
}
