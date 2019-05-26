package lang;
public class Lang$luaj$force_uncomment1 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    
    public Lang$luaj$force_uncomment1() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        if (this.u0.call(a0).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(this.u1, (org.luaj.vm2.Varargs)a0);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2[0], (org.luaj.vm2.Varargs)a0);
    }
}
