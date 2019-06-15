package lang;
public class Lang$luaj$machinetext_parse$get_do extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaString.valueOf("string");
        k2 = org.luaj.vm2.LuaString.valueOf("sub");
    }
    
    public Lang$luaj$machinetext_parse$get_do() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        this.u0.invoke(this.u1.invoke().subargs(1));
        org.luaj.vm2.LuaValue a0 = this.u2[0].sub(k0);
        this.u2[0] = a0;
        return org.luaj.vm2.LuaValue.tailcallOf(this.u3.get(k1).get(k2), org.luaj.vm2.LuaValue.varargsOf(this.u4, this.u2[0].add(k0), (org.luaj.vm2.Varargs)this.u2[0].add(k0)));
    }
}
