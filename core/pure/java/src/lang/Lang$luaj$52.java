package lang;
public class Lang$luaj$52 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("ipairs");
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
        org.luaj.vm2.Varargs a1 = this.u3.get(k0).invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue a2 = a1.arg1();
        org.luaj.vm2.LuaValue a3 = a1.arg(2);
        org.luaj.vm2.LuaValue a4 = a1.arg(3);
        while(true) {
            org.luaj.vm2.Varargs a5 = a2.invoke(a3, (org.luaj.vm2.Varargs)a4);
            a4 = a5.arg1();
            org.luaj.vm2.LuaValue a6 = a5.arg(2);
            if (a4.isnil()) {
                return a;
            }
            this.u4[0].call(a6, a);
        }
    }
}
