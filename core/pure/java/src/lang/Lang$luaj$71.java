package lang;
public class Lang$luaj$71 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue[] u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue[] u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue u8;
    org.luaj.vm2.LuaValue u9;
    org.luaj.vm2.LuaValue[] u10;
    org.luaj.vm2.LuaValue u11;
    org.luaj.vm2.LuaValue u12;
    org.luaj.vm2.LuaValue u13;
    org.luaj.vm2.LuaValue u14;
    org.luaj.vm2.LuaValue[] u15;
    org.luaj.vm2.LuaValue u16;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(0);
    }
    
    public Lang$luaj$71() {
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
            if (this.u2[0].call(a7).toboolean()) {
                this.u3.call((org.luaj.vm2.LuaValue)a5, a7);
                a6 = org.luaj.vm2.LuaValue.TRUE;
                a7 = this.u4[0];
            } else {
                if (!this.u5.call(a7).toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(a3, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                org.luaj.vm2.LuaValue a8 = this.u3;
                org.luaj.vm2.Varargs a9 = this.u6.invoke((org.luaj.vm2.Varargs)a7);
                org.luaj.vm2.LuaValue[] a10 = new org.luaj.vm2.LuaValue[1];
                a10[0] = a5;
                a8.invoke(org.luaj.vm2.LuaValue.varargsOf(a10, a9));
                a7 = this.u7.call(a7);
            }
        }
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        org.luaj.vm2.LuaValue a11 = (((org.luaj.vm2.LuaValue)a6).toboolean()) ? this.u8.call((org.luaj.vm2.LuaValue)a5) : a4;
        org.luaj.vm2.LuaTable a12 = org.luaj.vm2.LuaValue.tableOf(0, 0);
        org.luaj.vm2.LuaValue a13 = this.u9;
        Lang$luaj$71$0 a14 = new Lang$luaj$71$0();
        a14.u0 = a5;
        a14.u1 = this.u10;
        a14.u2 = this.u3;
        a14.u3 = a12;
        a13.call(a0, (org.luaj.vm2.LuaValue)a14);
        org.luaj.vm2.LuaValue a15 = ((org.luaj.vm2.LuaValue)a12).len().sub(k0);
        org.luaj.vm2.LuaValue a16 = a11;
        while(k1.lteq_b(a15)) {
            a16 = this.u11.call(((org.luaj.vm2.LuaValue)a12).get(a15.add(k0)), a16);
            a15 = a15.sub(k0);
        }
        org.luaj.vm2.LuaValue a17 = ((org.luaj.vm2.LuaValue)a12).len().sub(k0);
        while(k1.lteq_b(a17)) {
            a11 = this.u11.call(this.u12.invoke(this.u13.invoke(a0, (org.luaj.vm2.Varargs)((org.luaj.vm2.LuaValue)a12).get(a17.add(k0))).subargs(1)).arg1(), a11);
            a17 = a17.sub(k0);
        }
        org.luaj.vm2.LuaValue a18 = this.u14;
        org.luaj.vm2.LuaValue a19 = this.u15[0];
        org.luaj.vm2.LuaValue a20 = this.u16;
        org.luaj.vm2.LuaValue a21 = this.u11;
        org.luaj.vm2.LuaValue a22 = this.u12;
        org.luaj.vm2.LuaValue a23 = this.u14;
        org.luaj.vm2.LuaValue a24 = this.u15[0];
        org.luaj.vm2.Varargs a25 = this.u16.invoke(a16, (org.luaj.vm2.Varargs)a2);
        org.luaj.vm2.LuaValue[] a26 = new org.luaj.vm2.LuaValue[1];
        a26[0] = a24;
        org.luaj.vm2.Varargs a27 = a21.invoke(a22.invoke(a23.invoke(org.luaj.vm2.LuaValue.varargsOf(a26, a25)).subargs(1)).arg1(), (org.luaj.vm2.Varargs)a11);
        org.luaj.vm2.LuaValue[] a28 = new org.luaj.vm2.LuaValue[1];
        a28[0] = a4;
        org.luaj.vm2.Varargs a29 = a20.invoke(org.luaj.vm2.LuaValue.varargsOf(a28, a27));
        org.luaj.vm2.LuaValue[] a30 = new org.luaj.vm2.LuaValue[1];
        a30[0] = a19;
        return org.luaj.vm2.LuaValue.tailcallOf(a18, org.luaj.vm2.LuaValue.varargsOf(a30, a29));
    }
}
