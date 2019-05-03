package lang;
public class Lang$luaj$52 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$52() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        a.subargs(3);
        org.luaj.vm2.LuaValue a2 = k0;
        while(a2.lt_b(a0.len())) {
            if (this.u0[0].call(a0.get(a2.add(k0).add(k1)), a1).toboolean()) {
                org.luaj.vm2.Varargs a3 = a0.get(a2.add(k1).add(k1));
                return a3;
            }
            a2 = a2.add(k2);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
