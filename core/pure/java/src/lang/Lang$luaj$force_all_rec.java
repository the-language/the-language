package lang;
public class Lang$luaj$force_all_rec extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    
    public Lang$luaj$force_all_rec() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaValue a1 = this.u0.call(a0);
        Lang$luaj$force_all_rec$conslike a2 = new Lang$luaj$force_all_rec$conslike();
        a2.u0 = this.u1;
        a2.u1 = this.u2;
        a2.u2 = this.u3;
        a2.u3 = this.u4;
        if (this.u5.call(a1).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a1);
        }
        if (this.u6.call(a1).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a1);
        }
        if (!this.u7.call(a1).toboolean()) {
            org.luaj.vm2.Varargs a3 = a1;
            return a3;
        }
        return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a2, (org.luaj.vm2.Varargs)a1);
    }
}
