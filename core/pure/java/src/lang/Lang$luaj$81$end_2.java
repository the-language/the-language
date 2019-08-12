package lang;
public class Lang$luaj$81$end_2 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    
    public Lang$luaj$81$end_2() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u0[0];
        org.luaj.vm2.LuaValue a5 = a2.call(a0);
        org.luaj.vm2.Varargs a6 = a2.invoke((org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[1];
        a7[0] = a5;
        org.luaj.vm2.LuaValue a8 = a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a7, a6)).arg1();
        org.luaj.vm2.LuaValue a9 = this.u0[0];
        org.luaj.vm2.LuaValue a10 = a3.call(a0);
        org.luaj.vm2.Varargs a11 = a3.invoke((org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a10;
        org.luaj.vm2.LuaValue a13 = a9.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11)).arg1();
        if (a8.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE) && a13.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE)) {
            this.u1[0].call(a0, a1);
            org.luaj.vm2.LuaValue a14 = org.luaj.vm2.LuaValue.TRUE;
            return a14;
        }
        if (!a8.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && !a13.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            return org.luaj.vm2.LuaValue.NIL;
        }
        org.luaj.vm2.LuaValue a15 = org.luaj.vm2.LuaValue.FALSE;
        return a15;
    }
}
