package lang;
public class Lang$luaj$run_monad_helper$6 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
    
    public Lang$luaj$run_monad_helper$6() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        org.luaj.vm2.LuaValue a0 = this.u0;
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2;
        Lang$luaj$run_monad_helper$6$0 a3 = new Lang$luaj$run_monad_helper$6$0();
        a3.u0 = this.u3;
        a3.u1 = this.u4;
        a3.u2 = this.u5;
        a3.u3 = this.u0;
        a3.u4 = this.u6;
        a3.u5 = this.u7;
        return org.luaj.vm2.LuaValue.tailcallOf(a0, org.luaj.vm2.LuaValue.varargsOf(a1, a2, (org.luaj.vm2.Varargs)a3));
    }
}
