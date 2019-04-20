package lang;
public class Lang$luaj$76$7 extends org.luaj.vm2.lib.VarArgFunction {
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
    org.luaj.vm2.LuaValue[] u10;
    org.luaj.vm2.LuaValue[] u11;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("(");
        k1 = org.luaj.vm2.LuaString.valueOf("!!@@READ||HOLE@@!!");
        k2 = org.luaj.vm2.LuaString.valueOf(")");
        k3 = org.luaj.vm2.LuaString.valueOf(".");
    }
    
    public Lang$luaj$76$7() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (this.u0.call().toboolean()) {
            org.luaj.vm2.Varargs a0 = org.luaj.vm2.LuaValue.FALSE;
            return a0;
        }
        org.luaj.vm2.LuaValue a1 = this.u1.call();
        if (!a1.eq_b(k0)) {
            this.u2.call(a1);
            org.luaj.vm2.Varargs a2 = org.luaj.vm2.LuaValue.FALSE;
            return a2;
        }
        org.luaj.vm2.LuaValue a3 = this.u3.call(k1);
        org.luaj.vm2.LuaValue[] a4 = Lang$luaj$76$7.newupe();
        a4[0] = a3;
        org.luaj.vm2.LuaValue dummy = org.luaj.vm2.LuaValue.NIL;
        Lang$luaj$76$7$0 a5 = new Lang$luaj$76$7$0();
        a5.u0 = a4;
        a5.u1 = a3;
        a5.u2 = this.u4;
        a5.u3 = this.u5;
        a5.u4 = this.u6;
        org.luaj.vm2.LuaValue dummy0 = org.luaj.vm2.LuaValue.NIL;
        Lang$luaj$76$7$1 a6 = new Lang$luaj$76$7$1();
        a6.u0 = a5;
        a6.u1 = this.u7;
        a6.u2 = a3;
        while(true) {
            this.u8.call();
            if (this.u0.call().toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u9, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a7 = this.u1.call();
            if (a7.eq_b(k2)) {
                ((org.luaj.vm2.LuaValue)a5).call(this.u10[0]);
                org.luaj.vm2.Varargs a8 = a4[0];
                return a8;
            }
            if (a7.eq_b(k3)) {
                this.u8.call();
                ((org.luaj.vm2.LuaValue)a5).call(this.u11[0].call());
                this.u8.call();
                if (this.u0.call().toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u9, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (this.u1.call().eq_b(k2)) {
                    org.luaj.vm2.Varargs a9 = a4[0];
                    return a9;
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u9, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            } else {
                this.u2.call(a7);
                ((org.luaj.vm2.LuaValue)a6).call(this.u11[0].call());
            }
        }
    }
}
