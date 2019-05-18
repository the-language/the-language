package lang;
public class Lang$luaj$jsArray_to_list extends org.luaj.vm2.lib.VarArgFunction {
    org.luaj.vm2.LuaValue u0;
    
    public Lang$luaj$jsArray_to_list() {
    }
    
    final public org.luaj.vm2.Varargs onInvoke(org.luaj.vm2.Varargs a) {
        org.luaj.vm2.LuaValue a0 = a.arg(1);
        a.subargs(2);
        return org.luaj.vm2.LuaValue.tailcallOf(this.u0, org.luaj.vm2.LuaValue.varargsOf(a0, (org.luaj.vm2.LuaValue)new Lang$luaj$jsArray_to_list$0(), (org.luaj.vm2.Varargs)new Lang$luaj$jsArray_to_list$1()));
    }
    
    final public void initupvalue1(org.luaj.vm2.LuaValue a) {
        this.u0 = a;
    }
}
