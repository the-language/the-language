package lang;
public class Lang$luaj$run_trampoline extends org.luaj.vm2.lib.OneArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
    }
    
    public Lang$luaj$run_trampoline() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = a.call();
        while(a0.get(k0).toboolean()) {
            a0 = a0.get(k1).call();
        }
        return a0.get(k1);
    }
}
