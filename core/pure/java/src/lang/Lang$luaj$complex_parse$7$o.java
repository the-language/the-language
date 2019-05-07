package lang;
public class Lang$luaj$complex_parse$7$o extends org.luaj.vm2.lib.OneArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    
    public Lang$luaj$complex_parse$7$o() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a) {
        org.luaj.vm2.LuaValue a0 = this.u0.call();
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2[0];
        org.luaj.vm2.Varargs a3 = this.u3.invoke(a, (org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a4 = new org.luaj.vm2.LuaValue[1];
        a4[0] = a2;
        a1.invoke(org.luaj.vm2.LuaValue.varargsOf(a4, a3));
        this.u2[0] = a0;
        return org.luaj.vm2.LuaValue.NONE;
    }
}
