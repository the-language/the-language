package lang;
public class Lang$luaj$run_monad_helper$r$2 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    
    public Lang$luaj$run_monad_helper$r$2() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = this.u0;
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2;
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4;
        org.luaj.vm2.LuaValue a5 = this.u5;
        org.luaj.vm2.LuaValue[] a6 = new org.luaj.vm2.LuaValue[5];
        a6[0] = a1;
        a6[1] = a2;
        a6[2] = a3;
        a6[3] = a4;
        a6[4] = a5;
        return org.luaj.vm2.LuaValue.tailcallOf(a0, org.luaj.vm2.LuaValue.varargsOf(a6));
    }
}
