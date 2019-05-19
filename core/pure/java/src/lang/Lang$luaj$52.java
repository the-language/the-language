package lang;
public class Lang$luaj$52 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$52() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        if (!this.u0.call(a).toboolean()) {
            return a;
        }
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        while(this.u0.call(a).toboolean()) {
            this.u1.call((org.luaj.vm2.LuaValue)a0, a);
            a = this.u2.call(a);
        }
        org.luaj.vm2.LuaValue a1 = k0;
        org.luaj.vm2.LuaValue a2 = ((org.luaj.vm2.LuaValue)a0).len();
        org.luaj.vm2.LuaValue a3 = k0;
        org.luaj.vm2.LuaValue a4 = a1.sub(a3);
        while(true) {
            a4 = a4.add(a3);
            if (!a4.testfor_b(a2, a3)) {
                return a;
            }
            org.luaj.vm2.LuaValue a5 = ((org.luaj.vm2.LuaValue)a0).get(a4);
            this.u3.call(a5, a);
        }
    }
}
