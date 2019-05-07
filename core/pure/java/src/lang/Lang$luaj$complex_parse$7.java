package lang;
public class Lang$luaj$complex_parse$7 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    org.luaj.vm2.LuaValue[] u8;
    org.luaj.vm2.LuaValue[] u9;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("(");
        k1 = org.luaj.vm2.LuaString.valueOf(")");
        k2 = org.luaj.vm2.LuaString.valueOf(".");
    }
    
    public Lang$luaj$complex_parse$7() {
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
        org.luaj.vm2.LuaValue a3 = this.u3.call();
        org.luaj.vm2.LuaValue[] a4 = Lang$luaj$complex_parse$7.newupe();
        a4[0] = a3;
        org.luaj.vm2.LuaValue a5 = a4[0];
        Lang$luaj$complex_parse$7$o a6 = new Lang$luaj$complex_parse$7$o();
        a6.u0 = this.u3;
        a6.u1 = this.u4;
        a6.u2 = a4;
        a6.u3 = this.u5;
        while(true) {
            this.u6.call();
            if (this.u0.call().toboolean()) {
                return org.luaj.vm2.LuaValue.tailcallOf(this.u7, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            }
            org.luaj.vm2.LuaValue a7 = this.u1.call();
            if (a7.eq_b(k1)) {
                this.u4.call(a4[0], this.u8[0]);
                org.luaj.vm2.Varargs a8 = a5;
                return a8;
            }
            if (a7.eq_b(k2)) {
                this.u6.call();
                org.luaj.vm2.LuaValue a9 = this.u9[0].call();
                this.u4.call(a4[0], a9);
                this.u6.call();
                if (this.u0.call().toboolean()) {
                    return org.luaj.vm2.LuaValue.tailcallOf(this.u7, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
                }
                if (this.u1.call().eq_b(k1)) {
                    org.luaj.vm2.Varargs a10 = a5;
                    return a10;
                }
                return org.luaj.vm2.LuaValue.tailcallOf(this.u7, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
            } else {
                this.u2.call(a7);
                ((org.luaj.vm2.LuaValue)a6).call(this.u9[0].call());
            }
        }
    }
}
