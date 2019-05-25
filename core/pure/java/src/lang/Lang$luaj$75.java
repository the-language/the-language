package lang;
public class Lang$luaj$75 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    final static org.luaj.vm2.LuaValue k4;
    final static org.luaj.vm2.LuaValue k5;
    final static org.luaj.vm2.LuaValue k6;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaString.valueOf("^");
        k2 = org.luaj.vm2.LuaString.valueOf(".");
        k3 = org.luaj.vm2.LuaString.valueOf("_");
        k4 = org.luaj.vm2.LuaString.valueOf("#");
        k5 = org.luaj.vm2.LuaString.valueOf("!");
        k6 = org.luaj.vm2.LuaString.valueOf("$");
    }
    
    public Lang$luaj$75() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        org.luaj.vm2.LuaTable a1 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaTable a2 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a3 = k0;
        org.luaj.vm2.LuaValue a4 = a0.len();
        org.luaj.vm2.LuaValue a5 = k0;
        org.luaj.vm2.LuaValue a6 = a3.sub(a5);
        while(true) {
            a6 = a6.add(a5);
            if (!a6.testfor_b(a4, a5)) {
                org.luaj.vm2.LuaTable a7 = org.luaj.vm2.LuaValue.tableOf(2, 0);
                ((org.luaj.vm2.LuaValue)a7).rawset(1, (org.luaj.vm2.LuaValue)a1);
                ((org.luaj.vm2.LuaValue)a7).rawset(2, (org.luaj.vm2.LuaValue)a2);
                org.luaj.vm2.Varargs a8 = a7;
                return a8;
            }
            org.luaj.vm2.LuaValue a9 = a0.get(a6);
            org.luaj.vm2.LuaValue a10 = this.u0.call(a9);
            org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
            Lang$luaj$75$0 a11 = new Lang$luaj$75$0();
            a11.u0 = this.u1;
            a11.u1 = a1;
            a11.u2 = a2;
            if (this.u2.call(a10).toboolean()) {
                this.u1.call((org.luaj.vm2.LuaValue)a1, k1);
                org.luaj.vm2.LuaValue a12 = this.u1;
                org.luaj.vm2.Varargs a13 = this.u3.invoke((org.luaj.vm2.Varargs)a10);
                org.luaj.vm2.LuaValue[] a14 = new org.luaj.vm2.LuaValue[1];
                a14[0] = a1;
                a12.invoke(org.luaj.vm2.LuaValue.varargsOf(a14, a13));
                this.u1.call((org.luaj.vm2.LuaValue)a1, k1);
            } else if (this.u4.call(a10).toboolean()) {
                org.luaj.vm2.LuaValue a15 = k2;
                org.luaj.vm2.LuaValue a16 = this.u5;
                org.luaj.vm2.LuaValue a17 = this.u6;
                org.luaj.vm2.LuaValue[] a18 = new org.luaj.vm2.LuaValue[4];
                a18[0] = a10;
                a18[1] = a15;
                a18[2] = a16;
                a18[3] = a17;
                ((org.luaj.vm2.LuaValue)a11).invoke(org.luaj.vm2.LuaValue.varargsOf(a18));
            } else if (this.u7.call(a10).toboolean()) {
                this.u1.call((org.luaj.vm2.LuaValue)a1, k3);
            } else if (this.u8.call(a10).toboolean()) {
                org.luaj.vm2.LuaValue a19 = k4;
                org.luaj.vm2.LuaValue a20 = this.u9;
                org.luaj.vm2.LuaValue a21 = this.u10;
                org.luaj.vm2.LuaValue[] a22 = new org.luaj.vm2.LuaValue[4];
                a22[0] = a10;
                a22[1] = a19;
                a22[2] = a20;
                a22[3] = a21;
                ((org.luaj.vm2.LuaValue)a11).invoke(org.luaj.vm2.LuaValue.varargsOf(a22));
            } else if (this.u11.call(a10).toboolean()) {
                org.luaj.vm2.LuaValue a23 = k5;
                org.luaj.vm2.LuaValue a24 = this.u12;
                org.luaj.vm2.LuaValue a25 = this.u13;
                org.luaj.vm2.LuaValue[] a26 = new org.luaj.vm2.LuaValue[4];
                a26[0] = a10;
                a26[1] = a23;
                a26[2] = a24;
                a26[3] = a25;
                ((org.luaj.vm2.LuaValue)a11).invoke(org.luaj.vm2.LuaValue.varargsOf(a26));
            } else {
                if (!this.u14.call(a10).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u19, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a27 = this.u15.call(a10);
                org.luaj.vm2.LuaValue a28 = k6;
                Lang$luaj$75$1 a29 = new Lang$luaj$75$1();
                a29.u0 = this.u16;
                a29.u1 = this.u17;
                org.luaj.vm2.LuaValue a30 = this.u18;
                org.luaj.vm2.LuaValue[] a31 = new org.luaj.vm2.LuaValue[4];
                a31[0] = a27;
                a31[1] = a28;
                a31[2] = a29;
                a31[3] = a30;
                ((org.luaj.vm2.LuaValue)a11).invoke(org.luaj.vm2.LuaValue.varargsOf(a31));
            }
        }
    }
}
