package lang;
public class Lang$luaj$4 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("pairs");
    }
    
    public Lang$luaj$4() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.Varargs a0 = this.u0.get(k0).invoke((org.luaj.vm2.Varargs)a);
        if (!a0.arg1().invoke(a0.arg(2), (org.luaj.vm2.Varargs)a0.arg(3)).arg1().isnil()) {
            return org.luaj.vm2.LuaValue.FALSE;
        }
        return org.luaj.vm2.LuaValue.TRUE;
    }
}
