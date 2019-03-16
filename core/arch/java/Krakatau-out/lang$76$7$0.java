public class lang$76$7$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public lang$76$7$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0[0].eq_b(this.u1)) {
            this.u0[0] = a0;
            org.luaj.vm2.Varargs a1 = org.luaj.vm2.LuaValue.NONE;
            return a1;
        }
        org.luaj.vm2.LuaValue a2 = this.u0[0];
        while(this.u2.call(a2).toboolean()) {
            if (this.u4.call(a2).eq_b(this.u1)) {
                if (!this.u2.call(a2).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (!this.u4.call(a2).eq_b(this.u1)) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                a2.set(k0, a0);
                org.luaj.vm2.Varargs a3 = org.luaj.vm2.LuaValue.NONE;
                return a3;
            } else {
                a2 = this.u4.call(a2);
            }
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
