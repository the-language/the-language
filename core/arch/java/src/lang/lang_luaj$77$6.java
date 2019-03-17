package lang;
public class lang_luaj$77$6 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
    }
    
    public lang_luaj$77$6() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (this.u0.call().toboolean()) {
            org.luaj.vm2.Varargs a0 = org.luaj.vm2.LuaValue.FALSE;
            return a0;
        }
        org.luaj.vm2.LuaValue a1 = this.u1.call();
        org.luaj.vm2.LuaValue a2 = k0;
        if (!this.u2[0].call(a1).toboolean()) {
            this.u3.call(a1);
            org.luaj.vm2.Varargs a3 = org.luaj.vm2.LuaValue.FALSE;
            return a3;
        }
        while(true) {
            if (this.u2[0].call(a1).toboolean() && !this.u0.call().toboolean()) {
                a2 = a2.concat(a1);
                a1 = this.u1.call();
                continue;
            }
            if (this.u2[0].call(a1).toboolean()) {
                a2 = a2.concat(a1);
            } else {
                this.u3.call(a1);
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u4, (org.luaj.vm2.Varargs)a2);
        }
    }
}
