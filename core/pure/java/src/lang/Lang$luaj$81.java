package lang;
public class Lang$luaj$81 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue u17;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
    }
    
    public Lang$luaj$81() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue a2 = a.arg(3);
        org.luaj.vm2.LuaValue a3 = a.arg(4);
        a.subargs(5);
        org.luaj.vm2.LuaValue a4 = this.u0[0].call(a1);
        org.luaj.vm2.LuaTable a5 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaBoolean a6 = org.luaj.vm2.LuaValue.FALSE;
        org.luaj.vm2.LuaValue a7 = a4;
        while(!this.u1.call(a7).toboolean()) {
            org.luaj.vm2.LuaValue a8 = this.u2.call(a7);
            this.u3.call((org.luaj.vm2.LuaValue)((a8.eq_b(org.luaj.vm2.LuaValue.NIL)) ? org.luaj.vm2.LuaValue.FALSE : org.luaj.vm2.LuaValue.TRUE));
            if (a8.toboolean()) {
                this.u4.call((org.luaj.vm2.LuaValue)a5, a7);
                a6 = org.luaj.vm2.LuaValue.TRUE;
                a7 = this.u5[0];
            } else {
                if (!this.u6.call(a7).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a9 = this.u4;
                org.luaj.vm2.Varargs a10 = this.u7.invoke((org.luaj.vm2.Varargs)a7);
                org.luaj.vm2.LuaValue[] a11 = new org.luaj.vm2.LuaValue[1];
                a11[0] = a5;
                a9.invoke(org.luaj.vm2.LuaValue.varargsOf(a11, a10));
                a7 = this.u8.call(a7);
            }
        }

        org.luaj.vm2.LuaValue a12 = (((org.luaj.vm2.LuaValue)a6).toboolean()) ? this.u9.call((org.luaj.vm2.LuaValue)a5) : a4;
        org.luaj.vm2.LuaTable a13 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a14 = this.u10;
        Lang$luaj$81$0 a15 = new Lang$luaj$81$0();
        a15.u0 = a5;
        a15.u1 = this.u11;
        a15.u2 = this.u4;
        a15.u3 = a13;
        a14.call(a0, (org.luaj.vm2.LuaValue)a15);
        org.luaj.vm2.LuaValue a16 = ((org.luaj.vm2.LuaValue)a13).len().sub(k0);
        org.luaj.vm2.LuaValue a17 = a12;
        while(k1.lteq_b(a16)) {
            a17 = this.u12.call(((org.luaj.vm2.LuaValue)a13).get(a16.add(k0)), a17);
            a16 = a16.sub(k0);
        }
        org.luaj.vm2.LuaValue a18 = ((org.luaj.vm2.LuaValue)a13).len().sub(k0);
        while(k1.lteq_b(a18)) {
            a12 = this.u12.call(this.u13.invoke(this.u14.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a13).get(a18.add(k0))).subargs(1)).arg1(), a12);
            a18 = a18.sub(k0);
        }
        org.luaj.vm2.LuaValue a19 = this.u15;
        org.luaj.vm2.LuaValue a20 = this.u16[0];
        org.luaj.vm2.LuaValue a21 = this.u17;
        org.luaj.vm2.LuaValue a22 = this.u12;
        org.luaj.vm2.LuaValue a23 = this.u13;
        org.luaj.vm2.LuaValue a24 = this.u15;
        org.luaj.vm2.LuaValue a25 = this.u16[0];
        org.luaj.vm2.Varargs a26 = this.u17.invoke(a17, (org.luaj.vm2.Varargs)a2);
        org.luaj.vm2.LuaValue[] a27 = new org.luaj.vm2.LuaValue[1];
        a27[0] = a25;
        org.luaj.vm2.Varargs a28 = a22.invoke(a23.invoke(a24.invoke(org.luaj.vm2.LuaValue.varargsOf(a27, a26)).subargs(1)).arg1(), (org.luaj.vm2.Varargs)a12);
        org.luaj.vm2.LuaValue[] a29 = new org.luaj.vm2.LuaValue[1];
        a29[0] = a4;
        org.luaj.vm2.Varargs a30 = a21.invoke(org.luaj.vm2.LuaValue.varargsOf(a29, a28));
        org.luaj.vm2.LuaValue[] a31 = new org.luaj.vm2.LuaValue[1];
        a31[0] = a20;
        return org.luaj.vm2.LuaValue.tailcallOf(a19, org.luaj.vm2.LuaValue.varargsOf(a31, a30));
    }
}
