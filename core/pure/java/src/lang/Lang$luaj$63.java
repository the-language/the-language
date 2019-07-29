package lang;
public class Lang$luaj$63 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$63() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0[0];
        org.luaj.vm2.LuaValue a2 = k0;
        while(a2.lt_b(a0.len())) {
            a1 = this.u1.call(this.u2.call(a0.get(a2.add(k0).add(k1)), a0.get(a2.add(k1).add(k1))), a1);
            a2 = a2.add(k2);
        }
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4[0];
        org.luaj.vm2.Varargs a5 = this.u2.invoke((org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a6 = new org.luaj.vm2.LuaValue[1];
        a6[0] = a4;
        return org.luaj.vm2.LuaValue.tailcallOf(a3, org.luaj.vm2.LuaValue.varargsOf(a6, a5));
    }
}
