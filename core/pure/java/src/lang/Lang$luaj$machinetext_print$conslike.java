package lang;
public class Lang$luaj$machinetext_print$conslike extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("tostring");
    }
    
    public Lang$luaj$machinetext_print$conslike() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u1.get(k0).call(this.u0[0]).concat(this.u1.get(k0).call(a1));
        this.u0[0] = a4;
        org.luaj.vm2.LuaValue a5 = this.u2;
        org.luaj.vm2.LuaValue a6 = this.u3;
        org.luaj.vm2.LuaValue a7 = a2.call(a0);
        org.luaj.vm2.Varargs a8 = a3.invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a9 = new org.luaj.vm2.LuaValue[2];
        a9[0] = a6;
        a9[1] = a7;
        return org.luaj.vm2.LuaValue.tailcallOf(a5, org.luaj.vm2.LuaValue.varargsOf(a9, a8));
    }
}
