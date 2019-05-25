package lang;
public class Lang$luaj$75$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$75$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        this.u0.call(this.u1, a1);
        org.luaj.vm2.LuaValue a4 = this.u0;
        org.luaj.vm2.LuaValue a5 = this.u2;
        org.luaj.vm2.Varargs a6 = a2.invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[1];
        a7[0] = a5;
        a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a7, a6));
        org.luaj.vm2.LuaValue a8 = this.u0;
        org.luaj.vm2.LuaValue a9 = this.u2;
        org.luaj.vm2.Varargs a10 = a3.invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[1];
        a11[0] = a9;
        a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a11, a10));
        return org.luaj.vm2.LuaValue.NONE;
    }
}
