package lang;
public class Lang$luaj$complex_parse$10 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("ipairs");
    }
    
    public Lang$luaj$complex_parse$10() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        this.u0.call();
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(8, 0);
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2[0];
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4[0];
        org.luaj.vm2.LuaValue a5 = this.u5[0];
        org.luaj.vm2.LuaValue a6 = this.u6[0];
        org.luaj.vm2.LuaValue a7 = this.u7[0];
        org.luaj.vm2.LuaValue a8 = this.u8[0];
        ((org.luaj.vm2.LuaValue)a0).rawset(1, a1);
        ((org.luaj.vm2.LuaValue)a0).rawset(2, a2);
        ((org.luaj.vm2.LuaValue)a0).rawset(3, a3);
        ((org.luaj.vm2.LuaValue)a0).rawset(4, a4);
        ((org.luaj.vm2.LuaValue)a0).rawset(5, a5);
        ((org.luaj.vm2.LuaValue)a0).rawset(6, a6);
        ((org.luaj.vm2.LuaValue)a0).rawset(7, a7);
        ((org.luaj.vm2.LuaValue)a0).rawset(8, a8);
        org.luaj.vm2.Varargs a9 = this.u9.get(k0).invoke((org.luaj.vm2.Varargs)a0);
        org.luaj.vm2.LuaValue a10 = a9.arg1();
        org.luaj.vm2.LuaValue a11 = a9.arg(2);
        org.luaj.vm2.LuaValue a12 = a9.arg(3);
        while(true) {
            org.luaj.vm2.Varargs a13 = a10.invoke(a11, (org.luaj.vm2.Varargs)a12);
            a12 = a13.arg1();
            org.luaj.vm2.LuaValue a14 = a13.arg(2);
            if (a12.isnil()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u10, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a15 = a14.call();
            if (!a15.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                org.luaj.vm2.Varargs a16 = a15;
                return a16;
            }
        }
    }
}
