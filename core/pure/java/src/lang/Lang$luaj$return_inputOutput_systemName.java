package lang;
public class Lang$luaj$return_inputOutput_systemName extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("error");
        k1 = org.luaj.vm2.LuaString.valueOf("WIP");
    }
    
    public Lang$luaj$return_inputOutput_systemName() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(5);
        this.u0.get(k0).call(k1);
        return org.luaj.vm2.LuaValue.NONE;
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
