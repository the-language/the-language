package lang;
public class Lang$luaj$47 extends org.luaj.vm2.lib.TwoArgFunction {
    org.luaj.vm2.LuaValue u0;
    org.luaj.vm2.LuaValue u1;
    final static org.luaj.vm2.LuaValue k0;
    final static org.luaj.vm2.LuaValue k1;
    final static org.luaj.vm2.LuaValue k2;
    final static org.luaj.vm2.LuaValue k3;
    
    static {
        k0 = org.luaj.vm2.LuaValue.valueOf(1);
        k1 = org.luaj.vm2.LuaValue.valueOf(2);
        k2 = org.luaj.vm2.LuaValue.valueOf(3);
        k3 = org.luaj.vm2.LuaValue.valueOf(4);
    }
    
    public Lang$luaj$47() {
    }
    
    final public org.luaj.vm2.LuaValue call(org.luaj.vm2.LuaValue a, org.luaj.vm2.LuaValue a0) {
        this.u0.invoke(this.u1.invoke((org.luaj.vm2.Varargs)a).subargs(1));
        this.u0.call(this.u1.call(a0).not());
        org.luaj.vm2.LuaValue a1 = a0.get(k0);
        a.set(k0, a1);
        org.luaj.vm2.LuaValue a2 = a0.get(k1);
        a.set(k1, a2);
        org.luaj.vm2.LuaValue a3 = a0.get(k2);
        a.set(k2, a3);
        org.luaj.vm2.LuaValue a4 = a0.get(k3);
        a.set(k3, a4);
        return org.luaj.vm2.LuaValue.NONE;
    }
}
