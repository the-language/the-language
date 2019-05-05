package lang;
public class Lang$luaj$run_monad_helper$3$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    
    public Lang$luaj$run_monad_helper$3$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = this.u0;
        org.luaj.vm2.LuaValue a3 = this.u1;
        org.luaj.vm2.LuaValue a4 = this.u2;
        org.luaj.vm2.LuaValue a5 = this.u3;
        org.luaj.vm2.LuaValue a6 = this.u4;
        org.luaj.vm2.LuaTable a7 = org.luaj.vm2.LuaValue.tableOf(1, 0);
        ((org.luaj.vm2.LuaValue)a7).rawset(1, a0);
        org.luaj.vm2.LuaValue a8 = a5.call(a6, (org.luaj.vm2.LuaValue)a7);
        org.luaj.vm2.LuaValue[] a9 = new org.luaj.vm2.LuaValue[4];
        a9[0] = a3;
        a9[1] = a4;
        a9[2] = a8;
        a9[3] = a1;
        return org.luaj.vm2.LuaValue.tailcallOf(a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a9)).arg1(), (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
