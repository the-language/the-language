package lang;
public class Lang$luaj$46$make_history extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("pairs");
    }
    
    public Lang$luaj$46$make_history() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        org.luaj.vm2.LuaTable a = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.Varargs a0 = this.u0.get(k0).invoke((org.luaj.vm2.Varargs)this.u1);
        org.luaj.vm2.LuaValue a1 = a0.arg1();
        org.luaj.vm2.LuaValue a2 = a0.arg(2);
        org.luaj.vm2.LuaValue a3 = a0.arg(3);
        while(true) {
            a3 = a1.invoke(a2, (org.luaj.vm2.Varargs)a3).arg1();
            if (a3.isnil()) {
                org.luaj.vm2.Varargs a4 = this.u0.get(k0).invoke((org.luaj.vm2.Varargs)this.u2[0]);
                org.luaj.vm2.LuaValue a5 = a4.arg1();
                org.luaj.vm2.LuaValue a6 = a4.arg(2);
                org.luaj.vm2.LuaValue a7 = a4.arg(3);
                while(true) {
                    a7 = a5.invoke(a6, (org.luaj.vm2.Varargs)a7).arg1();
                    if (a7.isnil()) {
                        return a;
                    }
                    ((org.luaj.vm2.LuaValue)a).set(a7, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
                }
            } else {
                ((org.luaj.vm2.LuaValue)a).set(a3, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.TRUE);
            }
        }
    }
}
