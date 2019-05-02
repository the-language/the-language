package lang;
public class Lang$luaj$3 extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
    }
    
    public Lang$luaj$3() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        if (a.eq_b(this.u0[0])) {
            return a0;
        }
        if (a0.eq_b(this.u0[0])) {
            return a;
        }
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a2 = k0;
        org.luaj.vm2.LuaValue a3 = a.len();
        org.luaj.vm2.LuaValue a4 = k0;
        org.luaj.vm2.LuaValue a5 = a2.sub(a4);
        while(true) {
            a5 = a5.add(a4);
            if (a5.testfor_b(a3, a4)) {
                org.luaj.vm2.LuaValue a6 = a.get(a5);
                this.u1.get(k1).call((org.luaj.vm2.LuaValue)a1, a6);
            } else {
                org.luaj.vm2.LuaValue a7 = k0;
                org.luaj.vm2.LuaValue a8 = a0.len();
                org.luaj.vm2.LuaValue a9 = k0;
                org.luaj.vm2.LuaValue a10 = a7.sub(a9);
                while(true) {
                    a10 = a10.add(a9);
                    if (!a10.testfor_b(a8, a9)) {
                        org.luaj.vm2.LuaValue a11 = a1;
                        return a11;
                    }
                    org.luaj.vm2.LuaValue a12 = a0.get(a10);
                    this.u1.get(k1).call((org.luaj.vm2.LuaValue)a1, a12);
                }
            }
        }
    }
}
