package lang;
public class Lang$luaj$46 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$46() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a1 = this.u0[0];
        while(this.u1.call(a).toboolean()) {
            this.u2.get(k0).call((org.luaj.vm2.LuaValue)a0, a);
            org.luaj.vm2.LuaValue a2 = this.u3;
            org.luaj.vm2.Varargs a3 = this.u4.invoke((org.luaj.vm2.Varargs)a);
            org.luaj.vm2.LuaValue[] a4 = new org.luaj.vm2.LuaValue[1];
            a4[0] = a1;
            a1 = a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a4, a3)).arg1();
            a = this.u5.call(a);
        }
        org.luaj.vm2.LuaValue a5 = k1;
        org.luaj.vm2.LuaValue a6 = ((org.luaj.vm2.LuaValue)a0).len();
        org.luaj.vm2.LuaValue a7 = k1;
        org.luaj.vm2.LuaValue a8 = a5.sub(a7);
        while(true) {
            a8 = a8.add(a7);
            if (!a8.testfor_b(a6, a7)) {
                return a;
            }
            org.luaj.vm2.LuaValue a9 = ((org.luaj.vm2.LuaValue)a0).get(a8);
            this.u6.call(a9, a);
        }
    }
}
