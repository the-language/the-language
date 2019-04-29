package lang;
public class Lang$luaj$__TS__ArrayReverse extends org.luaj.vm2.lib.OneArgFunction {
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$__TS__ArrayReverse() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = k0;
        org.luaj.vm2.LuaValue a1 = a.len().sub(k1);
        while(a0.lt_b(a1)) {
            org.luaj.vm2.LuaValue a2 = a.get(a1.add(k1));
            a.set(a1.add(k1), a.get(a0.add(k1)));
            a.set(a0.add(k1), a2);
            a0 = a0.add(k1);
            a1 = a1.sub(k1);
        }
        return a;
    }
}
