package lang;
public class Lang$luaj$recordstring_shadow_copy extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("pairs");
    }
    
    public Lang$luaj$recordstring_shadow_copy() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.Varargs a1 = this.u0.get(k0).invoke((org.luaj.vm2.Varargs)a);
        org.luaj.vm2.LuaValue a2 = a1.arg1();
        org.luaj.vm2.LuaValue a3 = a1.arg(2);
        org.luaj.vm2.LuaValue a4 = a1.arg(3);
        while(true) {
            a4 = a2.invoke(a3, (org.luaj.vm2.Varargs)a4).arg1();
            if (a4.isnil()) {
                return a0;
            }
            ((org.luaj.vm2.LuaValue)a0).set(a4, a.get(a4));
        }
    }
}
