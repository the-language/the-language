package lang;
public class Lang$luaj$machinetext_parse$1$0 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("tostring");
        k1 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
    }
    
    public Lang$luaj$machinetext_parse$1$0() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u1.get(k0).call(this.u0[0]).concat(this.u1.get(k0).call(a1));
        this.u0[0] = a4;
        org.luaj.vm2.LuaValue a5 = this.u1.get(k1);
        org.luaj.vm2.LuaValue a6 = this.u2;
        org.luaj.vm2.Varargs a7 = a2.invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[1];
        a8[0] = a6;
        a5.invoke(org.luaj.vm2.LuaValue.varargsOf(a8, a7));
        org.luaj.vm2.LuaValue a9 = this.u1.get(k1);
        org.luaj.vm2.LuaValue a10 = this.u2;
        org.luaj.vm2.Varargs a11 = a3.invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
        a12[0] = a10;
        a9.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11));
        return org.luaj.vm2.LuaValue.NONE;
    }
}
