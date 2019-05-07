package lang;
public class Lang$luaj$e extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public Lang$luaj$e() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u0;
        org.luaj.vm2.LuaValue[] a5 = new org.luaj.vm2.LuaValue[4];
        a5[0] = a0;
        a5[1] = a1;
        a5[2] = a2;
        a5[3] = a3;
        return org.luaj.vm2.LuaValue.tailcallOf(a4, org.luaj.vm2.LuaValue.varargsOf(a5));
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
