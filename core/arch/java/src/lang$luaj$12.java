public class lang$luaj$12 extends org.luaj.vm2.lib.OneArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public lang$luaj$12() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        return a.get(k0);
    }
}
