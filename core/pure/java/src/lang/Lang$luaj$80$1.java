package lang;
public class Lang$luaj$80$1 extends org.luaj.vm2.lib.ZeroArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    org.luaj.vm2.LuaValue u2;
    org.luaj.vm2.LuaValue[] u3;
    org.luaj.vm2.LuaValue[] u4;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    
    static {
        k0 = org.luaj.vm2.LuaString.valueOf("string");
        k1 = org.luaj.vm2.LuaString.valueOf("sub");
        k2 = org.luaj.vm2.LuaValue.valueOf(1);
    }
    
    public Lang$luaj$80$1() {
    }
    
    final public org.luaj.vm2.LuaValue call() {
        this.u0.call(this.u1.call().not());
        org.luaj.vm2.LuaValue a = this.u2.get(k0).get(k1).call(this.u3[0], this.u4[0].add(k2), this.u4[0].add(k2));
        org.luaj.vm2.LuaValue a0 = this.u4[0].add(k2);
        this.u4[0] = a0;
        return a;
    }
}
