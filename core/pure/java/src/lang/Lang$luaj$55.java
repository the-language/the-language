package lang;
public class Lang$luaj$55 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("error");
        k1 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$55() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0.call(a0).toboolean()) {
            org.luaj.vm2.Varargs a1 = a0;
            return a1;
        }
        if (this.u1.call(a0).toboolean()) {
            this.u2.get(k0).call(k1);
        } else if (this.u3.call(a0).toboolean()) {
            this.u2.get(k0).call(k1);
        } else if (this.u4.call(a0).toboolean()) {
            this.u2.get(k0).call(k1);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u5, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
