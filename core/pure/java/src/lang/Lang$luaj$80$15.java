package lang;
public class Lang$luaj$80$15 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue[] u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue[] u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue u12;
    final static org.luaj.vm2.LuaValue k0;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$80$15() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaTable a0 = null;
        org.luaj.vm2.LuaValue a1 = a.arg(1);
        a.subargs(2);
        if (a1.eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a1 = org.luaj.vm2.LuaValue.FALSE;
        }
        Lang$luaj$80$15$readsysname_no_pack_bracket a2 = new Lang$luaj$80$15$readsysname_no_pack_bracket();
        a2.u0 = this.u0;
        a2.u1 = this.u1;
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        if (a1.toboolean()) {
            a0 = org.luaj.vm2.LuaValue.tableOf(10, 0);
            org.luaj.vm2.LuaValue a3 = this.u2;
            org.luaj.vm2.LuaValue a4 = this.u3;
            org.luaj.vm2.LuaValue a5 = this.u4;
            org.luaj.vm2.LuaValue a6 = this.u5;
            org.luaj.vm2.LuaValue a7 = this.u6[0];
            org.luaj.vm2.LuaValue a8 = this.u7[0];
            org.luaj.vm2.LuaValue a9 = this.u8[0];
            org.luaj.vm2.LuaValue a10 = this.u9[0];
            org.luaj.vm2.LuaValue a11 = this.u10[0];
            ((org.luaj.vm2.LuaValue)a0).rawset(1, a3);
            ((org.luaj.vm2.LuaValue)a0).rawset(2, a4);
            ((org.luaj.vm2.LuaValue)a0).rawset(3, (org.luaj.vm2.LuaValue)a2);
            ((org.luaj.vm2.LuaValue)a0).rawset(4, a5);
            ((org.luaj.vm2.LuaValue)a0).rawset(5, a6);
            ((org.luaj.vm2.LuaValue)a0).rawset(6, a7);
            ((org.luaj.vm2.LuaValue)a0).rawset(7, a8);
            ((org.luaj.vm2.LuaValue)a0).rawset(8, a9);
            ((org.luaj.vm2.LuaValue)a0).rawset(9, a10);
            ((org.luaj.vm2.LuaValue)a0).rawset(10, a11);
        } else {
            a0 = org.luaj.vm2.LuaValue.tableOf(9, 0);
            org.luaj.vm2.LuaValue a12 = this.u2;
            org.luaj.vm2.LuaValue a13 = this.u11[0];
            org.luaj.vm2.LuaValue a14 = this.u4;
            org.luaj.vm2.LuaValue a15 = this.u5;
            org.luaj.vm2.LuaValue a16 = this.u6[0];
            org.luaj.vm2.LuaValue a17 = this.u7[0];
            org.luaj.vm2.LuaValue a18 = this.u8[0];
            org.luaj.vm2.LuaValue a19 = this.u9[0];
            org.luaj.vm2.LuaValue a20 = this.u10[0];
            ((org.luaj.vm2.LuaValue)a0).rawset(1, a12);
            ((org.luaj.vm2.LuaValue)a0).rawset(2, a13);
            ((org.luaj.vm2.LuaValue)a0).rawset(3, a14);
            ((org.luaj.vm2.LuaValue)a0).rawset(4, a15);
            ((org.luaj.vm2.LuaValue)a0).rawset(5, a16);
            ((org.luaj.vm2.LuaValue)a0).rawset(6, a17);
            ((org.luaj.vm2.LuaValue)a0).rawset(7, a18);
            ((org.luaj.vm2.LuaValue)a0).rawset(8, a19);
            ((org.luaj.vm2.LuaValue)a0).rawset(9, a20);
        }
        org.luaj.vm2.LuaValue a21 = k0;
        org.luaj.vm2.LuaValue a22 = ((org.luaj.vm2.LuaValue)a0).len();
        org.luaj.vm2.LuaValue a23 = k0;
        org.luaj.vm2.LuaValue a24 = a21.sub(a23);
        while(true) {
            a24 = a24.add(a23);
            if (!a24.testfor_b(a22, a23)) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u12, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a25 = ((org.luaj.vm2.LuaValue)a0).get(a24).call();
            if (!a25.eq_b((org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE)) {
                org.luaj.vm2.Varargs a26 = a25;
                return a26;
            }
        }
    }
}
