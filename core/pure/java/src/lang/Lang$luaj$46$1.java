package lang;
public class Lang$luaj$46$1 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue[] u6;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
    }
    
    public Lang$luaj$46$1() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        this.u0.call(a0);
        if (!this.u1.call(a0).toboolean()) {
            org.luaj.vm2.Varargs a1 = a0;
            return a1;
        }
        this.u2.get(k0).call(this.u3[0], this.u4[0]);
        org.luaj.vm2.LuaValue a2 = this.u5[0];
        org.luaj.vm2.LuaValue a3 = this.u6[0];
        org.luaj.vm2.LuaTable a4 = org.luaj.vm2.LuaValue.tableOf(2, 0);
        org.luaj.vm2.LuaBoolean a5 = org.luaj.vm2.LuaValue.FALSE;
        org.luaj.vm2.LuaBoolean a6 = org.luaj.vm2.LuaValue.FALSE;
        ((org.luaj.vm2.LuaValue)a4).rawset(1, (org.luaj.vm2.LuaValue)a5);
        ((org.luaj.vm2.LuaValue)a4).rawset(2, (org.luaj.vm2.LuaValue)a6);
        org.luaj.vm2.LuaValue a7 = this.u3[0];
        org.luaj.vm2.LuaValue[] a8 = new org.luaj.vm2.LuaValue[4];
        a8[0] = a0;
        a8[1] = a3;
        a8[2] = a4;
        a8[3] = a7;
        return org.luaj.vm2.LuaValue.tailcallOf(a2, org.luaj.vm2.LuaValue.varargsOf(a8));
    }
}
