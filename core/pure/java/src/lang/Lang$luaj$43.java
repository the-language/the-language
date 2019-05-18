package lang;
public class Lang$luaj$43 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    
    public Lang$luaj$43() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0[0].call(a0);
        Lang$luaj$43$conslike a2 = new Lang$luaj$43$conslike();
        a2.u0 = this.u1;
        if (this.u2.call(a1).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a1);
        }
        if (this.u3.call(a1).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a1);
        }
        if (this.u4.call(a1).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a1);
        }
        if (!this.u5.call(a1).toboolean()) {
            org.luaj.vm2.Varargs a3 = a1;
            return a3;
        }
        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a1);
    }
}
