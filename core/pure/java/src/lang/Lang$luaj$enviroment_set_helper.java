package lang;
public class Lang$luaj$enviroment_set_helper extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
        k2 = org.luaj.vm2.LuaString.valueOf("ipairs");
        k3 = org.luaj.vm2.LuaValue.valueOf(0);
        k4 = org.luaj.vm2.LuaValue.valueOf(3);
    }
    
    public Lang$luaj$enviroment_set_helper() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        org.luaj.vm2.LuaValue a4 = a.arg(5);
        a.subargs(6);
        if (!a0.get(k0).toboolean()) {
            org.luaj.vm2.LuaValue a5 = this.u6;
            org.luaj.vm2.LuaValue a6 = this.u3.call(a0);
            org.luaj.vm2.LuaValue[] a7 = new org.luaj.vm2.LuaValue[5];
            a7[0] = a6;
            a7[1] = a1;
            a7[2] = a2;
            a7[3] = a3;
            a7[4] = a4;
            return org.luaj.vm2.LuaValue.tailcallOf(a5, org.luaj.vm2.LuaValue.varargsOf(a7));
        }
        org.luaj.vm2.LuaValue a8 = this.u0.call(a0);
        org.luaj.vm2.LuaValue a9 = this.u1.call(a1);
        org.luaj.vm2.LuaValue a10 = a9.get(k0);
        org.luaj.vm2.LuaValue a11 = a9.get(k1);
        org.luaj.vm2.Varargs a12 = this.u2.get(k2).invoke((org.luaj.vm2.Varargs)a10);
        org.luaj.vm2.LuaValue a13 = a12.arg1();
        org.luaj.vm2.LuaValue a14 = a12.arg(2);
        org.luaj.vm2.LuaValue a15 = a12.arg(3);
        org.luaj.vm2.LuaValue a16 = a8;
        while(true) {
            org.luaj.vm2.Varargs a17 = a13.invoke(a14, (org.luaj.vm2.Varargs)a15);
            a15 = a17.arg1();
            org.luaj.vm2.LuaValue a18 = a17.arg(2);
            if (a15.isnil()) {
                if (!this.u5.call(a16).toboolean()) {
                    org.luaj.vm2.LuaValue a19 = this.u6;
                    org.luaj.vm2.LuaValue[] a20 = new org.luaj.vm2.LuaValue[5];
                    a20[0] = a16;
                    a20[1] = a11;
                    a20[2] = a2;
                    a20[3] = a16;
                    a20[4] = a8;
                    return org.luaj.vm2.LuaValue.tailcallOf(a19, org.luaj.vm2.LuaValue.varargsOf(a20));
                }
                a16.set(k0, (org.luaj.vm2.LuaValue)org.luaj.vm2.LuaValue.FALSE);
                a16.set(k1, a11);
                a16.set(k4, a2);
                org.luaj.vm2.LuaValue a21 = a8.get(k0);
                a3.set(k0, a21);
                org.luaj.vm2.LuaValue a22 = a8.get(k1);
                a3.set(k1, a22);
                org.luaj.vm2.LuaValue a23 = a8.get(k4);
                a3.set(k4, a23);
                org.luaj.vm2.Varargs a24 = a4;
                return a24;
            } else {
                org.luaj.vm2.LuaValue a25 = null;

                if (a16.get(k1).get(a18).eq_b(org.luaj.vm2.LuaValue.NIL)) {
                    org.luaj.vm2.LuaTable a26 = org.luaj.vm2.LuaValue.tableOf(3, 0);
                    org.luaj.vm2.LuaBoolean a27 = org.luaj.vm2.LuaValue.TRUE;
                    org.luaj.vm2.LuaTable a28 = org.luaj.vm2.LuaValue.tableOf(0, 0);
                    org.luaj.vm2.LuaValue a29 = org.luaj.vm2.LuaValue.NIL;
                    ((org.luaj.vm2.LuaValue)a26).rawset(1, (org.luaj.vm2.LuaValue)a27);
                    ((org.luaj.vm2.LuaValue)a26).rawset(2, (org.luaj.vm2.LuaValue)a28);
                    ((org.luaj.vm2.LuaValue)a26).rawset(3, a29);
                    a25 = a26;
                } else {
                    org.luaj.vm2.LuaValue a30 = a16.get(k1).get(a18);
                    a25 = (a30.get(k3).toboolean()) ? this.u0.call(a30) : this.u3.call(a30);
                }
                this.u4.call((org.luaj.vm2.LuaValue)((a25.eq_b(org.luaj.vm2.LuaValue.NIL)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE));
                a16.get(k1).set(a18, a25);
                a16 = a25;
            }
        }
    }
}
