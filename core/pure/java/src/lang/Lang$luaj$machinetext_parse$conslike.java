package lang;
public class Lang$luaj$machinetext_parse$conslike extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("table");
        k1 = org.luaj.vm2.LuaString.valueOf("remove");
    }
    
    public Lang$luaj$machinetext_parse$conslike() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0.get(k0).get(k1).call(this.u1);
        org.luaj.vm2.LuaValue a2 = this.u0.get(k0).get(k1).call(this.u1);
        if (!a2.eq_b(org.luaj.vm2.LuaValue.NIL) && !a1.eq_b(org.luaj.vm2.LuaValue.NIL)) {
            org.luaj.vm2.LuaValue a3 = this.u3;
            org.luaj.vm2.LuaValue a4 = this.u1;
            org.luaj.vm2.Varargs a5 = a0.invoke(a2, (org.luaj.vm2.Varargs)a1);
            org.luaj.vm2.LuaValue[] a6 = new org.luaj.vm2.LuaValue[1];
            a6[0] = a4;
            return org.luaj.vm2.LuaValue.tailcallOf(a3, org.luaj.vm2.LuaValue.varargsOf(a6, a5));
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
