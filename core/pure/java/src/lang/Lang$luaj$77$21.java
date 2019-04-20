package lang;
public class Lang$luaj$77$21 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    
    public Lang$luaj$77$21() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaValue a3 = this.u0;
        Lang$luaj$77$21$0 a4 = new Lang$luaj$77$21$0();
        Lang$luaj$77$21$1 a5 = new Lang$luaj$77$21$1();
        a5.u0 = this.u1;
        org.luaj.vm2.LuaValue a6 = a3.call(a2, (org.luaj.vm2.LuaValue)a4, (org.luaj.vm2.LuaValue)a5);
        org.luaj.vm2.LuaValue a7 = this.u2.call(a0);
        if (a7.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u3, org.luaj.vm2.LuaValue.varargsOf(a7, a1, (org.luaj.vm2.Varargs)a6));
    }
}
