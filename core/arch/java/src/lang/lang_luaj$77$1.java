package lang;
public class lang_luaj$77$1 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue[] u2;
    org.luaj.vm2.LuaValue[] u3;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("sub");
        k1 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public lang_luaj$77$1() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        this.u0.call(this.u1.call().not());
        org.luaj.vm2.LuaValue a = this.u2[0];
        org.luaj.vm2.LuaValue a0 = a.get(k0).call(a, this.u3[0].add(k1), this.u3[0].add(k1));
        org.luaj.vm2.LuaValue a1 = this.u3[0].add(k1);
        this.u3[0] = a1;
        return a0;
    }
}
