package lang;
public class Lang$luaj$w$3 extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
    }
    
    public Lang$luaj$w$3() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0.call();
        org.luaj.vm2.LuaValue a1 = this.u0.call();
        this.u1.get(k0).call(this.u2, a0);
        this.u1.get(k0).call(this.u2, a1);
        org.luaj.vm2.LuaValue a2 = this.u3;
        org.luaj.vm2.LuaValue a3 = this.u4;
        org.luaj.vm2.Varargs a4 = a.invoke(a0, (org.luaj.vm2.Varargs)a1);
        org.luaj.vm2.LuaValue[] a5 = new org.luaj.vm2.LuaValue[1];
        a5[0] = a3;
        a2.invoke(org.luaj.vm2.LuaValue.varargsOf(a5, a4));
        return org.luaj.vm2.LuaValue.NONE;
    }
}
