package lang;
public class Lang$luaj$complex_parse$6 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue u3;
    org.luaj.vm2.LuaValue u4;
    org.luaj.vm2.LuaValue u5;
    org.luaj.vm2.LuaValue u6;
    org.luaj.vm2.LuaValue u7;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("");
        k1 = org.luaj.vm2.LuaString.valueOf("tostring");
        k2 = org.luaj.vm2.LuaString.valueOf("Not Symbol");
    }
    
    public Lang$luaj$complex_parse$6() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(1);
        if (this.u0.call().toboolean()) {
            org.luaj.vm2.Varargs a0 = org.luaj.vm2.LuaValue.FALSE;
            return a0;
        }
        org.luaj.vm2.LuaValue a1 = this.u1.call();
        org.luaj.vm2.LuaValue a2 = k0;
        if (!this.u2[0].call(a1).toboolean()) {
            this.u3.call(a1);
            org.luaj.vm2.Varargs a3 = org.luaj.vm2.LuaValue.FALSE;
            return a3;
        }
        while(true) {
            if (this.u2[0].call(a1).toboolean() && !this.u0.call().toboolean()) {
                a2 = this.u4.get(k1).call(a2).concat(this.u4.get(k1).call(a1));
                a1 = this.u1.call();
                continue;
            }
            if (this.u2[0].call(a1).toboolean()) {
                a2 = this.u4.get(k1).call(a2).concat(this.u4.get(k1).call(a1));
            } else {
                this.u3.call(a1);
            }
            if (this.u5.get(a2).eq_b(org.luaj.vm2.LuaValue.NIL)) {
                this.u6.call(k2.concat(this.u4.get(k1).call(a2)));
            }
            return org.luaj.vm2.LuaValue.tailcallOf(this.u7, (org.luaj.vm2.Varargs)a2);
        }
    }
}
