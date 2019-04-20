package lang;
public class Lang$luaj$76$11 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue u9;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(0);
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$76$11() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        this.u0.call();
        org.luaj.vm2.LuaTable a0 = org.luaj.vm2.LuaValue.tableOf(8, 0);
        org.luaj.vm2.LuaValue a1 = this.u1;
        org.luaj.vm2.LuaValue a2 = this.u2;
        org.luaj.vm2.LuaValue a3 = this.u3;
        org.luaj.vm2.LuaValue a4 = this.u4;
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
        org.luaj.vm2.LuaValue a9 = k0;
        while(a9.lt_b(((org.luaj.vm2.LuaValue)a0).len())) {
            org.luaj.vm2.LuaValue a10 = ((org.luaj.vm2.LuaValue)a0).get(a9.add(k1)).call();
            if (!a10.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                org.luaj.vm2.Varargs a11 = a10;
                return a11;
            }
            a9 = a9.add(k1);
        }
        return org.luaj.vm2.LuaValue.tailcallOf(this.u9, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
}
