package lang;
public class Lang$luaj$80$24 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$80$24() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0;
        Lang$luaj$80$24$0 a3 = new Lang$luaj$80$24$0();
        Lang$luaj$80$24$1 a4 = new Lang$luaj$80$24$1();
        a4.u0 = this.u1;
        org.luaj.vm2.LuaValue a5 = a2.call(a1, (org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.LuaValue)a4);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.Varargs)a5));
    }
}
