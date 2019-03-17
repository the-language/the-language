package lang;
public class lang_luaj$76$17$1 extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public lang_luaj$76$17$1() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        a.subargs(3);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, (org.luaj.vm2.Varargs)org.luaj.vm2.LuaValue.NONE);
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
