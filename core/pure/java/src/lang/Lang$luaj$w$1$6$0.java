package lang;
public class Lang$luaj$w$1$6$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    
    public Lang$luaj$w$1$6$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0;
        Lang$luaj$w$1$6$0$0 a3 = new Lang$luaj$w$1$6$0$0();
        a3.u0 = this.u1;
        a3.u1 = this.u2;
        a3.u2 = this.u3;
        a3.u3 = this.u4;
        a3.u4 = this.u5;
        a3.u5 = a0;
        a3.u6 = a1;
        return org.luaj.vm2.LuaValue.tailcallOf(a2, (org.luaj.vm2.Varargs)a3);
    }
}
