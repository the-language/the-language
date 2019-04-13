package lang;
public class lang_luaj$62 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    
    public lang_luaj$62() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, this.u1.invoke(this.u2, this.u1.call(this.u3[0], this.u1.call(a0), this.u4), (org.luaj.vm2.Varargs)a1).subargs(1));
    }
}
