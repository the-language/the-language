package lang;
public class Lang$luaj$machinetext_parse$6 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    
    public Lang$luaj$machinetext_parse$6() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
        }
        org.luaj.vm2.LuaValue a1 = this.u2;
        org.luaj.vm2.LuaValue a2 = this.u3;
        org.luaj.vm2.Varargs a3 = this.u4.invoke(this.u0[0], (org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a4 = new org.luaj.vm2.LuaValue[1];
        a4[0] = a2;
        return org.luaj.vm2.LuaValue.tailcallOf(a1, org.luaj.vm2.LuaValue.varargsOf(a4, a3));
    }
}
