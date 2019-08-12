package lang;
public class Lang$luaj$63 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    
    public Lang$luaj$63() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0.call(a0).toboolean()) {
            a0 = this.u1.call(a0);
        }
        if (this.u0.call(a0).toboolean()) {
            org.luaj.vm2.Varargs a1 = org.luaj.vm2.LuaValue.NIL;
            return a1;
        }
        if (this.u2.call(a0).toboolean()) {
            org.luaj.vm2.Varargs a2 = org.luaj.vm2.LuaValue.TRUE;
            return a2;
        }
        if (!this.u3.call(a0).toboolean()) {
            org.luaj.vm2.Varargs a3 = org.luaj.vm2.LuaValue.FALSE;
            return a3;
        }
        org.luaj.vm2.LuaValue a4 = this.u4.call(a0);
        if (this.u0.call(a4).toboolean()) {
            a4 = this.u1.call(a4);
        }
        if (this.u0.call(a4).toboolean()) {
            org.luaj.vm2.Varargs a5 = org.luaj.vm2.LuaValue.NIL;
            return a5;
        }
        if (!this.u2.call(a4).toboolean()) {
            org.luaj.vm2.Varargs a6 = org.luaj.vm2.LuaValue.FALSE;
            return a6;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u5, org.luaj.vm2.LuaValue.varargsOf(a4, (org.luaj.vm2.Varargs)this.u6[0]));
    }
}
