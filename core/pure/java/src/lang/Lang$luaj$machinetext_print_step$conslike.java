package lang;
public class Lang$luaj$machinetext_print_step$conslike extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    
    public Lang$luaj$machinetext_print_step$conslike() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        this.u0.call(this.u1, a1);
        org.luaj.vm2.LuaValue a4 = this.u0;
        org.luaj.vm2.LuaValue a5 = this.u2;
        org.luaj.vm2.LuaValue a6 = a2.call(a0);
        org.luaj.vm2.Varargs a7 = a3.invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[2];
        a8[0] = a5;
        a8[1] = a6;
        return org.luaj.vm2.LuaValue.tailcallOf(a4, org.luaj.vm2.LuaValue.varargsOf(a8, a7));
    }
}
