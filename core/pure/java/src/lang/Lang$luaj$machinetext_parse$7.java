package lang;
public class Lang$luaj$machinetext_parse$7 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    
    public Lang$luaj$machinetext_parse$7() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (!this.u0[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE) && !this.u1[0].eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
            org.luaj.vm2.LuaValue a0 = this.u3.call(this.u0[0]);
            if (a0.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u4, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            this.u5.invoke(this.u6.invoke(a0, (org.luaj.vm2.Varargs)this.u1[0]).subargs(1));
            org.luaj.vm2.Varargs a1 = org.luaj.vm2.LuaValue.NONE;
            return a1;
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u2, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
