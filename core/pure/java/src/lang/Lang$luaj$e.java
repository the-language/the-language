package lang;
public class Lang$luaj$e extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$e() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u0;
        org.luaj.vm2.LuaValue a5 = this.u1;
        Lang$luaj$e$0 a6 = new Lang$luaj$e$0();
        a6.u0 = this.u2;
        a6.u1 = a0;
        Lang$luaj$e$1 a7 = new Lang$luaj$e$1();
        a7.u0 = this.u2;
        a7.u1 = a1;
        a7.u2 = this.u0;
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[4];
        a8[0] = a6;
        a8[1] = a7;
        a8[2] = a2;
        a8[3] = a3;
        return org.luaj.vm2.LuaValue.tailcallOf(a4, a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a8)).subargs(1));
    }
}
