package lang;
public class Lang$luaj$f$5 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    
    public Lang$luaj$f$5() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, org.luaj.vm2.LuaValue.varargsOf(this.u1, this.u2, (org.luaj.vm2.Varargs)this.u3));
    }
}
