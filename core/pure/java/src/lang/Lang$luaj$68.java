package lang;
public class Lang$luaj$68 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue[] u9;
    org.luaj.vm2.LuaValue u10;
    org.luaj.vm2.LuaValue[] u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue[] u16;
    org.luaj.vm2.LuaValue u17;
    org.luaj.vm2.LuaValue u18;
    org.luaj.vm2.LuaValue u19;
    org.luaj.vm2.LuaValue u20;
    org.luaj.vm2.LuaValue[] u21;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("__TS__ArrayPush");
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
        k2 = org.luaj.vm2.LuaValue.valueOf(0);
    }
    
    public Lang$luaj$68() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        Lang$luaj$68.newupn();
        Lang$luaj$68.newupn();
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue[] a2 = Lang$luaj$68.newupe();
        a2[0] = a1;
        org.luaj.vm2.LuaValue a3 = a.arg(3);
        org.luaj.vm2.LuaValue a4 = a.arg(4);
        org.luaj.vm2.LuaValue[] a5 = Lang$luaj$68.newupe();
        a5[0] = a4;
        a.subargs(5);
        if (a5[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a5[0] = org.luaj.vm2.LuaValue.FALSE;
        }
        Lang$luaj$68$f a6 = new Lang$luaj$68$f();
        a6.u0 = a5;
        a6.u1 = this.u0;
        a6.u2 = this.u1;
        a6.u3 = this.u2;
        a6.u4 = this.u3;
        a6.u5 = this.u4;
        a6.u6 = a0;
        a6.u7 = this.u5;
        a6.u8 = this.u6;
        a6.u9 = a2;
        a6.u10 = a3;
        a2[0] = this.u7[0].call(a2[0]);
        org.luaj.vm2.LuaTable a7 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaBoolean a8 = org.luaj.vm2.LuaValue.FALSE;
        org.luaj.vm2.LuaValue a9 = a2[0];
        while(!this.u8.call(a9).toboolean()) {
            if (this.u9[0].call(a9).toboolean()) {
                this.u10.get(k0).call((org.luaj.vm2.LuaValue)a7, a9);
                a8 = org.luaj.vm2.LuaValue.TRUE;
                a9 = this.u11[0];
            } else {
                if (!this.u12.call(a9).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a10 = this.u10.get(k0);
                org.luaj.vm2.Varargs a11 = this.u13.invoke((org.luaj.vm2.Varargs)a9);
                org.luaj.vm2.LuaValue[] a12 = new org.luaj.vm2.LuaValue[1];
                a12[0] = a7;
                a10.invoke(org.luaj.vm2.LuaValue.varargsOf(a12, a11));
                a9 = this.u14.call(a9);
            }
        }
        org.luaj.vm2.LuaValue a13 = a2[0];
        if (((org.luaj.vm2.LuaValue)a8).toboolean()) {
            a13 = this.u6.call((org.luaj.vm2.LuaValue)a7);
        }
        org.luaj.vm2.LuaTable a14 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a15 = this.u15;
        Lang$luaj$68$1 a16 = new Lang$luaj$68$1();
        a16.u0 = a7;
        a16.u1 = this.u16;
        a16.u2 = this.u10;
        a16.u3 = a14;
        a15.call(a0, (org.luaj.vm2.LuaValue)a16);
        org.luaj.vm2.LuaValue a17 = ((org.luaj.vm2.LuaValue)a14).len().sub(k1);
        org.luaj.vm2.LuaValue a18 = a13;
        while(k2.lteq_b(a17)) {
            a18 = this.u17.call(((org.luaj.vm2.LuaValue)a14).get(a17.add(k1)), a18);
            a17 = a17.sub(k1);
        }
        org.luaj.vm2.LuaValue a19 = ((org.luaj.vm2.LuaValue)a14).len().sub(k1);
        while(k2.lteq_b(a19)) {
            a13 = this.u17.call(this.u18.invoke(this.u19.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a14).get(a19.add(k1))).subargs(1)).arg1(), a13);
            a19 = a19.sub(k1);
        }
        org.luaj.vm2.LuaValue a20 = this.u20;
        org.luaj.vm2.LuaValue a21 = this.u21[0];
        org.luaj.vm2.LuaValue a22 = this.u2;
        org.luaj.vm2.LuaValue a23 = a2[0];
        org.luaj.vm2.LuaValue a24 = this.u17;
        org.luaj.vm2.LuaValue a25 = this.u18;
        org.luaj.vm2.LuaValue a26 = this.u20;
        org.luaj.vm2.LuaValue a27 = this.u21[0];
        org.luaj.vm2.Varargs a28 = this.u2.invoke(a18, (org.luaj.vm2.Varargs)a3);
        org.luaj.vm2.LuaValue[] a29 = new org.luaj.vm2.LuaValue[1];
        a29[0] = a27;
        org.luaj.vm2.Varargs a30 = a24.invoke(a25.invoke(a26.invoke(org.luaj.vm2.LuaValue.varargsOf(a29, a28)).subargs(1)).arg1(), (org.luaj.vm2.Varargs)a13);
        org.luaj.vm2.LuaValue[] a31 = new org.luaj.vm2.LuaValue[1];
        a31[0] = a23;
        org.luaj.vm2.Varargs a32 = a22.invoke(org.luaj.vm2.LuaValue.varargsOf(a31, a30));
        org.luaj.vm2.LuaValue[] a33 = new org.luaj.vm2.LuaValue[1];
        a33[0] = a21;
        return org.luaj.vm2.LuaValue.tailcallOf(a20, org.luaj.vm2.LuaValue.varargsOf(a33, a32));
    }
}
