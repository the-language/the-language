public class lang$luaj$56 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue[] u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue[] u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue[] u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue[] u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue[] u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue u15;
    org.luaj.vm2.LuaValue u16;
    org.luaj.vm2.LuaValue[] u17;
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
    
    public lang$luaj$56() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        lang$luaj$56.newupn();
        lang$luaj$56.newupn();
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        org.luaj.vm2.LuaValue a1 = a.arg(2);
        org.luaj.vm2.LuaValue[] a2 = lang$luaj$56.newupe();
        a2[0] = a1;
        org.luaj.vm2.LuaValue a3 = a.arg(3);
        org.luaj.vm2.LuaValue a4 = a.arg(4);
        org.luaj.vm2.LuaValue[] a5 = lang$luaj$56.newupe();
        a5[0] = a4;
        a.subargs(5);
        if (a5[0].eq_b(org.luaj.vm2.LuaValue.NIL)) {
            a5[0] = org.luaj.vm2.LuaValue.FALSE;
        }
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        lang$luaj$56$0 a6 = new lang$luaj$56$0();
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
        org.luaj.vm2.LuaValue dummy0 = org.luaj.vm2.LuaValue.NIL;
        lang$luaj$56$1 a7 = new lang$luaj$56$1();
        a7.u0 = this.u2;
        a7.u1 = this.u3;
        a7.u2 = this.u7;
        a2[0] = this.u8[0].call(a2[0]);
        org.luaj.vm2.LuaTable a8 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaBoolean a9 = org.luaj.vm2.LuaValue.FALSE;
        org.luaj.vm2.LuaValue a10 = a2[0];
        while(!this.u9.call(a10).toboolean()) {
            if (this.u10[0].call(a10).toboolean()) {
                this.u11.get(k0).call((org.luaj.vm2.LuaValue)a8, a10);
                a9 = org.luaj.vm2.LuaValue.TRUE;
                a10 = this.u12[0];
            } else {
                if (!this.u13.call(a10).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf((org.luaj.vm2.LuaValue)a6, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a11 = this.u11.get(k0);
                org.luaj.vm2.Varargs a12 = this.u14.invoke((org.luaj.vm2.Varargs)a10);
                org.luaj.vm2.LuaValue[] a13 = new org.luaj.vm2.LuaValue[1];
                a13[0] = a8;
                a11.invoke(org.luaj.vm2.LuaValue.varargsOf(a13, a12));
                a10 = this.u15.call(a10);
            }
        }
        org.luaj.vm2.LuaValue a14 = a2[0];
        if (((org.luaj.vm2.LuaValue)a9).toboolean()) {
            a14 = this.u6.call((org.luaj.vm2.LuaValue)a8);
        }
        org.luaj.vm2.LuaTable a15 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a16 = this.u16;
        lang$luaj$56$2 a17 = new lang$luaj$56$2();
        a17.u0 = a8;
        a17.u1 = this.u17;
        a17.u2 = this.u11;
        a17.u3 = a15;
        a16.call(a0, (org.luaj.vm2.LuaValue)a17);
        org.luaj.vm2.LuaValue a18 = ((org.luaj.vm2.LuaValue)a15).len().sub(k1);
        org.luaj.vm2.LuaValue a19 = a14;
        while(k2.lteq_b(a18)) {
            a19 = this.u18.call(((org.luaj.vm2.LuaValue)a15).get(a18.add(k1)), a19);
            a18 = a18.sub(k1);
        }
        org.luaj.vm2.LuaValue a20 = ((org.luaj.vm2.LuaValue)a15).len().sub(k1);
        while(k2.lteq_b(a20)) {
            a14 = this.u18.call(((org.luaj.vm2.LuaValue)a7).invoke(this.u19.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a15).get(a20.add(k1))).subargs(1)).arg1(), a14);
            a20 = a20.sub(k1);
        }
        org.luaj.vm2.LuaValue a21 = this.u20;
        org.luaj.vm2.LuaValue a22 = this.u21[0];
        org.luaj.vm2.LuaValue a23 = this.u2;
        org.luaj.vm2.LuaValue a24 = a2[0];
        org.luaj.vm2.LuaValue a25 = this.u18;
        org.luaj.vm2.LuaValue a26 = this.u20;
        org.luaj.vm2.LuaValue a27 = this.u21[0];
        org.luaj.vm2.Varargs a28 = this.u2.invoke(a19, (org.luaj.vm2.Varargs)a3);
        org.luaj.vm2.LuaValue[] a29 = new org.luaj.vm2.LuaValue[1];
        a29[0] = a27;
        org.luaj.vm2.Varargs a30 = a25.invoke(((org.luaj.vm2.LuaValue)a7).invoke(a26.invoke(org.luaj.vm2.LuaValue.varargsOf(a29, a28)).subargs(1)).arg1(), (org.luaj.vm2.Varargs)a14);
        org.luaj.vm2.LuaValue[] a31 = new org.luaj.vm2.LuaValue[1];
        a31[0] = a24;
        org.luaj.vm2.Varargs a32 = a23.invoke(org.luaj.vm2.LuaValue.varargsOf(a31, a30));
        org.luaj.vm2.LuaValue[] a33 = new org.luaj.vm2.LuaValue[1];
        a33[0] = a22;
        return org.luaj.vm2.LuaValue.tailcallOf(a21, org.luaj.vm2.LuaValue.varargsOf(a33, a32));
    }
}
