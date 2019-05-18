package lang;
public class Lang$luaj$53 extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    
    public Lang$luaj$53() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        if (a.eq_b(a0)) {
            return org.luaj.vm2.LuaValue.TRUE;
        }
        if (!this.u0.call(a).eq_b(this.u0.call(a0))) {
            return org.luaj.vm2.LuaValue.FALSE;
        }
        this.u1.call(a, a0);
        return org.luaj.vm2.LuaValue.TRUE;
    }
}
