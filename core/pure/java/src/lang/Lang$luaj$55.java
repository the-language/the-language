package lang;
public class Lang$luaj$55 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
    }
    
    public Lang$luaj$55() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        a.subargs(4);
        org.luaj.vm2.LuaTable a3 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        while(this.u0.call(a0).toboolean()) {
            org.luaj.vm2.LuaValue a4 = this.u1.get(k0);
            org.luaj.vm2.Varargs a5 = this.u2.invoke((org.luaj.vm2.Varargs)a0);
            org.luaj.vm2.LuaValue[] a6 = new org.luaj.vm2.LuaValue[1];
            a6[0] = a3;
            a4.invoke(org.luaj.vm2.LuaValue.varargsOf(a6, a5));
            a0 = this.u3.call(a0);
        }
        if (this.u4.call(a0).toboolean()) {
            return org.luaj.vm2.LuaValue.tailcallOf(a1, (org.luaj.vm2.Varargs)a3);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(a2, org.luaj.vm2.LuaValue.varargsOf((org.luaj.vm2.LuaValue)a3, (org.luaj.vm2.Varargs)a0));
    }
}
